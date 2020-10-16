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
    var urlString : String?
    
    override func loadView() {
        let confitguration = WKWebViewConfiguration()
        
        webview = WKWebView(frame: .zero, configuration: confitguration)
        webview.uiDelegate = self
        view = webview
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let urlValidation = urlString
        {
            let url = URL(string: urlValidation)
            
            if let completeUrl = url {
                
                let Request = URLRequest(url: completeUrl)
                webview.load(Request)
            }
        }
    }
    
    
}
