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
    @IBOutlet weak var txtQuickAve: UITextField!
    @IBOutlet weak var btnQuickAve: UIButton!
    @IBOutlet weak var resetQuickAve: UIButton!
    var total:Double = 0
    var count:Double = 0
    var average: Double = 0
    let numberCharacters = NSCharacterSet.decimalDigits.inverted
    override func viewDidLoad() {
        super.viewDidLoad()
        changeTxtNumberProperties(txtNumEn: txtNumberEnter)
        changeTxtNumberProperties(txtNumEn: txtNumberEnter2)
        changeTxtNumberProperties(txtNumEn: txtQuickAve)
        changeButtonStyle()
        changelblAveNum()
        changeQuickProperties()
    }
    func changeTxtNumberProperties(txtNumEn: UITextField){
        txtNumEn.textAlignment = NSTextAlignment.center
        txtNumEn.borderStyle = UITextBorderStyle.line
        txtNumEn.backgroundColor = UIColor.white
        txtNumEn.clearButtonMode = UITextFieldViewMode.always
    }
    func changeButtonStyle(){
        averageNumber.setTitle("Average", for: UIControlState.normal)
        averageNumber.setTitleColor(UIColor.orange, for: UIControlState.normal)
    }
    func changeQuickProperties(){
        btnQuickAve.setTitle("QuickAve", for: UIControlState.normal)
        btnQuickAve.setTitleColor(UIColor.orange, for: UIControlState.normal)
        resetQuickAve.setTitle("Reset", for: UIControlState.normal)
        resetQuickAve.setTitleColor(UIColor.orange, for: UIControlState.normal)
        txtQuickAve.placeholder = "Please enter a number for QuickAve"
    }
    func changelblAveNum(){
        lblAveNum.textColor = UIColor.white
        lblAveNum.isHidden = true
    }
    @IBAction func btnQuickAveAction(_ sender: AnyObject) {
        if (!(txtQuickAve.text?.isEmpty)!) && ((txtQuickAve.text?.rangeOfCharacter(from: numberCharacters)) == nil){
            lblAveNum.isHidden = false
            lblAveNum.text = String(quickAve())
            txtQuickAve.text?.removeAll()
        }
    }
    func quickAve() -> Double{
        total += Double(txtQuickAve.text!)!
        count += 1
        average = total/count
        return average
    }
    @IBAction func resetQuickAveButton(_ sender: AnyObject) {
        total = 0
        count = 0
        average = 0
        lblAveNum.text = "0"
    }
    func getAve(d1: Double, d2: Double)->Double{
        return (d1+d2)/2
    }
    @IBAction func getAveNum(_ sender: AnyObject) {
        
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

