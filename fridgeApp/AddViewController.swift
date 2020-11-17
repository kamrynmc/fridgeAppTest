//
//  AddViewController.swift
//  fridgeApp
//
//  Created by Kamryn on 11/9/20.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var quantity: UITextField!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var add: UIButton!
    var items: [Item]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let retrieveData = UserDefaults.standard.data(forKey: "items")
        
        items = try! JSONDecoder().decode([Item].self, from: retrieveData!)
        // Do any additional setup after loading the view.
      
        name.delegate = self
        quantity.delegate = self
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (name.text!.count >= 1 && quantity.text!.count >= 1) {
            add.isEnabled = true
        }
        else  {
            add.isEnabled = false
        }
        return true
    }
    
    @IBAction func add(_ sender: Any) {
        let item = Item(name: name.text!, quantity: quantity.text!, date: date.date)
        items.append(item)
        
        let data = try! JSONEncoder().encode(items)
        
        UserDefaults.standard.setValue(data, forKey: "items")
        name.text = ""
        quantity.text = ""
        add.isEnabled = false
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
