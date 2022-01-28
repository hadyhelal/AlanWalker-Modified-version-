//
//  YouTubeVideoVC.swift
//  AlanWalker
//
//  Created by Hady Helal on 03/11/2021.
//  Copyright © 2021 HadyOrg. All rights reserved.
//

import WebKit
//import SVProgressHUD

class YouTubeVideoVC: UIViewController, WKUIDelegate{

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
