//
//  WordDetail:.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 23/08/23.
//

import SwiftUI
import AVFAudio

struct WordDetail: View {
    
    @EnvironmentObject var categoryVM: CategoryViewModel
    @EnvironmentObject var modelData: ModelDataWord
    @State private var currentIndex: Int
    @State private var word: WordModel
    var category: CategoryModel
    
    @State private var audioPlayer: AVAudioPlayer!
    
    @State private var showingSuggestedWord = false
    @State private var selectedSuggestedWord: WordModel?
    
    
    init(word: WordModel, category: CategoryModel) {
        self._currentIndex = State(initialValue: word.id - 1)
        self._word = State(initialValue: word)
        self.category = category
    }
    
    func navigateToWord(_ word: WordModel) {
        self.word = word
        if let index = modelData.words.firstIndex(where: { $0.id == word.id }) {
            currentIndex = index
        }
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    
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
                            Image(systemName:  "speaker.wave.3")
                                .font(.system(size: 60))
                                .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                        }
                        
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
                        if let index = modelData.words.firstIndex(where: { $0.id == word.id }) {
                            currentIndex = index
                        }
                        currentIndex = max(currentIndex - 1, 0)
                        word = modelData.words[currentIndex]
                    }) {
                        Image(systemName: "arrow.left.circle")
                            .foregroundColor(Color(red: 0/255, green: 74/255, blue: 173/255))
                            .font(.system(size: 70))
                            .padding(50)
                    }
                    
                    SquareVideo(gifName: word.video)
                    
                    Button(action: {
                        if let index = modelData.words.firstIndex(where: { $0.id == word.id }) {
                            currentIndex = index
                        }
                        currentIndex = min(currentIndex + 1, modelData.words.count - 1)
                        word = modelData.words[currentIndex]
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
                
                VStack{
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
