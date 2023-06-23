//
//  WebView.swift
//  H4X0R News
//
//  Created by Bryant Irawan on 6/12/23.
//

import Foundation
import WebKit
import SwiftUI
//opens a website without leaving app or entering a differnet browser

//currently SwifUI does not have a native WebView so need this clunky UIViewRepresentable
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
        
    }
}
