//
//  ViewController.swift
//  audioPlayer
//
//  Created by Doug Wells on 12/15/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    @IBOutlet var slider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        player.play()
    }

    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
    }
    
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "rainbow", ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
            
            
        } catch {
            
            //process errors
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


