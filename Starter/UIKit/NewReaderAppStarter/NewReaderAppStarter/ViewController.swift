//
//  ViewController.swift
//  NewReaderAppStarter
//
//  Created by Ravi Shankar on 11/11/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet private var webview: WKWebView!
    @IBOutlet private var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        webview.navigationDelegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let url = URL(string: "https://www.bbc.com/news/world")!
        webview.load(URLRequest(url: url))
    }
    
    // MARK:- WKWebView Delegate Methods
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Navigation Completed")
        activityIndicator.stopAnimating()
    }
}

