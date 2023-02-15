//
//  SearchWebViewController.swift
//  News
//
//  Created by Kabir Dhillon on 2/14/23.
//

import UIKit
import WebKit

class SearchWebViewController: UIViewController, WKNavigationDelegate {
    
    var selectedNews: NewsArticle!
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        setWebView()
    }
    

    func setWebView() {
        guard let url = URL(string: selectedNews.url) else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}
