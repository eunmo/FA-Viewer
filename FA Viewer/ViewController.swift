//
//  ViewController.swift
//  FA Viewer
//
//  Created by Eunmo Yang on 5/19/18.
//  Copyright © 2018 Eunmo Yang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.uiDelegate = self
        let url = URL(string: "http://1.235.106.140:3050")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
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

