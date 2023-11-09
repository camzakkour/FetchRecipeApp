//
//  NetworkConstants.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 10/30/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let CategoriesURL = URL(string: "https://www.themealdb.com/api/json/v1/1/categories.php")!
        
        static func recipeList(_ name: String) -> URL {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(name)")!
        }
        
        static func recipeId(_ id: String) -> URL {
            return URL(string: "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(id)")!
        }
    }
}
