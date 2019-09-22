//
//  ViewController.swift
//  Lab 1 Caculator
//
//  Created by Zoe Wang on 9/3/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var originalPrice = 0.00
    
    var salesTax = 9.679
    
    var discount = 0.00

    var converterStatus = 0
    
    var history = ""
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var showHistory: UILabel!
    
    @IBOutlet weak var inputPrice: UITextField!
    
    @IBOutlet weak var finalPrice: UILabel!
    
    @IBOutlet weak var discountDisplay: UITextField!
    
//    func updateResult(on sender: UITextField, shorterthan limit: Int, under upperbound: Double, with name: Double*) {
//        let text = sender.text
//        if let text = text {
//            if (text.count > limit){
//                sender.text = String(text.prefix(limit))
//            }
//        }
//        name = toDouble(text: sender.text, under: upperbound)
//        calculateFinalPrice(price: originalPrice, tax: salesTax, discount: discount, converter: converterStatus)
//    }
    
    @IBAction func changeOriginalPrice(_ sender: UITextField) {
        // length limitation
        let text = sender.text
        if let text = text {
            if (text.count > 9){
                sender.text = String(text.prefix(9))
            }
        }
        originalPrice = toDouble(text: sender.text, under: 0)
        calculateFinalPrice(price: originalPrice, tax: salesTax, discount: discount, converter: converterStatus)
    }
    
    @IBAction func changeTax(_ sender: UITextField) {
        // length limitation
        let text = sender.text
        if let text = text {
            if (text.count > 7){
                sender.text = String(text.prefix(7))
            }
        }
        salesTax = toDouble(text: sender.text, under: 100.0)
        calculateFinalPrice(price: originalPrice, tax: salesTax, discount: discount, converter: converterStatus)
    }
    
    @IBAction func changeDiscount(_ sender: UITextField) {
        // length limitation
        let text = sender.text
        if let text = text {
            if (text.count > 5){
                sender.text = String(text.prefix(5))
            }
        }
        discount = toDouble(text: sender.text, under: 100.0)
        stepper.value = discount
        calculateFinalPrice(price: originalPrice, tax: salesTax, discount: discount, converter: converterStatus)
    }
    
    @IBAction func converter(_ sender: UISegmentedControl) {
        converterStatus = sender.selectedSegmentIndex
        calculateFinalPrice(price: originalPrice, tax: salesTax, discount: discount, converter: converterStatus)
    }
    
    @IBAction func changeDiscountStepper(_ sender: UIStepper) {
        discountDisplay.text = String(sender.value)
        discount = sender.value
        calculateFinalPrice(price: originalPrice, tax: salesTax, discount: discount, converter: converterStatus)
    }
    
    func toDouble(text: String?, under upperbound: Double) -> Double {
        // no input?
        if let text = text {
            // length exceeds?
//            if (text.count > 7){
//                text = String(text.suffix(7))
//            }
            if let number = Double(text) {
                // under upperbound?
                if ((upperbound == 0 || number <= upperbound) && number >= 0.0){
                    return number
                }
            }
        }
        return 0.0
    }
    
    func calculateFinalPrice(price: Double, tax: Double, discount: Double, converter: Int) {
        let divisor = pow(10.0, 2.0)
        
        var result = 0.00
        result = price * (1.0+tax/100.0) * (1.0-discount/100.0)
        
        // convert and display
        if (converter == 1) {
            result = (7.2*result*divisor).rounded() / divisor
            finalPrice.text = String(result) + "¥"
        }
        else {
            result = (result*divisor).rounded() / divisor
            finalPrice.text = String(result) + "$"
        }
        
        // update history
        history = "\(originalPrice)$, \(tax)%, \(discount)% -> \(finalPrice.text!)\n" + history
        showHistory.textAlignment = NSTextAlignment.left
        showHistory.text = history
    }
    
}

// TODO ======
// Layout Warnings done!
// Large numbers DONE!
// Outlet collection emm....
// keyboard solved!
// ===========
