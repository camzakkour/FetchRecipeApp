//
//  CategoryModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/6/23.
//

import Foundation

struct CategoriesList: Decodable {
    let categories: [Category]
}

struct Category: Decodable{
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
}
