//
//  CircleButton.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 30/09/23.
//

import SwiftUI

struct CircleButton: View {
    @Binding var counterPush: Int
    @Binding var degreeCircle: Double
    @Binding var degreeImage: Double
    @Binding var rotateCircle: Bool
    @Binding var selectedCategoryIndex : Int
    
    @EnvironmentObject var categoryVM: CategoryViewModel
    @EnvironmentObject var modelData: ModelDataWord
    
    var body: some View {
        ZStack {
            ForEach(categoryVM.filteredCategories, id: \.id) { category in
                IconButton(category: category, rotateCircle: $rotateCircle, degreeImage: $degreeImage, degreeCircle: $degreeCircle, selectedCategoryIndex: $selectedCategoryIndex)
            }
        }
    }
}
