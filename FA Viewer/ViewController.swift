//
//  ViewController.swift
//  FA Viewer
//
//  Created by Eunmo Yang on 5/19/18.
//  Copyright © 2018 Eunmo Yang. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://1.235.106.140:3050")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }
    
    override func prefersHomeIndicatorAutoHidden() -> Bool {
        return true
    }
}

