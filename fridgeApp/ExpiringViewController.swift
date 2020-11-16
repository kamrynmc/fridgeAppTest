//
//  ExpiringViewController.swift
//  fridgeApp
//
//  Created by Kamryn on 11/9/20.
//

import UIKit

class ExpiringViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var expiringTable: UITableView!
    var items: [Item]!
    var expiringItems: [Item] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        let retrieveData = UserDefaults.standard.data(forKey: "items")
        
        items = try! JSONDecoder().decode([Item].self, from: retrieveData!)
        // Do any additional setup after loading the view.
        
        let currentDateTime = Date()
        
        for item in items
        {
            if(Calendar.current.isDate(currentDateTime, inSameDayAs: item.date))
            {
                expiringItems.append(item)
            }
        }
        
        print(expiringItems)
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expiringItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get instance of template cell
        let expiringTableCell = expiringTable.dequeueReusableCell(withIdentifier: "ExpireCell") as! ExpireCell
    
        
        //get row
        let row = indexPath.row
        
        expiringTableCell.itemLabel.text = expiringItems[row].name
        expiringTableCell.quantityLabel.text = expiringItems[row].quantity

        return expiringTableCell;
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            let row = indexPath.row
            items.remove(at: row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            let data = try! JSONEncoder().encode(items)
            UserDefaults.standard.setValue(data, forKey: "items")
        }
    }

}

class ExpireCell:UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    
}
