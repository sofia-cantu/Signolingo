//
//  SignoLingoApp.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 17/09/23.
//

import SwiftUI

@main
struct SignoLingoApp: App {
    
    @StateObject private var modelData = ModelDataWord()
    @StateObject private var categoryVM = CategoryViewModel()
    @StateObject private var predictionStatus = PredictionStatus()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(modelData)
                .environmentObject(categoryVM)
                .environmentObject(predictionStatus)
                .preferredColorScheme(.light) // Define el esquema de color
                .onAppear {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
        }
    }
}
