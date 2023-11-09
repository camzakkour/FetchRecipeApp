//
//  CategoryCellView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import SwiftUI

struct CategoryCellView: View {
    
    let category: CategoriesListViewModel
    
    var body: some View {
        HStack(spacing: 20) {
            
            AsyncImage(url: category.strCategoryThumb) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 100, maxHeight: 100)
            } placeholder: {
                ProgressView()
            }
            
            Text(category.strCategory)
        }
    }
}
