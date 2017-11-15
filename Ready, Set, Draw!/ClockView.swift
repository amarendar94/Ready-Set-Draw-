//
//  ClockView.swift
//  Ready, Set, Draw!
//
//  Created by Reddygari,Amarendar Reddy on 11/14/17.
//  Copyright © 2017 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

@IBDesignable class ClockView: UIView {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    //    static func drawtictac(){
    //    self.setNeedsDisplay()
    //    }
    override func draw(_ rect:CGRect){
        // Drawing code
        
        let date = Date()
        print(date.description)
        print (DateFormatter.localizedString(
            from: date,
            dateStyle: .short,
            timeStyle: .short))
        
        let cal = Calendar.current
        let hour = cal.component(.hour, from: date)
        let minute = cal.component(.minute, from: date)
        let seconds = cal.component(.second, from: date)
        let bezier = UIBezierPath()
        let size = self.frame.size
        bezier.addArc(withCenter: CGPoint(x:size.width/2.0, y: size.height/2.0), radius: size.width / 3.0, startAngle: 0.0, endAngle: 2 * .pi, clockwise: true)
        bezier.stroke()
        
        let hoursAngle = .pi * CGFloat((Double(hour) - 3.0) / 6.0)
        let minutesAngle = .pi * CGFloat(((Double(minute) / 5.0) - 3.0) / 6.0)
        let secondsAngle = .pi * CGFloat(((Double(seconds) / 5.0 ) - 3.0 ) / 6.0)

        
        let hourArc = UIBezierPath()
        let hourHand = UIBezierPath()
        hourArc.addArc(withCenter: CGPoint(x:size.width/2.0, y: size.height/2.0), radius: size.width / 6.0, startAngle: 0.0, endAngle: hoursAngle, clockwise: true)
        hourHand.move(to: hourArc.currentPoint)
        hourHand.addLine(to: CGPoint(x:size.width/2.0, y: size.height/2.0))
        hourHand.lineWidth = 3.0
        hourHand.stroke()
        
        
        let minutesArc = UIBezierPath()
        let minutesHand = UIBezierPath()
        minutesArc.addArc(withCenter: CGPoint(x:size.width/2.0, y: size.height/2.0), radius: size.width / 4.0, startAngle: 0.0, endAngle: minutesAngle, clockwise: true)
        minutesHand.move(to: minutesArc.currentPoint)
        minutesHand.addLine(to: CGPoint(x:size.width/2.0, y: size.height/2.0))
        minutesHand.lineWidth = 2.0
        minutesHand.stroke()
        
        let secondsHand = UIBezierPath()
        let secondsArc = UIBezierPath()
        secondsArc.addArc(withCenter: CGPoint(x:size.width/2.0, y: size.height/2.0), radius: size.width / 4.0, startAngle: 0.0, endAngle: secondsAngle, clockwise: true)
        secondsHand.move(to: secondsArc.currentPoint)
        secondsHand.addLine(to: CGPoint(x:size.width/2.0, y: size.height/2.0))
        secondsHand.lineWidth = 1.0
        UIColor.red.setStroke()
        secondsHand.stroke()
    }
}
