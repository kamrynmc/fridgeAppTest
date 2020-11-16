//
//  ViewController.swift
//  fridgeApp
//
//  Created by Kamryn on 11/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var openButton: UIButton!
    @IBOutlet weak var addPageButton: UIButton!
    @IBOutlet weak var expiringButton: UIButton!
    var items: [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        openButton.imageView?.contentMode = .scaleAspectFit
        openButton.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        //get user defaults
        let userDefaults = UserDefaults.standard
//
//        let items = [Item(name: "egg", quantity: 1, days: 4)]
//
//        let data = try! JSONEncoder().encode(items)
//
//        userDefaults.setValue(data, forKey: "items")
//
        //retrieve data
        let retrieveData = userDefaults.data(forKey: "items")
        if(retrieveData == nil){
            let emptyItems: [Item] = []
            
            let data = try! JSONEncoder().encode(emptyItems)
            
            userDefaults.setValue(data, forKey: "items")
            items = []
        }
        else {
            items = try! JSONDecoder().decode([Item].self, from: retrieveData!)
        }
        
        print(items)
   
    }

    @IBAction func myUnwindAction(segue: UIStoryboardSegue){
        
    }
    
}

class Item: Codable {
    var name = "name"
    var quantity = "1"
    var date = Date()
    init(name: String, quantity: String,date: Date){
        self.name = name
        self.quantity = quantity
        self.date = date
    }
}

