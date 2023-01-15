//
//  WebViewController.swift
//  MySpaceAlbums
//
//  Created by Talha Gölcügezli on 15.01.2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    var webView : WKWebView!
    var progressView: UIProgressView!
    var selectedWebsites: String = "https://music.apple.com/us/album/sos/1657869377"
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload)) //page refresh
        let forward = UIBarButtonItem(title: ">", style: .done, target: webView, action: #selector(webView.goForward)) // page to forward
        let back = UIBarButtonItem(title: "<", style: .done, target: webView, action: #selector(webView.goBack)) // page to back

        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton,spacer, refresh,back,forward]
        navigationController?.isToolbarHidden = false

        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress),options: .new, context: nil)
        
        
        webView.load(URLRequest(url: URL(string: selectedWebsites)!))
        webView.allowsBackForwardNavigationGestures = true
        
        if webView.isLoading == false { // url blocking
            let ac = UIAlertController(title: "Page Blocked!", message: nil, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .cancel))
            present(ac, animated: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }

    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    

}

extension WebViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        let url = navigationAction.request.url
        
        if let host = url?.host {
            for website in selectedWebsites {
                if host.contains(website) {
                    decisionHandler(.allow)
                    return
                }
            }
        }
        
        decisionHandler(.cancel)
    }
}
