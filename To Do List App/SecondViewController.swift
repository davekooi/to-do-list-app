//
//  SecondViewController.swift
//  To Do List App
//
//  Created by David Kooistra on 5/16/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        var items: [String]
        
        if  let tempItems = itemObject as? [String] {
            
            items = tempItems
            
            items.append(textField.text!)
            
            
        } else {
            
            items = [textField.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        textField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}

