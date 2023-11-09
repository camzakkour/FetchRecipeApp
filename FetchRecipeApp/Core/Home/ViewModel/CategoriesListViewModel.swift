//
//  CategoriesViewModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation

@MainActor
class CategoryListViewModel: ObservableObject {
    
    @Published var categories: [CategoriesListViewModel] = []
    
    func getCategories() async {
        
        do {
            let categoryList = try await Webservice().get(url: Constants.Urls.CategoriesURL, type: CategoriesList.self)
            
            self.categories = categoryList.categories.map(CategoriesListViewModel.init)
            
        } catch {
            print(error)
        }
    }
}

struct CategoriesListViewModel: Identifiable{
    
    var id: String {
        category.idCategory
    }
    
    private let category: Category
    
    init(category: Category) {
        self.category = category
    }

    var strCategory: String {
        category.strCategory
    }
    
    var strCategoryThumb: URL? {
        URL(string: category.strCategoryThumb)
    }
}
