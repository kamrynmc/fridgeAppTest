//
//  FridgeViewController.swift
//  fridgeApp
//
//  Created by Kamryn on 11/9/20.
//

import UIKit

class FridgeViewController: UIViewController, UITableViewDataSource {

    
    @IBOutlet weak var fridgeTable: UITableView!
    var items: [Item]!

    override func viewDidLoad() {
        super.viewDidLoad()

        let retrieveData = UserDefaults.standard.data(forKey: "items")
        
        items = try! JSONDecoder().decode([Item].self, from: retrieveData!)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get instance of template cell
        let fridgeTableCell = fridgeTable.dequeueReusableCell(withIdentifier: "FridgeCell")! as! FridgeCell
        
        //get row
        let row = indexPath.row
        
        //modify properties of cell
        fridgeTableCell.itemLabel.text = items[row].name
        fridgeTableCell.quantityLabel.text = items[row].quantity
        //fridgeTableCell.expireLabel.text = "temp"
        let dateNum =  items[row].date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YY/MM/dd"
        let strDate = dateFormatter.string(from: dateNum)
        
        fridgeTableCell.expireLabel.text = strDate
        
        return fridgeTableCell;
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class FridgeCell:UITableViewCell {
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var expireLabel: UILabel!
    
}
