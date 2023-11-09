//
//  RecipeListViewModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation

@MainActor
class RecipeListViewModel: ObservableObject {
    
    @Published var meals: [RecipesViewModel] = [RecipesViewModel]()
    
    func getRecipesOfCategory(name: String) async {
        
        do {
            let recipeList = try await Webservice().get(url: Constants.Urls.recipeList(name),type: RecipeList.self)

            var recipeMeals = [RecipesViewModel]()
            
            for item in recipeList.meals {
                let recipeVM = RecipesViewModel(recipe: item)
                recipeMeals.append(recipeVM)
            }
            
            print("MEALS COUNT!: ", recipeMeals.count)
            self.meals = recipeMeals
        } catch {
            print(error)
        }
    }
}

struct RecipesViewModel {
    
    private let recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
    
    var idMeal: String {
        recipe.idMeal
    }
    
    var strMeal: String {
        recipe.strMeal
    }
    
    var strMealThumb: URL? {
        URL(string: recipe.strMealThumb)
    }
    
}
