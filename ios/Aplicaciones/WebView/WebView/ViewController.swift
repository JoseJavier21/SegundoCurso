//
//  ViewController.swift
//  WebView
//
//  Created by dam2 on 1/2/24.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.navigationDelegate = self
        
        let url = URL(string: "https://escuelaestech.es")!
        
        webView.load(URLRequest(url: url))
        
        webView.allowsBackForwardNavigationGestures = true
    
        
    }

    
    @IBAction func irButton(_ sender: Any) {
        
        if let url = URL(string: textField.text ?? ""){
            webView.load(URLRequest(url: url))
        }
        
    }
    
    @IBAction func atras(_ sender: Any) {
        webView.goBack()
        
    }
    
    @IBAction func adelante(_ sender: Any) {
        webView.goForward()
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
}

