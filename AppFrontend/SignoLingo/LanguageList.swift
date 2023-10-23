//
//  LanguageList.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 30/09/23.
//

import SwiftUI

struct LanguageList: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedLanguageIndex = 0
    let languages = ["Español", "English", "Chino", "Frances"]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Configuración de lenguaje")
                    .font(.custom("Chewy-Regular", size: 25))
                    .foregroundColor(.black)
                
                List {
                    Picker("", selection: $selectedLanguageIndex) {
                        ForEach(0..<languages.count, id: \.self) { index in
                            Text(languages[index]).tag(index)
                        }
                    }
                    .pickerStyle(.inline) // Utiliza el estilo Inline
                }
                .listStyle(PlainListStyle())
                .font(.custom("Chewy-Regular", size: 20))
                .foregroundColor(.black)
            }
            .navigationBarItems(trailing: Button("Guardar") {
                // Aquí puedes usar selectedLanguageIndex para guardar la selección
                presentationMode.wrappedValue.dismiss()
            })
            .font(.custom("Chewy-Regular", size: 30))
            .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
        }
    }
}
