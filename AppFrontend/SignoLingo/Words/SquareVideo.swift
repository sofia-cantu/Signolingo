//
//  SquareVideo.swift
//  SignoLingo
//
//  Created by Carolina Nicole González Leal on 18/09/23.
//

import SwiftUI
import WebKit

struct SquareVideo: View {
    var gifName: String

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(width: 550, height: 300)
                .cornerRadius(20)
                .shadow(radius: 5)

            WebViewWithGIF(urlString: gifName)
                .frame(width: 550, height: 300)
                .cornerRadius(20)
        }
    }
}

struct WebViewWithGIF: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = Bundle.main.url(forResource: urlString, withExtension: "gif") {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebViewWithGIF
        
        init(_ parent: WebViewWithGIF) {
            self.parent = parent
        }
    }
}
