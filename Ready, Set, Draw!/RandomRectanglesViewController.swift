//
//  RandomRectanglesViewController.swift
//  Ready, Set, Draw!
//
//  Created by Reddygari,Amarendar Reddy on 11/14/17.
//  Copyright © 2017 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

var noOfRectangles = 0

class RandomRectanglesViewController: UIViewController {

    @IBOutlet weak var canvas: MondrianView!
    @IBOutlet weak var noOfRectanglesTF: UITextField!
    
    @IBAction func drawRectangles(_ sender: Any) {
        if Int(noOfRectanglesTF.text!) == nil {
            let alert = UIAlertController(title: "Enter a number",
                                          message: "Please enter a valid Number as Input",
                                          preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: { (action) -> Void in })
            alert.addAction(cancel)
            if Int(noOfRectanglesTF.text!) == nil{
                present(alert, animated: true, completion: nil)
            }
        }
        else{
            noOfRectangles = Int(noOfRectanglesTF.text!)!
            canvas.setNeedsDisplay()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
