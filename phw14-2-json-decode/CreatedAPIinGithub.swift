//
//  J1CreatedAPIinGithub.swift
//  phw14-2-json-decode
//
//  Created by jasonhung on 2023/12/19.
//

import Foundation

struct TaiwaneseSnack: Codable {
    let name: String
    let type: String
    let ingredients: [Ingredient]
    let instructions: [String]
    let details: Details
}

struct Ingredient: Codable {
    let name: String
    let quantity: String
}

struct Details: Codable {
    let description: String
    let origin: String
    let popular_places: [String]
}

let jsonURL = URL(string: "https://raw.githubusercontent.com/JasonHungApp/JSON_API/main/TaiwanSnackPreparation.json")! // Replace with the actual URL or local file URL

func testJsonAPIinGithub(){
    // Call the function to fetch JSON data
    fetchJSONData(from: jsonURL, responseType: [TaiwaneseSnack].self) { snacks in
        if let snacks = snacks {
            // Handle the decoded JSON data
            for snack in snacks {
                print("Name: \(snack.name)")
                print("Type: \(snack.type)")
                print("Ingredients:")
                for ingredient in snack.ingredients {
                    print("- \(ingredient.name): \(ingredient.quantity)")
                }
                print("Instructions:")
                for instruction in snack.instructions {
                    print("- \(instruction)")
                }
                print("Details:")
                print("- Description: \(snack.details.description)")
                print("- Origin: \(snack.details.origin)")
                print("- Popular Places: \(snack.details.popular_places)")
                print("\n")
            }
        }
    }
}
