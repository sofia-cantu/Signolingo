//
//  WordRow.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 23/08/23.
//

import SwiftUI

struct WordRow: View {
    var word: WordModel
    var category: CategoryModel

    init(word: WordModel, category: CategoryModel) {
        self.word = word
        self.category = category
    }

    var body: some View {
        HStack {
            Image(systemName: category.icon)
                .resizable()
                .frame(width: 40, height: 50)
                .foregroundColor(category.colorA)
                .padding()

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


/*
struct WordRow_Previews: PreviewProvider {
    static var words = ModelDataWord().words
    static var categories = CategoryViewModel().arrCategories // Suponiendo que tienes un modelo de datos para categorías
    
    static var previews: some View {
        Group {
            ForEach(words.prefix(2)) { word in
                let category = categories.first { $0.id == word.categoryid }
                WordRow(word: word, category: category ??)
            }
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
*/


