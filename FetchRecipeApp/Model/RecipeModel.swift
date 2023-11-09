//
//  RecipeModel.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 10/30/23.
//

import Foundation

struct RecipeDetailResponse: Decodable {
    let meals: [Meal]
}

struct Meal: Decodable, Hashable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let ingredients: [Ingredient]?
    
    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strCategory, strArea, strInstructions, strMealThumb
    }
}

struct Ingredient: Decodable, Hashable {
    let name: String
    let measure: String
}

extension Meal {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        idMeal = try container.decode(String.self, forKey: .idMeal)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        
        ingredients = try Meal.decodeIngredients(from: decoder)
    }
    
    private static func decodeIngredients(from decoder: Decoder) throws -> [Ingredient] {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        var ingredients: [Ingredient] = []

        for key in container.allKeys {
            if key.stringValue.starts(with: "strIngredient") {
                
                let index = key.stringValue.dropFirst("strIngredient".count)
                let measureKey = DynamicCodingKeys(stringValue: "strMeasure\(index)")!
                
                if let ingredientName = try container.decodeIfPresent(String.self, forKey: key),
                   !ingredientName.isEmpty,
                   let measureValue = try container.decodeIfPresent(String.self, forKey: measureKey),
                   !measureValue.isEmpty {
                    ingredients.append(Ingredient(name: ingredientName, measure: measureValue))
                }
            }
        }
        return ingredients
    }
    
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        var intValue: Int?
        init?(intValue: Int) {
            return nil
        }
    }
}
