//
//  ClockView.swift
//  Ready, Set, Draw!
//
//  Created by Reddygari,Amarendar Reddy on 11/14/17.
//  Copyright © 2017 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

@IBDesignable class ClockView: UIView {
    
    var textRadiusMultiplier = 0.8
    var radius = 100.0
    var secondhandColor: UIColor = UIColor.red
    var minutehandColor: UIColor = UIColor.black
    var hourhandColor: UIColor = UIColor.green
    var backgrndColor: UIColor = UIColor.white
    var borderColor: UIColor = UIColor.darkGray
    var centreColor: UIColor = UIColor.red
    var showNumbers = true
    
    override init(frame frameRect: CGRect) {
        super.init(frame:frameRect);
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func draw(_ rect: CGRect) {
        drawBorder()
        drawTicks()
        let time = ctime()
        print("\(time.h):\(time.m):\(time.s)")
        drawMinuteHand(time: time)
        drawHourHand(time: time)
        drawSecondHand(time: time)
        drawCentre()
//        if showNumbers {
//            drawNumbers()
//        }
        
    }
    
    func ctime ()->(h:Int,m:Int,s:Int) {
        var t = time_t()
        time(&t)
        let x = localtime(&t)
        
        return (h:Int(x!.pointee.tm_hour),m:Int(x!.pointee.tm_min),s:Int(x!.pointee.tm_sec))
    }
    
    func drawBorder(){
        borderColor.setStroke()
        let face = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2))
        face.stroke()
        backgrndColor.setFill()
        face.fill()
    }
    
    func drawTicks(){
        UIColor.black.set()
        for i in 1...60{
            let angle = Double(i) * 6.0 * Double.pi / 180
            let path = UIBezierPath()
            path.move(to: CGPoint(x: radius + cos(angle) * radius, y: radius + sin(angle) * radius))
            if(i%5==0){
                UIColor.black.setStroke()
                path.addLine(to: CGPoint(x: radius + cos(angle) * 90, y: radius + sin(angle) * 90))
            }else{
                UIColor.lightGray.setStroke()
                path.addLine(to: CGPoint(x: radius + cos(angle) * 95, y: radius + sin(angle) * 95))
            }
            path.stroke()
        }
    }
    
//    func drawNumbers(){
//        let txtRadius = radius * textRadiusMultiplier
//        UIColor.black.set()
//        for i in 1...12{
//            let number = NSAttributedString(string: String(i), attributes:[
//                NSForegroundColorAttributeName: UIColor.black])
//            let angle = (-(Double(i) * 30.0) + 90) * Double.pi / 180
//            let numberRect =  CGRect(
//                x:CGFloat(radius + cos(angle) * txtRadius - Double(number.size().width/2)),
//                y:CGFloat(radius + sin(angle) * txtRadius - Double(number.size().height/2)),
//                width:number.size().width,
//                height:number.size().height)
//            number.draw(in:numberRect)
//        }
//    }
    
    func drawCentre(){
        centreColor.setFill()
        let centre = UIBezierPath(ovalIn: CGRect(x: 95, y: 95, width: 10, height: 10))
        centre.fill()
    }
    
    
    func drawMinuteHand(time: (h:Int,m:Int,s:Int)){
        let minute = time.m
        
        let angle =  -Double(minute) * 360.0 / 60.0 + 90
        let radians = angle * Double.pi / 180
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: radius, y: radius ))
        path.addLine(to: CGPoint(x: radius + cos(radians) * 90, y: radius + sin(radians) * 90))
        path.lineWidth = CGFloat(3)
        path.stroke()
    }
    
    func drawHourHand(time: (h:Int,m:Int,s:Int)){
        let hour = time.h
        let angle = -Double(hour%12) * 360.0 / 12 + 90
        let radians = angle * .pi / 180
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: radius, y: radius ))
        path.addLine(to: CGPoint(x: radius + cos(radians) * 70, y: radius + sin(radians) * 70))
        path.lineWidth = CGFloat(3)
        path.stroke()
    }
    
    func drawSecondHand(time: (h:Int,m:Int,s:Int)){
        let second = time.s
        let angle = -Double(second) * 360.0 / 60 + 90
        let radians = angle * .pi / 180
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: radius, y: radius ))
        path.addLine(to: CGPoint(x: radius + cos(radians) * 90, y: radius + sin(radians) * 90))
        path.lineWidth = CGFloat(1)
        UIColor.red.setStroke()
        path.stroke()
    }
    
    func degree2radian(_ a:CGFloat)->CGFloat {
        let b = .pi * a/180
        return b
    }
    
    @objc func tick(){
        setNeedsDisplay()
    }
    
    func startTimer(){
        //let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: tick), userInfo: nil, repeats: true)
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector:#selector(tick), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
    }
}
