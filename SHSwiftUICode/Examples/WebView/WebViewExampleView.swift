//
//  WebViewExampleView.swift
//  SHSwiftUICode
//
//  Created by user on 5/13/24.
//

import SwiftUI
import WebKit

struct WebViewExampleView: View {
    var body: some View {
        WebViewWrapperView(url: "https://wala-land.com/")
    }
}

struct WebViewWrapperView: UIViewRepresentable {
    
    var url: String
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
        
        var parent: WebViewWrapperView

        init(_ parent: WebViewWrapperView) {
            self.parent = parent
        }

        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            ILog.debug(tag: #file, content: "didStartProvisionalNavigation \(navigation.description)")
//            parent.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            ILog.debug(tag: #file, content: "didFinish \(webView.url?.absoluteString ?? "")")
            ILog.debug(tag: #file, content: "didFinish \(navigation.description)")
//            parent.isLoading = false
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let urlStr = navigationAction.request.url?.absoluteString {
                ILog.debug(tag: #file, content: "decidePolicyFor \(urlStr)")
            }

            decisionHandler(.allow)
        }
        
        func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
            ILog.debug(tag: #file, content: "runJavaScriptAlertPanelWithMessage \(message)")
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            ILog.debug(tag: #file, content: "userContentController \(message)")
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: url) else {
            return WKWebView()
        }
        
        let configuration = createConfiguration()
        let wkWebView = WKWebView(frame: .zero, configuration: configuration)

        wkWebView.uiDelegate = context.coordinator
        wkWebView.navigationDelegate = context.coordinator
        
        wkWebView.scrollView.isScrollEnabled = true
        wkWebView.allowsBackForwardNavigationGestures = true
        wkWebView.scrollView.scrollsToTop = true
        wkWebView.scrollView.bounces = true
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        wkWebView.scrollView.showsHorizontalScrollIndicator = false
        wkWebView.backgroundColor = UIColor.white
        
        wkWebView.load(URLRequest(url: url))
        return wkWebView
    }
    
    func updateUIView(_ wkWebView: WKWebView, context: Context) {
        
        guard let url = URL(string: url) else { return }
        wkWebView.load(URLRequest(url: url))
    }
    
    private func createConfiguration() -> WKWebViewConfiguration {
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = false
        
        let webpagePreferences = WKWebpagePreferences()
        webpagePreferences.allowsContentJavaScript = true
      
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        configuration.defaultWebpagePreferences = webpagePreferences
        
        // 메모리에서 랜더링 후 보여줌 Defalt = false
        // true 일경우 랜더링 시간동안 Black 스크린이 나옴
        configuration.suppressesIncrementalRendering = true
        
        // true: disable native auto full-screen player
        // false: enable native auto full-screen player
        configuration.allowsInlineMediaPlayback = true
        
        // whether AirPlay is allowed.
        configuration.allowsAirPlayForMediaPlayback = false
        
        // 기본값 : true
        // whether HTML5 videos can play picture-in-picture.
        configuration.allowsPictureInPictureMediaPlayback = true
        
        // LocalStorage 사용하도록 설정
        configuration.websiteDataStore = WKWebsiteDataStore.default()

        configuration.mediaTypesRequiringUserActionForPlayback = WKAudiovisualMediaTypes.all
        
        return configuration
    }
}

#Preview {
    WebViewExampleView()
}
