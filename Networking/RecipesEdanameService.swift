//
//  RecipesEdanameService.swift
//  Reciplease
//
//  Created by Erwan PASTE iMac on 14/05/2020.
//  Copyright © 2020 Erwan PASTE. All rights reserved.
//

import Foundation

// URL
struct RecipesEdanameService {
    
    private let session: RecipleaseClientSession
    private let baseURL = "https://api.edamam.com/search?"
    private let appId = "fe78d095"
    private let appKey = "29bdb66aee94ac07c0bd832cce45bf56"

    init(session: RecipleaseClientSession = RecipleaseSession()) {
        self.session = session
    }

    // MARK: - getRecipesFromEdamam

    func getRecipesFromEdamam(
        with ingredients: String,
        callback: @escaping (Result<RecipeData, Error>) -> Void
    ) {
        guard let recipleaseURL = URL(string: "\(baseURL)q=\(ingredients)&app_id=\(appId)&app_key=\(appKey)") else { return }

        session.request(with: recipleaseURL) { (response) in

            guard let data = response.data else {
                callback(.failure(NetWorkError.noData))
                return
            }

            guard response.response?.statusCode == 200 else {
                callback(.failure(NetWorkError.badUrl))
                return
            }

            do {
                let recipe = try JSONDecoder().decode(RecipeData.self, from: data)
                callback(.success(recipe))
            } catch {
                callback(.failure(NetWorkError.jsonError))
            }
        }
    }
}




