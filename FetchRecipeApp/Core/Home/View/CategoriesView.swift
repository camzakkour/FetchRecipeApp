//
//  CategoryView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import SwiftUI

struct CategoriesView: View {
    
    @StateObject var model: CategoryListViewModel = CategoryListViewModel()
    
    var body: some View {
        NavigationView {
            CategoriesListView(categories: model.categories)
                .task {
                    await model.getCategories()
                }
                .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView()
}
