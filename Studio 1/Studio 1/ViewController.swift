//
//  ViewController.swift
//  Studio 1
//
//  Created by 王紫怡 on 9/2/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBAction func changeAlpha(_ sender: UISlider) {
        logoImage.alpha = CGFloat(sender.value)
    }
}

