//
//  WordRowFiltered.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 02/10/23.
//

import SwiftUI

struct WordRowFiltered: View {
    var word: WordModel
    var category: CategoryModel

    init(word: WordModel, category: CategoryModel) {
        self.word = word
        self.category = category
    }

    var body: some View {
        HStack {
            VStack {
                Text(word.word)
                    .foregroundColor(category.colorA)
                    .font(.custom("Chewy-Regular", size: 35))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .kerning(3)

                Text(category.name)
                    .font(.custom("Chewy-Regular", size: 20))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading) // Alinea a la izquierda
                    .frame(maxWidth: .infinity, alignment: .leading)

            }
        }
    }
}




