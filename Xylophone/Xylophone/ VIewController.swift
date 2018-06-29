//
//  ViewController.swift
//  Xylophone
//
//  Created by Tim Krull on 06/27/2018.
//  Copyright © 2018 Tim Krull. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
	
	var audioPlayer: AVAudioPlayer! //AVAudioPlayer to play note sounds
	let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"] //array with note sound filenames
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }//viewDidLoad()
	
	//Action for when a note button is pressed
    @IBAction func notePressed(_ sender: UIButton) {
		
		//get name of note sound that needs to be played by checking which button was played
		let selectedSoundFileName: String = soundArray[sender.tag - 1]
		
		//TEST - print out the filename of the note sound selected
		print(selectedSoundFileName)
		
		//call playSound to play the note sound
		playSound(selectedSound: selectedSoundFileName)
		
    }//notePressed(_ sender: UIButton)
	
	func playSound(selectedSound: String) {
		//set a url for the note sound wav file
		let soundURL = Bundle.main.url(forResource: selectedSound, withExtension: "wav")
		
		do {
			//load audioPlayer with the note sound located by soundURL
			audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
		}//do
		catch {
			//print error message
			print(error)
		}//catch
		
		//play the note sound
		audioPlayer.play()
	}//playSound(selectedSound: String)
	
}//ViewController: UIViewController, AVAudioPlayerDelegate

