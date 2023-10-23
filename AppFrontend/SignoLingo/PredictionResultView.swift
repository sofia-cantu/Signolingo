//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    @ObservedObject var classifierViewModel: ClassifierViewModel
    @EnvironmentObject var modelData: ModelDataWord
    @State private var collectedItem = ""
    @State private var collectedItemEmoji = ""
    @State private var collectAlert = false
    @State private var clearAlert = false
    @State var numberOfItems = ["Conejo": 0, "Durazno": 0, "Gato": 0, "Pelota": 0, "Muñeca": 0, "Manzana": 0, "Naranja": 0, "Perro": 0, "Pájaro": 0, "Sandía": 0, "Carrito": 0, "Teléfono": 0]
    @Binding var paused: Bool
    @State private var showingWordInfo: Bool = false
    @State private var selectedWord: WordModel? = nil
    
    var body: some View {
        
        VStack(alignment: .center){
            VStack {
                HStack(alignment: .center) {
                    VStack {
                        Text(labelData.label.capitalized)
                            .font(.custom("Chewy-Regular", size: 40))
                            .foregroundColor(.white)
                    }
                    .padding()
                    
                    
                }
                .background(Color(red: 159/255, green: 30/255, blue: 142/255).opacity(0.3))
                .cornerRadius(10)
                .padding(10)
                
            }
            HStack(alignment: .top){
                
                VStack(alignment: .center) {
                    Text("¡Encuentra los objetos!")
                        .font(.custom("Chewy-Regular", size: 30))
                        .foregroundColor(.black)
                    
                    List {
                        ForEach(classifierViewModel.classifierLabels.keys.sorted(), id: \.self) { labelName in
                            
                            if (labelName != "Desconocido") {
                                if (classifierViewModel.classifierLabels[labelName]!) {
                                    HStack {
                                        Text("\(labelName.capitalized)")
                                            .font(.custom("Arial", size: 20))
                                            .fontWeight(.bold)
                                            .foregroundColor(classifierViewModel.classifierLabels[labelName]! ? Color(red: 159/255, green: 30/255, blue: 142/255) : .white)
                                            .listRowBackground(Color(red: 0/255, green: 74/255, blue: 173/255).opacity(0.3))
                                        
                                        Spacer()
                                        
                                        if let itemCount = numberOfItems[labelName], itemCount != 0 {
                                            Button(action: {
                                                if modelData.words.isEmpty {
                                                    if let remoteJSONURL = URL(string: "https://vc5kqp87-3000.usw3.devtunnels.ms/api/v1/words/getall") {
                                                        modelData.loadWords(from: remoteJSONURL)
                                                    }
                                                }
                                                let foundWord = modelData.words.first(where: { $0.word == labelName })
                                                selectedWord = foundWord
                                                showingWordInfo.toggle()
                                            }) {
                                                Image(systemName: "info.square")
                                                    .foregroundColor(classifierViewModel.classifierLabels[labelName]! ? Color(red: 159/255, green: 30/255, blue: 142/255) : .white)
                                                    .font(.custom("Arial", size: 30))
                                            }
                                            .sheet(isPresented: $showingWordInfo) {
                                                if let word = selectedWord {
                                                    FoundWordView(word: word)
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    Text(labelName.capitalized)
                                        .font(.custom("Arial", size: 20))
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .listRowBackground(Color(red: 0/255, green: 74/255, blue: 173/255).opacity(0.3))
                                }
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .frame(maxWidth: 300)
                    
                    VStack(alignment: .center) {
                        
                        Button("Coleccionar") {
                            if (labelData.label != "Desconocido") {
                                collectAlert = true
                                paused.toggle()
                            }
                            collectedItem = labelData.label
                            collectedItemEmoji = labelData.emoji
                        }
                        .font(.custom("Chewy-Regular", size: 25))
                        .buttonStyle(RoundedRectButtonStyle(buttonColor: Color(red: 0/255, green: 74/255, blue: 173/255)))
                        .padding(10)
                        .alert(isPresented:$collectAlert) {
                            Alert(
                                
                                title: Text("Quieres agregar \(collectedItem) \(collectedItemEmoji) a la lista?"),
                                primaryButton: .destructive(Text("Coleccionar")) {
                                    collectItem(item: collectedItem)
                                    paused.toggle()
                                },
                                secondaryButton: .cancel(Text("Cancelar"),action: {
                                    paused.toggle()
                                })
                                
                            )
                            
                        }
                        
                        Button("Borrar lista") {
                            clearAlert = true
                        }
                        .font(.custom("Chewy-Regular", size: 25))
                        .buttonStyle(RoundedRectButtonStyle(buttonColor: Color(red: 159/255, green: 30/255, blue: 142/255)))
                        .padding(10)
                        .alert(isPresented:$clearAlert) {
                            Alert(
                                title: Text("Quieres borrar toda la lista?"),
                                primaryButton: .destructive(Text("Borrar")) {
                                    clearList()
                                },
                                secondaryButton: .cancel()
                            )
                            
                        }
                        
                    }
                }
                .onAppear(perform: classifierViewModel.loadJSON)
                .padding()
                
            }
        }
        .background(.white)
        
    }
    
    func clearList() {
        for (labelName, _) in classifierViewModel.classifierLabels {
            classifierViewModel.classifierLabels[labelName] = false
        }
    }
    
    func collectItem(item: String) {
        if (item != "Unknown") {
            classifierViewModel.classifierLabels[item] = true
            numberOfItems[item] = (numberOfItems[item] ?? 0) + 1
        }
    }
}


struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification(), classifierViewModel: ClassifierViewModel(), paused: .constant(false))
    }
}
