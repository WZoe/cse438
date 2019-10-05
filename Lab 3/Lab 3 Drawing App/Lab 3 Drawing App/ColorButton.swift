//
//  ColorButton.swift
//  Lab 3 Drawing App
//
//  Created by Zoe Wang on 10/2/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class ColorButton: UIButton {
    var color: UIColor = UIColor.red{
        didSet {
            self.setNeedsDisplay()
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.setTitle(nil, for: UIControl.State.normal)
        self.layer.cornerRadius = 15
        self.layer.backgroundColor = color.cgColor
        self.layer.borderColor = #colorLiteral(red: 0.7449160218, green: 0.7404895425, blue: 0.7483196855, alpha: 1)
        self.layer.borderWidth = 2
    }

    

}
