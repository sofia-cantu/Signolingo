//
//  WordDetailFiltered.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 02/10/23.
//

import SwiftUI
import AVFAudio

struct WordDetailFiltered: View {
    @EnvironmentObject var categoryVM: CategoryViewModel
    @EnvironmentObject var modelData: ModelDataWord
    @State private var currentIndex: Int
    @State private var word: WordModel
    var category: CategoryModel
    var filteredWords: [WordModel]
    
    @State private var audioPlayer: AVAudioPlayer!
    
    @State private var showingSuggestedWord = false
    @State private var selectedSuggestedWord: WordModel?
    
    init(word: WordModel, category: CategoryModel, filteredWords: [WordModel]) {
        self._word = State(initialValue: word)
        self.category = category
        self.filteredWords = filteredWords
        
        if let index = filteredWords.firstIndex(where: { $0.id == word.id }) {
            self._currentIndex = State(initialValue: index) // Inicializa currentIndex con la posición encontrada
        } else {
            self._currentIndex = State(initialValue: 0) // Si no se encuentra, establece 0 como valor predeterminado
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    //Carrusel de fotos
                    SquareImage(imageW:word.imageW)
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
                                print("Error \(error.localizedDescription) creating audioPLayer")
                            }
                        }) {
                            Image(systemName: "speaker.wave.3" )
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
                
                
                HStack {
                    Button(action: {
                        currentIndex = max(currentIndex - 1, 0)
                        word = filteredWords[currentIndex]
                    }) {
                        Image(systemName: "arrow.left.circle")
                            .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                            .font(.system(size: 70))
                            .padding(50)
                    }
                    
                    SquareVideo(gifName: word.video)
                    
                    Button(action: {
                        currentIndex = min(currentIndex + 1, filteredWords.count - 1)
                        word = filteredWords[currentIndex]
                    }) {
                        Image(systemName: "arrow.right.circle")
                            .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                            .font(.system(size: 70))
                            .padding(50)
                    }
                }
                
                Text(word.definition)
                    .font(.custom("Arial", size: 40))
                    .multilineTextAlignment(.center)
                    .frame(width: 550, height: 250)
                
                Spacer()
                
                VStack {
                    Text("Sugerencias")
                        .font(.custom("Chewy-Regular", size: 40))
                        .foregroundColor(.gray)
                    
                    HStack {
                        SuggestedButton(suggestedWord: word.suggested1) {
                            if let suggestedWord = modelData.words.first(where: { $0.word == word.suggested1 }) {
                                selectedSuggestedWord = suggestedWord
                                showingSuggestedWord = true
                            }
                        }

                        SuggestedButton(suggestedWord: word.suggested2) {
                            if let suggestedWord = modelData.words.first(where: { $0.word == word.suggested2 }) {
                                selectedSuggestedWord = suggestedWord
                                showingSuggestedWord = true
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 50)
            }
            .onAppear {
                modelData.trackWord(word: word.word)
            }
            .sheet(item: $selectedSuggestedWord) { word in
                SuggestedWordView(word: word, category: category)
                    .environmentObject(categoryVM)
                    .environmentObject(modelData)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
    
}
