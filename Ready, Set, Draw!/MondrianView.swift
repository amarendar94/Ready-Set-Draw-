//
//  MondrianView.swift
//  Ready, Set, Draw!
//
//  Created by Reddygari,Amarendar Reddy on 11/14/17.
//  Copyright © 2017 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

@IBDesignable class MondrianView: UIView {

    let colors:[UIColor] = [.red, .orange, .yellow, .green, .blue, .magenta, .purple]
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        if noOfRectangles>0{
            for _ in 0...noOfRectangles{
                let fillOrOutline = arc4random_uniform(2)
                let xCrd = Int(arc4random_uniform(185))
                let yCrd = Int(arc4random_uniform(185))
                let width = Int(arc4random_uniform(185))
                let height = Int(arc4random_uniform(185))
                let randomRectangle = UIBezierPath(rect: CGRect(x:  xCrd, y:  yCrd, width:  width, height:  height))
                if fillOrOutline == 1 {
                    colors[Int(arc4random_uniform(6))].setFill()
                    randomRectangle.fill()
                } else{
                    colors[Int(arc4random_uniform(6))].setStroke()
                    randomRectangle.stroke()
                }
                
            }
        }
        
        
        
        
    }
  

}
