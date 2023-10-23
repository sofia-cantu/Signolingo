//
//  LiveCameraRepresentable.swift
//  coreML-starter
//
//  
//

import Foundation
import SwiftUI
import AVFoundation

struct LiveCameraRepresentable: UIViewControllerRepresentable {    
    
    /// Set to true to show and classify live video
    /// Set to false to pause live video and classification
    let running: Bool

    let handleObservations: (LivePredictionResults, String, String) -> ()

    func makeUIViewController(context: Context) -> LiveCameraViewController {
        let vc = LiveCameraViewController(handleObservations: handleObservations)
        do {
            try vc.runSession()
        } catch {
            print(error.localizedDescription)
        }
        return vc
    }
    
    func updateUIViewController(_ cameraViewController: LiveCameraViewController, context: Context) {
        cameraViewController.run(running)
    }
}
