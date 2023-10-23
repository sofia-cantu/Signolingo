//
//  CategoryViewModel.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 28/09/23.
//

import Foundation
import SwiftUI

struct CategoryData: Codable {
    var categories: [CategoryModel]
}

class CategoryViewModel: ObservableObject {

    @Published var arrCategories = [CategoryModel]()
    @Published var selectedCategories = [Int]()

    init() {
        // Proporciona el enlace URL de tu archivo JSON remoto
        let remoteJSONURL = URL(string: "https://vc5kqp87-3000.usw3.devtunnels.ms/api/v1/categories/getall")
        getCategories(from: remoteJSONURL)
    }

    func getCategories(from url: URL?) {
        guard let remoteJSONURL = url else {
            return
        }

        URLSession.shared.dataTask(with: remoteJSONURL) { data, _, error in
            if let error = error {
                print("Error al cargar los datos JSON: \(error)")
                return
            }

            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(CategoryData.self, from: data)
                    DispatchQueue.main.async {
                        self.arrCategories = jsonData.categories
                    }
                } catch {
                    print("Error al decodificar el JSON: \(error)")
                }
            }
        }.resume()
    }

    var filteredCategories: [CategoryModel] {
        return arrCategories.filter { selectedCategories.contains($0.id) }
    }
}
