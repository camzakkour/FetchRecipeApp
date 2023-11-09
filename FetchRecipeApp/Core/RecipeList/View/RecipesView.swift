//
//  RecipesView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/7/23.
//

import SwiftUI

struct RecipesView: View {
    
    let category: CategoriesListViewModel
    @StateObject private var recipeListViewModel = RecipeListViewModel()
    
    var body: some View {
        RecipeListView(meals: recipeListViewModel.meals)
            .task {
                await recipeListViewModel.getRecipesOfCategory(name: category.strCategory)
            }
    }
}
