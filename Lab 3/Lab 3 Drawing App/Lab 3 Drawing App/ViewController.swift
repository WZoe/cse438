//
//  ViewController.swift
//  Lab 3 Drawing App
//
//  Created by Zoe Wang on 10/1/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentDot = CGPoint.zero
    var currentPath:Path?
    var pathCanvas: PathView!
    var allCanvas:[PathView] = []
    var currentColor = UIColor.black
    

    @IBOutlet weak var width: UISlider!
    
    @IBOutlet var colors: [ColorButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pathCanvas = PathView(frame: view.frame)
        
        view.addSubview(pathCanvas)
        view.sendSubviewToBack(pathCanvas)
        allCanvas.append(pathCanvas)
        
        colors[0].color = #colorLiteral(red: 0.7953606248, green: 0.05643614382, blue: 0.2753381431, alpha: 1)
        colors[1].color = #colorLiteral(red: 0.9887087941, green: 0.5845662951, blue: 0, alpha: 1)
        colors[2].color = #colorLiteral(red: 0.5611951947, green: 0.621533215, blue: 0.710047245, alpha: 1)
        colors[5].color = #colorLiteral(red: 0.8523519635, green: 0.9683124423, blue: 0.5006482005, alpha: 1)
        colors[6].color = #colorLiteral(red: 0.2619299889, green: 0.8190174699, blue: 0.8257644773, alpha: 1)
        
        colors[3].color = UIColor.black
        colors[4].color = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        currentPath = Path(width: CGFloat(width!.value*100), color: currentColor)
        currentPath?.currentDotCenter = touchPoint
        pathCanvas.thePath = currentPath
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        currentPath?.currentDotCenter = touchPoint
        pathCanvas.thePath = currentPath
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        currentPath?.currentDotCenter = touchPoint
        currentPath?.dots?.append(touchPoint)
        pathCanvas.thePath = currentPath
        
        if let newLine = currentPath {
            pathCanvas.paths.append(newLine)
        }
    }
    
    
    @IBAction func clearCanvas(_ sender: UIButton) {
        pathCanvas.thePath = nil
        pathCanvas.paths = []
    }
    
    
    @IBAction func undo(_ sender: UIButton) {
        if pathCanvas.paths.count - 2 >= 0 {
            pathCanvas.thePath = pathCanvas.paths[pathCanvas.paths.count - 2]
        }
        else {
            pathCanvas.thePath = nil
        }
        if pathCanvas.paths.count > 0 {
            pathCanvas.paths.remove(at: pathCanvas.paths.count - 1)
        }
    }
    
    
    @IBAction func changeColor(_ sender: ColorButton) {
        currentColor = sender.color
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.borderWidth = 4
        
        for i in 0...colors!.count - 1 {
            if colors[i] != sender {
                colors[i].layer.borderColor = #colorLiteral(red: 0.7449160218, green: 0.7404895425, blue: 0.7483196855, alpha: 1)
                colors[i].layer.borderWidth = 2
            }
        }
    }
    
    func alert(title: String, message: String){
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true)
    }
    
    @IBAction func saveDrawing(_ sender: UIButton) {
        let image = pathCanvas.asImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        alert(title: "Saved", message: "Your drawing has been saved to Photo Library.")
    }
    
    @IBAction func gallery(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: "Gallery", message: nil, preferredStyle: .actionSheet)
        
        let newCanvas = UIAlertAction(title: "New...", style: .default) {
            _ in
            
            self.pathCanvas = PathView(frame: self.view.frame)
            
            self.view.addSubview(self.pathCanvas)
            self.view.sendSubviewToBack(self.pathCanvas)
            self.allCanvas.append(self.pathCanvas)
            
            for i in 0...self.allCanvas.count - 2 {
                self.view.sendSubviewToBack(self.allCanvas[i])
            }
            
            
        }
        actionSheet.addAction(newCanvas)
        
        for i in 0...allCanvas.count - 1 {
            let thisCanvas = UIAlertAction(title: "Drawing \(i+1)", style: .default) {
                _ in
                self.pathCanvas = self.allCanvas[i]
                
                for j in 0...self.allCanvas.count - 1 {
                    if j != i {
                        self.view.sendSubviewToBack(self.allCanvas[j])
                    }
                }
            }
            actionSheet.addAction(thisCanvas)
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
}
    
    


extension UIView {
    // The following function was cited from
    // https://stackoverflow.com/questions/30696307/how-to-convert-a-uiview-to-an-image
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
    // End Citing
}
