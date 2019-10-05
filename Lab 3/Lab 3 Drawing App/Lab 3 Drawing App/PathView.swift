//
//  PathView.swift
//  Lab 3 Drawing App
//
//  Created by Zoe Wang on 10/1/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import UIKit

class PathView: UIView {

    var thePath: Path? {
        didSet{
            setNeedsDisplay()
        }
    }
    var paths: [Path] = [] {
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLine(_ path: Path) {
        if let color = path.color {
            color.setStroke()
        }
        else {
            UIColor.black.setStroke()
        }
        
        if let thispath = path.path{
            thispath.stroke()
        }

    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        for path in paths {
            drawLine(path)
        }
        
        if let path = thePath {
            drawLine(path)
        }
    }
    


}
