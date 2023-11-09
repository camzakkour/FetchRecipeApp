//
//  RecipeDetailViewModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation
import SwiftUI

@MainActor
class RecipeDetailViewModel: ObservableObject {
    
    @Published var strMeal: String = ""
    @Published var idMeal: String = ""
    @Published var strMealThumb: URL?
    @Published var strCategory: String = ""
    @Published var strArea: String = ""
    @Published var strInstructions: String = ""
    @Published var ingredients: [Ingredient] = []
    
    func getRecipeDetail(recipeId: String) async {
        do {
            let recipeDetailResponse = try await Webservice().get(url: Constants.Urls.recipeId(recipeId), type: RecipeDetailResponse.self)
 
            if let recipeDetail = recipeDetailResponse.meals.first {
                self.strMeal = recipeDetail.strMeal

                if let url = URL(string: recipeDetail.strMealThumb) {
                    self.strMealThumb = url
                }

                self.strCategory = recipeDetail.strCategory
                self.idMeal = recipeDetail.idMeal
                self.strArea = recipeDetail.strArea
                self.strInstructions = recipeDetail.strInstructions

                if let ingredients = recipeDetail.ingredients {
                    self.ingredients = ingredients
                } else {
                    self.ingredients = []
                }
            }
            
        } catch {
            print(error)
        }
    }
}
