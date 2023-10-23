//
//  CategorySettingsPopup.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 21/09/23.
//

//
//  CategorySettingsPopup.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 21/09/23.
//

import SwiftUI

struct CategorySettingsPopup: View {
    @EnvironmentObject var categoryVM: CategoryViewModel
    @State private var selectedCategories = Set<Int>()
    @State private var isAlertPresented = false
    @State private var alertMessage = ""
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            VStack{
                
                Text("Selecciona 5 categorías")
                    .font(.custom("Chewy-Regular", size: 25))
                
                List(categoryVM.arrCategories) { category in
                    Toggle(category.name, isOn: Binding(
                        get: { selectedCategories.contains(category.id) },
                        set: { newValue in
                            if newValue {
                                selectedCategories.insert(category.id)
                            } else {
                                selectedCategories.remove(category.id)
                            }
                        }
                    ))
                }
                .font(.custom("Chewy-Regular", size: 20))
                .navigationBarItems(trailing: Button(action: {
                    if selectedCategories.count == 5 {
                        categoryVM.selectedCategories = Array(selectedCategories)
                        isPresented = false
                    } else {
                        alertMessage = "Debes seleccionar exactamente 5 categorías."
                        isAlertPresented = true
                    }
                }) {
                    Text("Guardar")
                        .font(.custom("Chewy-Regular", size: 25))
                        .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                })

            }

        }
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Error"),
                message: Text(alertMessage),
                dismissButton: .default(Text("Aceptar"))
            )
        }
    }
}
