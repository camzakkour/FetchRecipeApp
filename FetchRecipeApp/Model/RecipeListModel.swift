//
//  RecipeListModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation

struct RecipeList: Decodable {
    let meals: [Recipe]
}

struct Recipe: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}
