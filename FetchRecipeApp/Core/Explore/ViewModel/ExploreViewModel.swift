//
//  ExploreViewModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var searchedMeals: [RecipesViewModel] = []

    func searchRecipe(searchTerm: String) async {
        do {
            let recipeList = try await Webservice().get(url: Constants.Urls.recipeId(searchTerm), type: RecipeList.self)
            
            let recipes = recipeList.meals.map(RecipesViewModel.init)
            
            self.searchedMeals = recipes
        } catch {
            print(error)
        }
    }
}
