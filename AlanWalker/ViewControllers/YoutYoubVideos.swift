//
//  YoutYoubLoading.swift
//  AlanWalker
//
//  Created by Hady on 9/28/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import WebKit

class YoutYoubLoading: UIViewController , WKUIDelegate{
    
    var webview : WKWebView!
    
    override func loadView() {
        let confitguration = WKWebViewConfiguration()
        
        webview = WKWebView(frame: .zero, configuration: confitguration)
        webview.uiDelegate = self
        view = webview
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "www.google.com")
        let Request = URLRequest(url: url!)
        webview.load(Request)
        // Do any additional setup after loading the view.
    }
    
    
}
