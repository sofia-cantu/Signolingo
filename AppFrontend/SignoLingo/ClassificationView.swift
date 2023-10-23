//
//  ClassificationView.swift
//  coreML-starter
//
//  
//

import SwiftUI

struct ClassificationView: View {
    
    @EnvironmentObject var predictionStatus: PredictionStatus
    @EnvironmentObject var modelData: ModelDataWord
    @ObservedObject var classifierViewModel: ClassifierViewModel
    @State var paused: Bool = false

    var body: some View {
        let predictionLabel = predictionStatus.topLabel

        HStack(alignment: .top){
            ZStack(alignment: .topLeading) {
                LiveCameraRepresentable(running: !paused) {
                    predictionStatus.setLivePrediction(with: $0, label: $1, confidence: $2)
                }
            }
            .onAppear(perform: classifierViewModel.loadJSON)
            .padding(.leading, 10)
            
            VStack {
                PredictionResultView(labelData: classifierViewModel.getPredictionData(label: predictionLabel), classifierViewModel: classifierViewModel, paused: $paused)

                //Toggle("Pause Video", isOn: $paused).fixedSize()
            }
        }
    }
}

struct ClassificationView_Previews: PreviewProvider {
    static var previews: some View {
        ClassificationView(classifierViewModel: ClassifierViewModel())
    }
}
