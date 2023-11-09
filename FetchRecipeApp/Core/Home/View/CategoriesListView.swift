//
//  CategoriesView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 10/30/23.
//

import SwiftUI

struct CategoriesView: View {
    
//    @StateObject var model: CategoriesViewModel = CategoriesListViewModel()
    var body: some View {
        NavigationView{
            Text("Categories")
                .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoriesView()
}
