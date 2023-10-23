//
//  SuggestedButton.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 08/10/23.
//

import SwiftUI

struct SuggestedButton: View {
    let suggestedWord: String
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(suggestedWord)
                .font(.custom("Chewy-Regular", size: 40))
                .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                .frame(minWidth: 0, maxWidth: 250, minHeight: 0, maxHeight: 100)
                .background(Color.white)
                .border(Color.black, width: 1)
                .cornerRadius(10)
                .padding([.leading, .trailing], 10)
        }
        .padding(EdgeInsets(top: 20, leading: 10, bottom: 20, trailing: 10))
    }
}
