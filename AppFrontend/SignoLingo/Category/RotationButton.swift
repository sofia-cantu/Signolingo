//
//  RotationButton.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 30/09/23.
//

import SwiftUI

struct RotationButton: View {
    @Binding var counterPush: Int
    @Binding var degreeCircle: Double
    @Binding var degreeImage: Double
    @Binding var rotateCircle: Bool
    @Binding var hasAppeared: Bool


    @EnvironmentObject var categoryVM: CategoryViewModel

    var body: some View {
        Button(action: {
            self.rotateCircle.toggle()
            counterPush += 1

            if counterPush <= categoryVM.filteredCategories.count {
                rotateCircle = true
                degreeCircle += 70
                degreeImage -= 70
            }

            if (counterPush == categoryVM.filteredCategories.count) {
                counterPush = 0
                degreeCircle = 90
                degreeImage = -90
            }
        }) {
            if counterPush != 0 {
                Image(systemName: "arrow.counterclockwise")
                    .font(.custom("Chewy-Regular", size: 70))
                    .foregroundColor(.white)
                    .padding()
            } else {
                Text("Click")
                    .font(.custom("Chewy-Regular", size: 50))
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(width: 150, height: 150)
        .background(Circle().fill(Color(red: 159/255, green: 30/255, blue: 142/255)))
        .offset(x: 300, y: 400)
        .shadow(color: .white, radius: 3)
        .onAppear {
            if !hasAppeared {
                self.rotateCircle.toggle()
                hasAppeared = true
            }
        }
    }
}
