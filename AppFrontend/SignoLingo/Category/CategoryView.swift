//
//  CategoryView.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 17/09/23.
//


import SwiftUI

struct CategoryView: View {

    @StateObject var categoryVM = CategoryViewModel()
    @StateObject var classifierViewModel = ClassifierViewModel()

    var body: some View {
        ZStack {
            VStack {
                
                CategoryTopButtons(classifierViewModel: classifierViewModel )
                    .environmentObject(categoryVM)
                
                Spacer()
                
                CircleButtons()
                     .environmentObject(categoryVM)
                 
                Spacer()
            }
        }
    }
}
/*
struct CategoryView_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryView()
            .environmentObject(CategoryViewModel())
    }
    
}*/
