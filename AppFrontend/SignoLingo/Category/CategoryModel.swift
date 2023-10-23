//
//  CategoryModel.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 19/09/23.
//

import Foundation
import SwiftUI

struct CategoryModel: Identifiable, Codable {
    var id : Int
    var name: String
    var color: String
    var icon: String
    
    var colorA: Color {
        switch color {
        case "rojo":
            return Color.red
        case "naranja":
            return Color.orange
        case "amarillo":
            return Color.yellow
        case "verde":
            return Color.green
        case "azul":
            return Color.blue
        case "morado":
            return Color.purple
        case "cafe":
            return Color.brown
        default:
            return Color.black
        }
    }
}

