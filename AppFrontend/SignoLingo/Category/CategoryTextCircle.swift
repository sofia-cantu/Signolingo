//
//  CategoryTextCircle.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 30/09/23.
//

import SwiftUI

struct CategoryTextCircle: View {
    @Binding var counterPush: Int
    @EnvironmentObject var categoryVM: CategoryViewModel

    var body: some View {
        ZStack {
            ForEach(categoryVM.filteredCategories.indices, id: \.self) { index in
                if index == counterPush {
                    let category = categoryVM.filteredCategories[index]
                    Text(category.name)
                        .font(.custom("Chewy-Regular", size: 70))
                        .offset(x: 0, y: 0)
                        .foregroundColor(category.colorA)
                }
            }
        }
    }
}
