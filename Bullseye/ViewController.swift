//
//  ViewController.swift
//  Bullseye
//
//  Created by Tarlan Ismayilsoy on 1/2/18.
//  Copyright © 2018 Terlan Ismayilsoy. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    var counter = 0
    var randomNumber = 0
    var lives = ["♥","♥","♥","♥","♥"]
    var lifeLeft = 5
    var playagain = false
    
    @IBOutlet weak var numLabel: UILabel!
    @IBOutlet weak var numSlider: UISlider!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var exatSwitch: UISwitch!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var lifeShower: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber = Int(arc4random_uniform(101))
        numLabel.text = "Move the slider to: \(randomNumber)"
        lifeShower.text = lives.joined()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func checkValue(_ sender: Any) {
        if playagain == true
        {
            playAgain((Any).self)
        }
        else
        {
            if !exatSwitch.isOn//NOT EXACT MODE
            {
                if Int(numSlider.value) >= randomNumber - 3 && Int(numSlider.value) <= randomNumber + 3//CORRECT ANSWER
                {
                    resultLabel.text = "Bullseye!"
                    resultLabel.backgroundColor = UIColor.green
                    checkButton.setTitle("Play Again", for: UIControlState.normal)
                    playagain = true
                }
                else//INCORRECT ANSWER
                {
                    resultLabel.text = "Whoops! You missed! Try again"
                    resultLabel.backgroundColor = UIColor.red
                    lives.popLast()
                    if lives.count == 0
                    {
                        let alert = UIAlertController(title: "Game Over", message: "You ran out of lives", preferredStyle: UIAlertControllerStyle.alert)// create the alert

                        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: nil))//add a choice
                        
                        self.present(alert, animated: true, completion: nil)// show the alert
                        
                        playAgain((Any).self)
                    }
                }
            }
            else//EXACT MODE
            {
                if Int(numSlider.value) == randomNumber//CORRECT ANSWER
                {
                    resultLabel.text = "Bullseye!"
                    resultLabel.backgroundColor = UIColor.green
                    checkButton.setTitle("Play Again", for: UIControlState.normal)
                    playagain = true
                    
                }
                else//INCORRECT ANSWER
                {
                    resultLabel.text = "Whoops! You missed! Try again"
                    resultLabel.backgroundColor = UIColor.red
                    lives.popLast()
                    if lives.count == 0
                    {
                        // create the alert
                        let alert = UIAlertController(title: "Game Over", message: "You ran out of lives", preferredStyle: UIAlertControllerStyle.alert)
                        
                        alert.addAction(UIAlertAction(title: "Play Again", style: UIAlertActionStyle.default, handler: nil))
                        
                        self.present(alert, animated: true, completion: nil)// show the alert
                        
                        playAgain((Any).self)
                    }
                }
            }
            
            resultLabel.isHidden = false
            //playAgainButton.isHidden = false
            
            lifeShower.text = lives.joined()
        }
    }
    
    
    
    @IBAction func playAgain(_ sender: Any) {
        numSlider.setValue(50.0, animated: false)
        randomNumber = Int(arc4random_uniform(101))
        
        if playagain == false
        {
            lives = ["♥","♥","♥","♥","♥"]
        }
        
        lifeShower.text = lives.joined()
        numLabel.text = "Move the slider to: \(randomNumber)"
        resultLabel.text = ""
        resultLabel.isHidden = true
        playAgainButton.isHidden = true

        //checkButton.setTitle("Check", for: UIControlState.normal)
        playagain = false
        
        self.checkButton.setTitle("Check", for: UIControlState.normal)
        
        
    }
    
    
    @IBAction func sliderValueChanged(_ sender: Any)
    {
        
    }
    
}

