//
//  SquareImage.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 23/08/23.
//

import SwiftUI

struct SquareImage: View {
    var imageW: Image
    
    var body: some View {
        imageW
            .resizable() // Hacer que la imagen sea redimensionable
            .aspectRatio(contentMode: .fill) // Llenar el rectángulo sin distorsionar la imagen
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.gray, lineWidth: 2)
                    .shadow(radius: 9)
                    .frame(width: 130, height: 130)
                
            )
        
        
    }
}

struct SquareImage_Previews: PreviewProvider {
    static var previews: some View {
        SquareImage(imageW: Image("parrot"))
    }
}
