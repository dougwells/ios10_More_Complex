//
//  ViewController.swift
//  soundShaker
//
//  Created by Doug Wells on 12/17/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var soundTrack = "howl"
    var audioPath: String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        audioPath = Bundle.main.path(forResource: soundTrack, ofType: "mp3")!

    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                player.play()
                
            } catch {
                //Error Message
                print("Ooops.  Try Catch Error setting up AVAudioPlayer")
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

