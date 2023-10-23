//
//  IconButton.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 01/10/23.
//

import SwiftUI

struct IconButton: View {
    let category: CategoryModel
    @Binding var rotateCircle: Bool
    @Binding var degreeImage: Double
    @Binding var degreeCircle: Double
    
    @EnvironmentObject var categoryVM: CategoryViewModel
    @Binding var selectedCategoryIndex: Int
    @State private var isWordListActive = false
    
    var body: some View {
        let angle: Double
        let x: Double
        let y: Double
        
        if let index = categoryVM.filteredCategories.firstIndex(where: { $0.id == category.id }) {
            angle = Double(index) / Double(categoryVM.filteredCategories.count) * 2 * .pi
            x = 270 * cos(angle)
            y = 270 * sin(angle)
        } else {
            angle = 0
            x = 0
            y = 0
        }
        
        return ZStack {
            // Botón principal que activará la navegación
            Button(action: {
                selectedCategoryIndex = category.id
                isWordListActive.toggle() // Activa WordListFiltered
            }) {
                Image(systemName: category.icon)
                    .font(.system(size: 100))
                    .foregroundColor(category.colorA)
                    .padding()
                    .rotationEffect(.degrees(rotateCircle ? Double(-degreeImage) : 0), anchor: .center)
                    .animation(Animation.easeInOut(duration: 1))
            }
            
            // NavigationLink anidado controlado por isWordListActive
            NavigationLink(destination: WordListFiltered(selectedCategoryIndex: selectedCategoryIndex), isActive: $isWordListActive) {
                EmptyView()
            }
            .opacity(0)
        }
        .frame(width: 180, height: 180)
        .background(Circle().fill(Color.white))
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(category.colorA, lineWidth: 2)
        )
        .offset(x: CGFloat(x), y: CGFloat(y))
        .rotationEffect(.degrees(rotateCircle ? Double(-degreeCircle) : 0), anchor: .center)
        .animation(Animation.easeInOut(duration: 1))
        .shadow(color: category.colorA, radius: 3)
    }
}
