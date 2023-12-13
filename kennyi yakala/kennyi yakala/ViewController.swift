//
//  ViewController.swift
//  kennyi yakala
//
//  Created by Olgun ‏‏‎‏‏‎ on 21.10.2023.
//

import UIKit

class ViewController: UIViewController {
    var score = 0
    var timer = Timer()
    var counter = 0
    var helloArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var highscoreLabel: UILabel!
    
    @IBOutlet weak var hello1: UIImageView!
    
    
    @IBOutlet weak var hello2: UIImageView!
    
    
    @IBOutlet weak var hello3: UIImageView!
    
    @IBOutlet weak var hello4: UIImageView!
    
    
    @IBOutlet weak var hello5: UIImageView!
    
    @IBOutlet weak var hello6: UIImageView!
    
    
    @IBOutlet weak var hello7: UIImageView!
    
    
    @IBOutlet weak var hello8: UIImageView!
    
    
    @IBOutlet weak var hello9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighScore == nil {
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highscoreLabel.text = "Highscore: \(highScore)"
        }
        hello1.isUserInteractionEnabled = true
        hello2.isUserInteractionEnabled = true
        hello3.isUserInteractionEnabled = true
        hello4.isUserInteractionEnabled = true
        hello5.isUserInteractionEnabled = true
        hello6.isUserInteractionEnabled = true
        hello7.isUserInteractionEnabled = true
        hello8.isUserInteractionEnabled = true
        hello9.isUserInteractionEnabled = true
        
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        hello1.addGestureRecognizer(recognizer1)
        hello2.addGestureRecognizer(recognizer2)
        hello3.addGestureRecognizer(recognizer3)
        hello4.addGestureRecognizer(recognizer4)
        hello5.addGestureRecognizer(recognizer5)
        hello6.addGestureRecognizer(recognizer6)
        hello7.addGestureRecognizer(recognizer7)
        hello8.addGestureRecognizer(recognizer8)
        hello9.addGestureRecognizer(recognizer9)
        helloArray = [hello1,hello2,hello3,hello4,hello5,hello6,hello7,hello8,hello9]
        
        
        counter = 10
        timeLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        
        hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hideHello), userInfo: nil, repeats: true)
        
        hideHello()
        
    }
    
    @objc func hideHello() {
        for hello in helloArray{
            hello.isHidden = true
        }
        
        if self.score > self.highScore{
            self.highScore = self.score
            highscoreLabel.text = "highScore: \(self.highScore)"
            UserDefaults.standard.setValue(self.highScore, forKeyPath: "highscore")
        }
        
        
        let random = Int(arc4random_uniform(UInt32(helloArray.count - 1)))
        helloArray[random].isHidden = false
        
    }
    
    
    
    
    @objc func increaseScore(){
    score += 1
        scoreLabel.text = "Score: \(score)"
        
    }
    @objc func countDown(){
        
        counter -= 1
        timeLabel.text = String(counter)
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            
            let alert = UIAlertController(title: "Time is up", message: "Play again?", preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "No", style: UIAlertAction.Style.cancel, handler: nil)
            let replay = UIAlertAction(title: "Play", style: UIAlertAction.Style.default) { UIAlertAction in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 10
                self.timeLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                
                self.hideTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.hideHello), userInfo: nil, repeats: true)
                
            }
            
            alert.addAction(okButton)
            alert.addAction(replay)
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
    }

}

