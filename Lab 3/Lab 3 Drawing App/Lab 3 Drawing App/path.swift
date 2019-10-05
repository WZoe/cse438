//
//  dot.swift
//  Lab 3 Drawing App
//
//  Created by Zoe Wang on 10/1/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import Foundation
import UIKit

class Path {
    var currentDotCenter: CGPoint? {
        didSet{
            dots!.append(self.currentDotCenter!)
        }
    }
    var dots:[CGPoint]? = []{
        didSet{
            path = createQuadPath(points: dots!)
            path!.lineWidth = lineWidth
            path?.lineJoinStyle = .round
            path!.lineCapStyle = .round
        }
    }
    var path:UIBezierPath?
    var lineWidth: CGFloat = 5
    var color: UIColor?
    
    
    init(width: CGFloat, color: UIColor) {
        self.lineWidth = width
        self.color = color
    }
    
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        var midpoint = CGPoint()
        midpoint.x = (first.x + second.x) / 2.0
        midpoint.y = (first.y + second.y) / 2.0
        return midpoint
    }
    
    private func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath() //Create the path object
        if(points.count < 2){ //There are no points to add to this path
            return path }
        path.move(to: points[0]) //Start the path on the first point
        for i in 1..<points.count - 1{
            let firstMidpoint = midpoint(first: path.currentPoint, second:
                points[i]) //Get midpoint between the path's last point and the next one in the array
            let secondMidpoint = midpoint(first: points[i], second:
                points[i+1]) //Get midpoint between the next point in the array and the one after it
            path.addCurve(to: secondMidpoint, controlPoint1: firstMidpoint,
                          controlPoint2: points[i]) //This creates a cubic Bezier curve using math!
            
            
            
            // I added some lines here to avoid jagged corners at 180 degrees.
            if (firstMidpoint.x == secondMidpoint.x && (firstMidpoint.y - points[i].y)*(secondMidpoint.y - points[i].y) > 0 ) {
                path.addLine(to: points[i])
            }
            else if(firstMidpoint.y == secondMidpoint.y && (firstMidpoint.x - points[i].x)*(secondMidpoint.x - points[i].x) > 0 ) {
                path.addLine(to: points[i])
            }
        }
        return path }
}


