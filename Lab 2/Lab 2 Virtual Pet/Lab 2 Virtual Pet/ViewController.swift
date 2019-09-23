//
//  ViewController.swift
//  Lab 2 Virtual Pet
//
//  Created by Zoe Wang on 9/22/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPet:Pet! {
        didSet {
            bg.backgroundColor = currentPet.color
            happinessDispaly.color = currentPet.color
            foodDisplay.color = currentPet.color
            imageDisplay.image = currentPet.img
            updateDisplay()
        }
    }
    var cat:Pet?
    var dog:Pet?
    var fish:Pet?
    var bird:Pet?
    var bunny:Pet?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let image = UIImage(named: "cat") {
            cat = Pet(name: "Cat", color: #colorLiteral(red: 1, green: 0.8191777468, blue: 0.564719975, alpha: 1), img: image, talks: ["Oh! Feels like a new begginning!", "Level max!", "Meowww..", "Tasty fish. Thanks!", "Little cat, catching mice."])
        }
        
        if let image = UIImage(named:"dog") {
            dog = Pet(name: "Dog", color: #colorLiteral(red: 1, green: 0.7610240579, blue: 0.6749662757, alpha: 1), img: image, talks: ["More powerful barks!", "Level max!", "I like catching balls.", "Yummmmmmmmmm..", "Your best friend is here!"])
        }
        
        if let image = UIImage(named: "fish") {
            fish = Pet(name: "Fish", color: #colorLiteral(red: 0.7504293323, green: 0.9026142955, blue: 1, alpha: 1), img: image, talks: ["Big fish eat small fish!", " Level max!", "Bubble, bubble..", "Thanks for the food!", "I love mother ocean."])
        }
        
        if let image = UIImage(named: "bunny") {
            bunny = Pet(name: "Bunny", color:#colorLiteral(red: 0.7018958926, green: 0.7020230889, blue: 1, alpha: 1) , img: image, talks: ["Small bunny grows large!", "Level max!", "Jump jump!", "Tasty grass.", "Where is my Alice?"])
        }
        
        if let image = UIImage(named: "bird") {
            bird = Pet(name: "Bird", color: #colorLiteral(red: 0.2435578406, green: 1, blue: 0.7191411853, alpha: 1), img: image, talks: ["My feathers grow prettier!", "Level max.", "Enjoying the lovely time!", "The early bird catches the worm.", "Some people always try to teach me talk like them..."])
        }
        
        currentPet = cat
        
        foodDisplay.color = currentPet.color
        happinessDispaly.color = currentPet.color
        happinessDispaly.animateValue(to: 0.5)
        foodDisplay.animateValue(to:   0.5)
    }

    @IBOutlet weak var levelDisplay: UILabel!
    
    @IBOutlet weak var responseDisplay: UILabel!

    @IBOutlet weak var imageDisplay: UIImageView!
    
    @IBOutlet weak var bg: UIView!
    
    @IBOutlet weak var totalHappinessDisplay: UILabel!
    
    @IBOutlet weak var totalFoodDisplay: UILabel!
 
    @IBOutlet weak var happinessDispaly: DisplayView!
    
    @IBOutlet weak var foodDisplay: DisplayView!
    
    @IBOutlet weak var constraintHeight: NSLayoutConstraint!
    
    @IBOutlet weak var constraintWidth: NSLayoutConstraint!
    
    func updateDisplay() {
        levelDisplay.text = "Level \(currentPet.level)"
        constraintWidth.constant = CGFloat( 30 + currentPet.level*20)
        constraintHeight.constant = CGFloat(30 + currentPet.level*20)
        responseDisplay.text = currentPet.talks[currentPet.currentResponse]
        happinessDispaly.animateValue( to:CGFloat(currentPet.happiness)/10)
        foodDisplay.animateValue(to:   CGFloat(currentPet.foodLevel)/10)
        totalFoodDisplay.text = String(currentPet.totalFeed)
        totalHappinessDisplay.text = String(currentPet.totalPlay)
    }
    
    @IBAction func changePet(_ sender: UIButton) {
        if let newPetName = sender.title(for: UIControl.State.selected) {
            if (newPetName != currentPet.name) {
                currentPet.currentResponse = 4
                switch newPetName {
                case "Dog": currentPet = dog
                case "Cat": currentPet = cat
                case "Bird": currentPet = bird
                case "Bunny": currentPet = bunny
                case "Fish": currentPet = fish
                default:
                    return
                }
            }
        }
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        currentPet.play()
        updateDisplay()
    }
    
    @IBAction func feedButton(_ sender: UIButton) {
        currentPet.feed()
        updateDisplay()
    }
    
    
    
}

////////
// Q
// - safe unwrap UIimage?
////////
