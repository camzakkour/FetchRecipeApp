//
//  RecipeModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 10/30/23.
//

import Foundation

struct Category: Codable {
    let strCategory: String?
    let strCategoryThumb: String?
}

struct Meal: Codable {
    var idMeal: String?
    var strMeal: String?
    var strCategory: String?
    var strArea: String?
    var strInstructions: String?
    var strMealThumb: String?
    
    var strIngredient1: String?
    var strIngredient2: String?
    var strIngredient3: String?
    var strIngredient4: String?
    var strIngredient5: String?
    var strIngredient6: String?
    var strIngredient7: String?
    var strIngredient8: String?
    var strIngredient9: String?
    var strIngredient10: String?
    var strIngredient11: String?
    var strIngredient12: String?
    var strIngredient13: String?
    var strIngredient14: String?
    var strIngredient15: String?
    var strIngredient16: String?
    var strIngredient17: String?
    var strIngredient18: String?
    var strIngredient19: String?
    var strIngredient20: String?
    
    var strMeasure1: String?
    var strMeasure2: String?
    var strMeasure3: String?
    var strMeasure4: String?
    var strMeasure5: String?
    var strMeasure6: String?
    var strMeasure7: String?
    var strMeasure8: String?
    var strMeasure9: String?
    var strMeasure10: String?
    var strMeasure11: String?
    var strMeasure12: String?
    var strMeasure13: String?
    var strMeasure14: String?
    var strMeasure15: String?
    var strMeasure16: String?
    var strMeasure17: String?
    var strMeasure18: String?
    var strMeasure19: String?
    var strMeasure20: String?
    
    subscript(key: String) -> String? {
        switch key {
        case "strIngredient1": return strIngredient1
        case "strIngredient2": return strIngredient2
        case "strIngredient3": return strIngredient3
        case "strIngredient4": return strIngredient4
        case "strIngredient5": return strIngredient5
        case "strIngredient6": return strIngredient6
        case "strIngredient7": return strIngredient7
        case "strIngredient8": return strIngredient8
        case "strIngredient9": return strIngredient9
        case "strIngredient10": return strIngredient10
        case "strIngredient11": return strIngredient11
        case "strIngredient12": return strIngredient12
        case "strIngredient13": return strIngredient13
        case "strIngredient14": return strIngredient14
        case "strIngredient15": return strIngredient15
        case "strIngredient16": return strIngredient16
        case "strIngredient17": return strIngredient17
        case "strIngredient18": return strIngredient18
        case "strIngredient19": return strIngredient19
        case "strIngredient20": return strIngredient20
            
        case "strMeasure1": return strMeasure1
        case "strMeasure2": return strMeasure2
        case "strMeasure3": return strMeasure3
        case "strMeasure4": return strMeasure4
        case "strMeasure5": return strMeasure5
        case "strMeasure6": return strMeasure6
        case "strMeasure7": return strMeasure7
        case "strMeasure8": return strMeasure8
        case "strMeasure9": return strMeasure9
        case "strMeasure10": return strMeasure10
        case "strMeasure11": return strMeasure11
        case "strMeasure12": return strMeasure12
        case "strMeasure13": return strMeasure13
        case "strMeasure14": return strMeasure14
        case "strMeasure15": return strMeasure15
        case "strMeasure16": return strMeasure16
        case "strMeasure17": return strMeasure17
        case "strMeasure18": return strMeasure18
        case "strMeasure19": return strMeasure19
        case "strMeasure20": return strMeasure20
        
        default: return ""
        }
    }
}
