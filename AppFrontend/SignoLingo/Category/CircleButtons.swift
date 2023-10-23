//
//  CircleButtons.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 21/09/23.
//

import SwiftUI

struct CircleButtons: View {
    @State private var rotate2D = false
    @State private var revealStroke = false
    @State private var moveAlongCircle = false
    @State private var rotateCircle = false
    @State private var counterPush = 0
    @State private var degreeCircle: Double = 90
    @State private var degreeImage: Double = -90
    @State private var hasAppeared = false
    @State var selectedCategoryIndex : Int = 0

    
    @EnvironmentObject var categoryVM: CategoryViewModel
    @StateObject private var modelData = ModelDataWord()
    
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Circle()
                        .fill(.white)
                        .frame(width: 540, height: 540)
                        .shadow(radius: 1)
                    
                    CategoryTextCircle(counterPush: $counterPush)
                    
                    CircleButton(
                        counterPush: $counterPush,
                        degreeCircle: $degreeCircle,
                        degreeImage: $degreeImage,
                        rotateCircle: $rotateCircle,
                        selectedCategoryIndex: $selectedCategoryIndex
                    )
                    
                    RotationButton(
                        counterPush: $counterPush,
                        degreeCircle: $degreeCircle,
                        degreeImage: $degreeImage,
                        rotateCircle: $rotateCircle,
                        hasAppeared: $hasAppeared
                    )

                }
            }
            Spacer()
        }
    }
}
