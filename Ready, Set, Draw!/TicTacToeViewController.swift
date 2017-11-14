//
//  FirstViewController.swift
//  Ready, Set, Draw!
//
//  Created by Reddygari,Amarendar Reddy on 11/14/17.
//  Copyright © 2017 Reddygari,Amarendar Reddy. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {

    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func drawInput(_ sender: Any) {
        let arrayToDraw:[String] = splitter(data: inputTextField.text!)
        for each in arrayToDraw{
            
        }
        
    }
    
    func splitter(data:String)->[String]{
        var tictacArray:[String] = []
        for tic in data.components(separatedBy: " "){
            tictacArray.append(String(tic)!)
        }
        return tictacArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

