//
//  RecipesViewController.swift
//  fridgeApp
//
//  Created by Kamryn on 11/17/20.
//

import UIKit

class RecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet weak var recipesTable: UITableView!
    var recipes = [Recipe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //get user defaults
        createArray()
        
        // Do any additional setup after loading the view.
    }
    
    func createArray() {
        let recipe1 = Recipe(name: "pasta", image: UIImage(named: "pasta")!, ingredients: "pasta ingredients")
        let recipe2 = Recipe(name: "chicken", image: UIImage(named: "chicken")!, ingredients: "chicken ingredients")
        let recipe3 = Recipe(name: "salad", image: UIImage(named: "salad")!, ingredients: "salad ingredients")
        let recipe4 = Recipe(name: "omlette", image: UIImage(named: "omlette")!, ingredients: "omlette ingredients")
        recipes.append(recipe1)
        recipes.append(recipe2)
        recipes.append(recipe3)
        recipes.append(recipe4)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let recipeTableCell = recipesTable.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
        
        //get row
        let row = indexPath.row
        
        recipeTableCell.recipeLabel.text = recipes[row].name
        recipeTableCell.recipeImage.image = recipes[row].image

        
        return recipeTableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Main", bundle: nil)
        let oneRecipeView = Storyboard.instantiateViewController(identifier: "OneRecipeViewController") as! OneRecipeViewController
        
//
        oneRecipeView.getName = recipes[indexPath.row].name
        oneRecipeView.getRow = indexPath.row
        self.navigationController?.pushViewController(oneRecipeView, animated: true)
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func myUnwindActionTwo(segue: UIStoryboardSegue){
        
    }

}

class RecipeCell:UITableViewCell {
    @IBOutlet weak var recipeImage: UIImageView!

    @IBOutlet weak var recipeLabel: UILabel!
    
    
}

class Recipe {
    var name = "name"
    var image = UIImage()
    var ingredients = "ingredients"
    init(name: String,image: UIImage, ingredients: String){
        self.name = name
        self.image = image
        self.ingredients = ingredients
    }
}
