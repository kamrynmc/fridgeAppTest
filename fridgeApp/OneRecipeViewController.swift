//
//  OneRecipeViewController.swift
//  fridgeApp
//
//  Created by Kamryn on 11/17/20.
//

import UIKit

class OneRecipeViewController: UIViewController {

    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
    
    var recipes = ["pasta", "chicken"]
    var ingredients = ["pasta ingredients", "chicken ingredients"]
    var getName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        recipeImage.image = UIImage(named: getName)
        recipeTitle.text = getName
        ingredientLabel.text = getName
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
