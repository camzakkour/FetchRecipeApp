//
//  RecipesCellView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/7/23.
//

import SwiftUI

struct RecipeCellView: View {
    
    let meals: RecipesViewModel
    
    var body: some View {
        HStack {
            
            AsyncImage(url: meals.strMealThumb) { image in
                image.resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            } placeholder: {
                ProgressView()
            }
            
            Text(meals.strMeal)
        }
    }
}
