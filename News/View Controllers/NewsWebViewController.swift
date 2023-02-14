//
//  NewsWebViewController.swift
//  News
//
//  Created by Kabir Dhillon on 2/14/23.
//

import UIKit
import WebKit


class NewsWebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    var newsSelected: NewsArticle!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        webView.navigationDelegate = self
        setWebView()
    }
    

    func setWebView() {
        guard let url = URL(string: newsSelected.url) else {
            return
        }
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
    }

}

extension NewsWebViewController: WKNavigationDelegate {
    
}
