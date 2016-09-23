//
//  ViewController.swift
//  Reversed word
//
//  Created by Jifeng Jiang on 2016-09-13.
//  Copyright © 2016 Jifeng Jiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtNumberEnter: UITextField!
    @IBOutlet weak var averageNumber: UIButton!
    @IBOutlet weak var lblAveNum: UILabel!
    @IBOutlet weak var txtNumberEnter2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTxtNumberProperties(txtNumEn: txtNumberEnter)
        changeTxtNumberProperties(txtNumEn: txtNumberEnter2)
        changeButtonStyle()
        changelblAveNum()
    }
    func changeTxtNumberProperties(txtNumEn: UITextField){
        txtNumEn.textAlignment = NSTextAlignment.center
        txtNumEn.borderStyle = UITextBorderStyle.line
        txtNumEn.backgroundColor = UIColor.white
        
    }
    func changeButtonStyle(){
        averageNumber.setTitle("Average", for: UIControlState.normal)
        averageNumber.setTitleColor(UIColor.orange, for: UIControlState.normal)
    }
    func changelblAveNum(){
        lblAveNum.textColor = UIColor.white
        lblAveNum.isHidden = true
    }
    func getAve(d1: Double, d2: Double)->Double{
        return (d1+d2)/2
    }
    @IBAction func getAveNum(_ sender: AnyObject) {
        let numberCharacters = NSCharacterSet.decimalDigits.inverted
         if txtNumberEnter.text!.isEmpty || txtNumberEnter2.text!.isEmpty {
                print ("Please enter numbers!!!")
         }else if txtNumberEnter.text?.rangeOfCharacter(from: numberCharacters) != nil || txtNumberEnter2.text?.rangeOfCharacter(from: numberCharacters) != nil {
                print ("You cannot enter letters or symbols!!!")
         }else{
            let d1 = Double(txtNumberEnter.text!)
            let d2 = Double(txtNumberEnter2.text!)
            lblAveNum.text = String(getAve(d1: d1!, d2: d2!))
            lblAveNum.isHidden = false
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

