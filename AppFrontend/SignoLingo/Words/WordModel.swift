//
//  WordModel.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 28/09/23.
//

import Foundation
import SwiftUI

struct WordModel: Identifiable, Codable {
    var id: Int
    var word: String
    var categoryid: Int
    var definition: String
    var video: String
    var idsettings : Int
    var isscannable : Bool
    var audio: String
    var suggested1 : String
    var suggested2 : String
    

    private var image: String
    var imageW: Image {
        Image(image)
    }

}

struct WordData: Codable {
    var words: [WordModel]
}


struct WordDataFiltered: Codable {
    var wordsFiltered: [WordModel]
}

