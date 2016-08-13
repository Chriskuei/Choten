//
//  ChotenViewController.swift
//  Choten
//
//  Created by Chris on 16/8/11.
//  Copyright © 2016年 Chris. All rights reserved.
//

import UIKit

class ChotenViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate {

    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var itemsLabel: UILabel!
    @IBOutlet weak var eatWhatLabel: UILabel!
    
    var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.chotenTintColor()
        
        itemTextField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        itemTextField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        itemTextField.resignFirstResponder()
    }
    
    @IBAction func clearButtonTapped(sender: AnyObject) {
        items = []
        itemsLabel.text! = "今天吃什么呢？"
        eatWhatLabel.text! = "..."
    }
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        
        if let choice = itemTextField.text {
            
            if itemsLabel.text! == "今天吃什么呢？" {
                itemsLabel.text! = ""
            }
            items.append(choice)
            itemsLabel.text! += choice + "\n"
            //print(itemsLabel)
            print(choice)
            itemTextField.text! = ""
        }
        
    }
    
    @IBAction func okButtonTapped(sender: AnyObject) {
        let index = generateRandomNumber()
        print(items[index])
        
        delay(0.5) { 
            self.eatWhatLabel.text! = "正在计算中..."
            delay(0.5) {
                self.eatWhatLabel.text! = "客官请稍等..."
                delay(0.5) {
                    self.eatWhatLabel.text! = "菜马上出炉..."
                    delay(0.5) {
                        self.eatWhatLabel.text! = "你应该去 \(self.items[index])"
                    }
                }
            }
        }
        print(eatWhatLabel.text!)
    }
    
    func generateRandomNumber() -> Int {
        let n = Int(arc4random()) % items.count
        print(n)
        return n
    }
    
}

