//
//  Pet.swift
//  Lab 2 Virtual Pet
//
//  Created by Zoe Wang on 9/23/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class Pet {
    let MAXLEVEL = 3
    
    let name:String
    let color:UIColor
    let img:UIImage
    let talks:[String]
    var happiness = 5
    var foodLevel = 5
    var level = 1
    var totalPlay = 0
    var totalFeed = 0
    var currentResponse = 4
    
    init(name:String, color: UIColor, img:UIImage, talks:[String]) {
        self.name = name
        self.color = color
        self.img = img
        self.talks = talks
    }
    
    func play() {
        if(self.foodLevel > 0){
            if (self.happiness < 10) {
                self.happiness += 1
            }
            self.foodLevel -= 1
            self.totalPlay += 1
            currentResponse = 2
            levelUp()
        }
    }
    
    func feed() {
        if(self.foodLevel < 10) {
            self.foodLevel += 1
            self.totalFeed += 1
            currentResponse = 3
            levelUp()
        }
    }
    
    func levelUp() {
        if (self.foodLevel == 10 && self.happiness == 10){
            if (self.level < self.MAXLEVEL) {
                self.foodLevel = 5
                self.happiness = 5
                level += 1
                currentResponse = 0
            }
            else {
                currentResponse = 1
            }
        }
    }
}
