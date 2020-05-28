//
//  RecipeData.swift
//  Reciplease
//
//  Created by Erwan PASTE iMac on 16/05/2020.
//  Copyright © 2020 Erwan PASTE. All rights reserved.
//

import Foundation

struct RecipeData: Decodable {
    let query: String
    let hits: [Hits]

    enum CodingKeys: String, CodingKey {
        case query = "q"

        case hits
    }
}

struct Hits: Decodable {
    let recipe: Recipe
}

struct Recipe: Decodable {
    let title: String
    let image: String
    let source: String
    let url: String
    let yield: Int
    let ingredientLines: [String]
    let calories: Double
    let time: Double

    enum CodingKeys: String, CodingKey {
        case title = "label"
        case time = "totalTime"

        case image
        case source
        case url
        case yield
        case ingredientLines
        case calories
    }
}
