//
//  ViewController.swift
//  SimonSays
//
//  Created by Sujanth Sebamalaithasan on 22/8/17.
//  Copyright © 2017 Sujanth Sebamalaithasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var simonSaysLabel: UILabel!
    @IBOutlet weak var startGameBtn: UIButton!
    
    var timer = Timer()
    var simonTimer = Timer()
    var timeInt = 20
    var scoreInt = 0
    var gameInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        simonSaysLabel.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGameBtnPressed(_ sender: Any) {
        
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            self.updateSimon()
        }
    }
    
    @objc func updateTimer() {
        timeInt -= 1
        timeLabel.text = String("Time: \(timeInt)")
        
        if timeInt == 0 {
            timer.invalidate()
            simonTimer.invalidate()
            
            simonSaysLabel.text = "Game Over"
        }
    }
    
    @objc func updateSimon() {
        
        let array = ["Simon Says Swipe Right",
                     "Simon Says Swipe Left",
                     "Simon Says Swipe Up",
                     "Simon Says Swipe Down",
                     "Swipe Right",
                     "Swipe Left",
                     "Swipe Up",
                     "Swipe Down"]
        
        let randomWord = Int(arc4random_uniform(UInt32(array.count)))
        simonSaysLabel.text = array[randomWord]
        
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSimon), userInfo: nil, repeats: false)
    }
    
}

