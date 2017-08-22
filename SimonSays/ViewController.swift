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
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGesture(sender:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startGameBtnPressed(_ sender: Any) {
        
        if timeInt == 20 {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            self.updateSimon()
            
            gameInt = 1
            
            startGameBtn.isEnabled = false
            startGameBtn.alpha = 0.25
        } else if timeInt == 0 {
            timeInt = 20
            scoreInt = 0
            
            timeLabel.text = "Time: \(timeInt)"
            scoreLabel.text = "Score: \(scoreInt)"
            
            startGameBtn.setTitle("Start Game", for: .normal)
        }
    }
    
    @objc func updateTimer() {
        timeInt -= 1
        timeLabel.text = String("Time: \(timeInt)")
        
        if timeInt == 0 {
            timer.invalidate()
            simonTimer.invalidate()
            
            simonSaysLabel.text = "Game Over"
            
            gameInt = 0
            
            startGameBtn.isEnabled = true
            startGameBtn.alpha = 1.0
            
            startGameBtn.setTitle("Restart Game", for: .normal)
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
    
    @objc func swipeGesture(sender: UISwipeGestureRecognizer) {
        
        if gameInt == 1 {
            
            if sender.direction == .right {
                simonTimer.invalidate()
                if simonSaysLabel.text == "Simon Says Swipe Right" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                }
            } else if sender.direction == .left {
                simonTimer.invalidate()
                if simonSaysLabel.text == "Simon Says Swipe Left" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                }
            } else if sender.direction == .up {
                simonTimer.invalidate()
                if simonSaysLabel.text == "Simon Says Swipe Up" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                }
            } else if sender.direction == .down {
                simonTimer.invalidate()
                if simonSaysLabel.text == "Simon Says Swipe Down" {
                    scoreInt += 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                } else {
                    scoreInt -= 1
                    scoreLabel.text = "Score: \(scoreInt)"
                    
                    self.updateSimon()
                }
            }
        }
    }
    
}

