//
//  ExploreView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @ObservedObject private var exploreViewModel = ExploreViewModel()

    var body: some View {
        NavigationView {
            List(exploreViewModel.searchedMeals, id: \.idMeal) { recipe in
                NavigationLink(destination: RecipeDetailView(recipeId: recipe.idMeal,
                                                             recipeName: recipe.strMeal,
                                                             recipeImageUrl: recipe.strMealThumb)) {
                    RecipeCellView(meals: recipe)
                }
            }
            .navigationTitle("Explore")
            .searchable(text: $searchText, prompt: "Search for meal")
            .onSubmit(of: .search) {
                Task {
                    await exploreViewModel.searchRecipe(searchTerm: searchText)
                }
            }
        }
    }
}

#Preview {
    ExploreView()
}
