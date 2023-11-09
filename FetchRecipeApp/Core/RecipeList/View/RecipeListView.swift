//
//  RecipeListView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import SwiftUI

struct RecipeListView: View {
    let meals: [RecipesViewModel]
    
    var body: some View {
        List(meals, id: \.idMeal) { recipe in
            NavigationLink(destination: RecipeDetailView(recipeId: recipe.idMeal,
                                                         recipeName: recipe.strMeal,
                                                         recipeImageUrl: recipe.strMealThumb)) {
                RecipeCellView(meals: recipe)
            }
        }
    }
}
