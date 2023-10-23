//
//  ModelDataCategory.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 19/09/23.
//

import Foundation
import Combine

final class ModelDataCategory: ObservableObject {
    @Published var categories: [CategoryModel] = loadCategory("categoryData.json")
}

func loadCategory<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

