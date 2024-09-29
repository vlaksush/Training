//
//  SportsViewController.swift
//  NewsReader
//
//  Created by Ravi Shankar on 27/09/24.
//

import UIKit
import WebKit

class SportsViewController: UIViewController {
    
    @IBOutlet weak var webview: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://www.bbc.com/sport")
        let urlRequest = URLRequest(url: url!)
        webview.load(urlRequest)
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        webview.navigationDelegate = self
    }
}

extension SportsViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
