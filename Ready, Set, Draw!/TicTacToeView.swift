//
//  TicTacToe.swift
//  Ready, Set, Draw!
//
//  Created by Reddygari,Amarendar Reddy on 11/14/17.
//  Copyright © 2017 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

@IBDesignable class TicTacToeView: UIView {

    var x:Int?
    var y:Int?
    var sign:Character?
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
//    static func drawtictac(){
//    self.setNeedsDisplay()
//    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let bezier = UIBezierPath()
        let size = self.frame.size
        
        bezier.move(to:CGPoint(x:0.0,y:size.height/3))
        bezier.addLine(to: CGPoint(x:size.width, y:size.height/3))
        bezier.move(to:CGPoint(x:0.0,y:size.height*2/3))
        bezier.addLine(to: CGPoint(x:size.width, y:size.height*2/3))
        
        bezier.move(to:CGPoint(x:size.width/3,y:0.0))
        bezier.addLine(to: CGPoint(x:size.width/3, y:size.height))
        bezier.move(to:CGPoint(x:size.width*2/3,y:0.0))
        bezier.addLine(to: CGPoint(x:size.width*2/3, y:size.height))
        
//        // circle x,y co ordinates multiple of w/6, h/6
//        //     6,6      2,6      1.2,6
//        //     6,2      2,2      1.2,2
//        //     6,1.2    2,1.2    1.2,1.2
//
//        var w:CGFloat = 1.2
//        var h:CGFloat = 1.2
//
//        bezier.move(to: CGPoint(x:size.width/CGFloat(w) + size.width/10.0,y:size.height/CGFloat(h)))
//        bezier.addArc(withCenter: CGPoint(x:size.width/w,y:size.height/CGFloat(h)), radius: size.width/10.0, startAngle: 0.0, endAngle: 2 * .pi , clockwise: true)
//
//        w = 2
//        h = 2
//
//        bezier.move(to: CGPoint(x:size.width/CGFloat(w) - size.width/10.0, y:size.height/CGFloat(h) - size.height/10.0))
//        bezier.addLine(to: CGPoint(x:size.width/CGFloat(w) + size.width/10.0, y:size.height/CGFloat(h) + size.height/10.0))
//        bezier.move(to: CGPoint(x:size.width/CGFloat(w) + size.width/10.0, y:size.height/CGFloat(h) - size.height/10.0))
//        bezier.addLine(to: CGPoint(x:size.width/CGFloat(w) - size.width/10.0, y:size.height/CGFloat(h) + size.height/10.0))
        
        
        for str in inputArray{
            
            var w:CGFloat = 1
            var h:CGFloat = 1
            
            var firstIndex:String.Index = str.index(str.startIndex, offsetBy: 0)
            var secondIndex:String.Index = str.index(str.startIndex, offsetBy: 1)
            var thirdIndex:String.Index = str.index(str.startIndex, offsetBy: 2)
            if(str[firstIndex] == "0"){
                w = 6
            }
            if(str[firstIndex] == "1"){
                w = 2
            }
            if(str[firstIndex] == "2"){
                w = 1.2
            }
            if(str[secondIndex] == "0"){
                h = 6
            }
            if(str[secondIndex] == "1"){
                h = 2
            }
            if(str[secondIndex] == "2"){
                h = 1.2
            }
            
            if(str[thirdIndex] == "X" || str[thirdIndex] == "x"){
                bezier.move(to: CGPoint(x:size.width/CGFloat(w) + size.width/10.0,y:size.height/CGFloat(h)))
                bezier.addArc(withCenter: CGPoint(x:size.width/w,y:size.height/CGFloat(h)), radius: size.width/10.0, startAngle: 0.0, endAngle: 2 * .pi , clockwise: true)
            }
            
            if(str[thirdIndex] == "O" || str[thirdIndex] == "o"){
                bezier.move(to: CGPoint(x:size.width/CGFloat(w) - size.width/10.0, y:size.height/CGFloat(h) - size.height/10.0))
                bezier.addLine(to: CGPoint(x:size.width/CGFloat(w) + size.width/10.0, y:size.height/CGFloat(h) + size.height/10.0))
                bezier.move(to: CGPoint(x:size.width/CGFloat(w) + size.width/10.0, y:size.height/CGFloat(h) - size.height/10.0))
                bezier.addLine(to: CGPoint(x:size.width/CGFloat(w) - size.width/10.0, y:size.height/CGFloat(h) + size.height/10.0))
            }
        }
        
        
        UIColor.blue.setStroke()
        
//        bezier.move(to:CGPoint(x:size.width/2.0,y:size.height/2.0))
//        bezier.addArc(withCenter: CGPoint(x:size.width/2.0,y:size.height/2.0), radius: size.width/10.0, startAngle: 0.0, endAngle: 2 * .pi , clockwise: true)
        
        
        bezier.stroke()
    }
    
    static func drawTicTac(x: Int, y:Int, sign:Character){
    
    }
    

}
