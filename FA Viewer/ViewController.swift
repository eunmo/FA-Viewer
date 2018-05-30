//
//  ViewController.swift
//  FA Viewer
//
//  Created by Eunmo Yang on 5/19/18.
//  Copyright © 2018 Eunmo Yang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate{

    var webView: WKWebView!
    
    override func loadView() {
        let userScript = WKUserScript(source: "window.isWebkit = true;", injectionTime: WKUserScriptInjectionTime.atDocumentStart, forMainFrameOnly: true)
        
        let contentController = WKUserContentController()
        contentController.addUserScript(userScript)
        
        let config = WKWebViewConfiguration()
        config.userContentController = contentController
        
        let cache = ImageCache()
        config.setURLSchemeHandler(cache, forURLScheme: "fa-custom-scheme")
        
        webView = WKWebView(frame: .zero, configuration: config)
        webView.uiDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: ImageCache.serverAddress)!
        webView.load(URLRequest(url: url))
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let doneAction = UIAlertAction(title: "Close", style: .default, handler: { (_) in
            completionHandler()
        })
        
        alert.addAction(doneAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}

