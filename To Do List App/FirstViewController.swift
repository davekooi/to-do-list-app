//
//  FirstViewController.swift
//  To Do List App
//
//  Created by David Kooistra on 5/16/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit



class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items: [String] = []
    
    @IBOutlet weak var table: UITableView!
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            items.remove(at: indexPath.row)
            table.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("First view controller loaded")
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        print("First view controller did appear")
        let itemObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemObject as? [String] {
            
            items = tempItems
            
        }
        table.reloadData()
    }

}

