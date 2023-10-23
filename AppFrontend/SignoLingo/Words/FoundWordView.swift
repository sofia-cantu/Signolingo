//
//  FoundWordView.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 16/10/23.
//

import SwiftUI

struct FoundWordView: View {
    @EnvironmentObject var modelData: ModelDataWord
    var word: WordModel
    
    var body: some View {
        VStack {
            Text(word.word)
                .font(.custom("Chewy-Regular", size: 80))
                .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
            
            SquareVideo(gifName: word.video)
            
            Text(word.definition)
                .font(.custom("Arial", size: 40))
                .multilineTextAlignment(.center)
                .frame(width: 550, height: 250)
            
        }
    }
}
