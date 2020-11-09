//
//  YoutYoubLoading.swift
//  AlanWalker
//
//  Created by Hady on 9/28/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import UIKit
import WebKit
//import SVProgressHUD

class YoutYoubLoading: UIViewController , WKUIDelegate{
    
    
    var webView: WKWebView!
    var urlString : String?
    
    override func loadView() {
        
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        SVProgressHUD.show()
        let myURL = URL(string: urlString!)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
//        if !webView.isLoading { SVProgressHUD.dismiss()}
    }
}
