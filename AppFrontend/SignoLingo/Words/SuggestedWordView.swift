//
//  SuggestedWordView.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 10/10/23.
//

import SwiftUI
import AVFAudio

struct SuggestedWordView: View {
    @EnvironmentObject var categoryVM: CategoryViewModel
    @EnvironmentObject var modelData: ModelDataWord
    var word: WordModel
    var category: CategoryModel
    
    @State private var audioPlayer: AVAudioPlayer!

    /*init(word: WordModel, category: CategoryModel) {
        self._word = State(initialValue: word)
        self.category = category
    }*/

    var body: some View {
        ScrollView{
            VStack {
                HStack {
                    
                    // Carrusel de fotos
                    SquareImage(imageW: word.imageW)
                        .padding(.trailing, 30)
                    
                    VStack {
                        Text(word.word)
                            .font(.custom("Chewy-Regular", size: 80))
                            .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                        
                        Text(categoryVM.arrCategories.first(where: { $0.id == word.categoryid })?.name ?? "")
                            .font(.custom("Chewy-Regular", size: 25))
                            .multilineTextAlignment(.center)
                    }
                    
                    VStack {
                        
                        Button(action: {
                            let soundName = word.audio
                            guard let soundFile = NSDataAsset(name: soundName) else {
                                print("Could not read file name \(soundName)")
                                return
                            }
                            do {
                                audioPlayer = try AVAudioPlayer(data: soundFile.data)
                                audioPlayer.play()
                            }
                            catch {
                                print("Error \(error.localizedDescription) creating audioPlayer")
                            }
                        }) {
                            Image(systemName:  "speaker.wave.3")
                                .font(.system(size: 60))
                                .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                        }
                        .padding(.bottom, 5)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.gray, lineWidth: 2)
                            .shadow(radius: 9)
                            .frame(width: 130, height: 130)
                        
                    )
                    .padding(.leading, 50)
                    
                }
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 100, trailing: 0))
                
                SquareVideo(gifName: word.video)
                
                Text(word.definition)
                    .font(.custom("Arial", size: 40))
                    .multilineTextAlignment(.center)
                    .frame(width: 550, height: 250)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }

    }
}
