//
//  WordList.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 23/08/23.
//

import SwiftUI

struct WordList: View {
    @EnvironmentObject var modelData: ModelDataWord
    @EnvironmentObject var categoryVM: CategoryViewModel
    
    @State private var searchText = ""
    @State private var showingAddAlert = false
    
    var filteredWords: [WordModel] {
        if searchText.isEmpty {
            return modelData.words
        } else {
            return modelData.words.filter { $0.word.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        List {
            HStack {
                Image(systemName: "magnifyingglass.circle")
                    .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                    .font(.system(size: 35))
                TextField("Buscar", text: $searchText)
                    .font(.custom("Chewy-Regular", size: 35))
                    .padding(.vertical, 10)
                    .padding(.horizontal, 5)
                    .foregroundColor(.gray)
            }
            .background(Color.white)
            .cornerRadius(10)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            
            ForEach(filteredWords) { item in
                if let category = categoryVM.arrCategories.first(where: { $0.id == item.categoryid }) {
                    NavigationLink {
                        WordDetail(word: item, category: category)
                    } label: {
                        WordRow(word: item, category: category)
                    }
                }
            }
        }
        
        Button(action: {
            showingAddAlert = true
        }) {
            Text("Agregar")
                .font(.custom("Chewy-Regular", size: 45))
                .padding(.vertical, 10)
                .padding(.horizontal, 20)
                .background(Color(red: 0/255, green: 74/255, blue: 173/255))
                .cornerRadius(10)
                .foregroundColor(.white)
        }
        .alert(isPresented: $showingAddAlert) {
            Alert(
                title: Text("Quieres enviar solicitud para agregar \(searchText) al diccionario?"),
                primaryButton: .default(Text("Aceptar")) {
                    if !searchText.isEmpty {
                        // Llamar a la función para enviar solicitud de seguimiento
                        modelData.trackWord(word: searchText)
                    }
                },
                secondaryButton: .cancel(Text("Cancelar"))
            )
        }
    }
}
