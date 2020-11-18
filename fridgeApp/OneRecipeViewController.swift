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
    
    var recipes = [Recipe]()
    var getName = String()
    var getRow = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createArray()
        // Do any additional setup after loading the view.
        recipeImage.image = recipes[getRow].image
        recipeTitle.text = recipes[getRow].name
        ingredientLabel.text = recipes[getRow].ingredients
    }
    
    
    func createArray() {
        let recipe1 = Recipe(name: "pasta", image: UIImage(named: "pasta")!, ingredients: "pasta ingredients\n-pasta\n-tomatoes\n-tomato sauce\n-frozen peas")
        let recipe2 = Recipe(name: "chicken", image: UIImage(named: "chicken")!, ingredients: "chicken ingredients\n-chicken\n-teryaki sauce\n-mushrooms")
        let recipe3 = Recipe(name: "salad", image: UIImage(named: "salad")!, ingredients: "salad ingredients\n-spinach\n-tomatoes\n-cucumbbers\n-olive oil\n-carrots")
        let recipe4 = Recipe(name: "omlette", image: UIImage(named: "omlette")!, ingredients: "omlette ingredients\n-eggs\n-spinach\n-mushrooms\n-milk\n-bell peppers")
        recipes.append(recipe1)
        recipes.append(recipe2)
        recipes.append(recipe3)
        recipes.append(recipe4)
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
