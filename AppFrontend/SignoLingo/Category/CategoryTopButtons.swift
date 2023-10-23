//
//  CategoryTopButtons.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 21/09/23.
//

import SwiftUI

struct CategoryTopButtons: View {
    
    @State private var isSettingsVisible = false
    @State private var hasAppeared = false
    @State private var selectedCategory: CategoryModel?
    @ObservedObject var classifierViewModel: ClassifierViewModel
    
    var body: some View {
        HStack(spacing: 120) {
            NavigationLink(destination: WordList()){
                    Image(systemName: "book")
                        .font(.system(size: 60))
                        .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                        .padding()
                        .background(.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 3)
                        )
                        .shadow(color: Color(red: 0/255, green: 74/255, blue: 173/255), radius: 2)
                }
            
            Button(action: {
                self.isSettingsVisible.toggle()
            }) {
                Image("categorias")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 3)
                            .frame(width: 120, height: 95)
                            .shadow(color: Color(red: 0/255, green: 74/255, blue: 173/255), radius: 2)
                    )
                    
            }
            .frame(width: 320)
            
            NavigationLink(destination: ClassificationView(classifierViewModel: classifierViewModel)) {
                Image(systemName: "camera")
                    .font(.system(size: 60))
                    .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 3)
                    )
                    .shadow(color: Color(red: 0/255, green: 74/255, blue: 173/255), radius: 2)
            }   
        }
        .padding()
        .sheet(isPresented: $isSettingsVisible) {
            CategorySettingsPopup(isPresented: $isSettingsVisible)
        }
        .onAppear {
            if !hasAppeared {
                self.isSettingsVisible.toggle()
                hasAppeared = true
            }
        }
        
    }
}
/*
struct CategoryTopButtons_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryTopButtons()
            .environmentObject(CategoryViewModel())
    }
    
}
*/
