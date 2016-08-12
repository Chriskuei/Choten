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
    
    let items: [String] = ["新食堂", "京工食堂", "七食堂"]
    
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
    
    @IBAction func addButtonTapped(sender: AnyObject) {
        itemsLabel.text! += itemTextField.text! + "\n"
        print(itemsLabel.text!)
        itemTextField.text! = ""
    }
    
    @IBAction func okButtonTapped(sender: AnyObject) {
        let index = generateRandomNumber()
        print(items[index])
        //eatWhatLabel.text! = "你应该去 \(items[index])"
        //print(eatWhatLabel.text!)
    }
    
    func generateRandomNumber() -> Int {
        let n = Int(arc4random()) % items.count
        print(n)
        return n
    }
    
}

