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
    var progress: Double = 0.5
    var playerIsPlaying = false
    var displayLink: CADisplayLink!     //Using as a timer
    
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var timeSlider: UISlider!
    
    @IBAction func play(_ sender: Any) {
        player.play()
        playerIsPlaying = true
        
        /* Runs function upDateTimeSlider each time screen updates
           BUT, we only run fn 1 frame per second
           Note:  Also need .add(to: RunLoop) for this to work
           Could also have used a simple timer = Timer()
        */
        
        displayLink = CADisplayLink(target: self, selector: Selector(("upDateTimeSlider")))
        displayLink.preferredFramesPerSecond = 1
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.commonModes)
    }

    @IBAction func pause(_ sender: Any) {
        displayLink.invalidate()
        player.pause()
        playerIsPlaying = false
        upDateTimeSlider()
    }
    
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
        playerIsPlaying = false
        displayLink.invalidate()
        upDateTimeSlider()
    }
    
    
    @IBAction func sliderMoved(_ sender: Any) {
        player.volume = slider.value
    }
    
    @IBAction func timeSliderMoved(_ sender: Any) {
        displayLink.invalidate()
        progress = Double(timeSlider.value)
        player.currentTime = progress*player.duration
        timeSlider.value = Float(progress)
    }
    
    func upDateTimeSlider(){
        progress = Double(player.currentTime/player.duration)
        self.timeSlider.value = Float(progress)
        print("TimeSlider.value = ", self.timeSlider.value)


    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioPath = Bundle.main.path(forResource: "rainbow", ofType: "mp3")
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            progress = 0
            
            
            
        } catch {
            
            //process errors
        }
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


