//
//  CategoriesView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 10/30/23.
//

import SwiftUI

struct CategoriesListView: View {
    
    let categories: [CategoriesListViewModel]
    
    var body: some View {
        List(categories) { category in
            NavigationLink(destination: RecipesView(category: category).navigationTitle(category.strCategory)) {
                CategoryCellView(category: category)
            }
        }.listStyle(.plain)
    }
}
