//
//  MainView.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 17/09/23.
//

import SwiftUI

struct MainView: View {
    @State private var isShowingToggles = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Button(action: {
                        isShowingToggles.toggle()
                    }) {
                        Image(systemName: "globe")
                            .font(.custom("Chewy-Regular", size: 40))
                            .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                    }
                    .offset(x: 330, y: -320)
                    
                    Text("SeñaLingo")
                        .font(.custom("Chewy-Regular", size: 100))
                        .foregroundColor(Color(red: 159/255, green: 30/255, blue: 142/255))
                    
                    Text("Diccionario Interactivo")
                        .font(.custom("Chewy-Regular", size: 50))
                        .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                    
                    NavigationLink(destination: CategoryView()){
                            Text("Iniciar")
                                .font(.custom("Chewy-Regular", size: 30))
                                .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                                .padding()
                                .background(.white)
                                .cornerRadius(10)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 0/255, green: 74/255, blue: 173/255), lineWidth: 1)
                                )
                        }
                }
            }
            .background {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .sheet(isPresented: $isShowingToggles) {
            LanguageList()
        }
    }
}
/*
struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
            .environmentObject(CategoryViewModel())
    }
}*/
