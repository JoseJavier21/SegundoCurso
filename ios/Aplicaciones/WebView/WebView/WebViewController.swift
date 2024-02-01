//
//  WebViewController.swift
//  WebView
//
//  Created by dam2 on 1/2/24.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    let webView = WKWebView()
    
    var progressView: UIProgressView!
    
    override func loadView() {
        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        webView.navigationDelegate = self
        
        webView.allowsBackForwardNavigationGestures = true
    
//        if let url = URL(string: "https://apple.com"){
//           let request = URLRequest(url: url)
//            webView.load(request)
//        }
        
        webView.load("https://google.com")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Abrir", style: .plain, target: self, action: #selector(abrirMenu))
        
        let gobackButton = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
        
        let goforwardButton = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        
        //Barra de progreso
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit()
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [gobackButton, goforwardButton,progressButton, spacer, refresh]
        navigationController?.isToolbarHidden = false
        
        
        
        //Cargar un fichero desde el proyectp
//        if let web = Bundle.main.url(forResource: "web", withExtension: "html"){
//            webView.loadFileURL(web, allowingReadAccessTo: web.deletingLastPathComponent())
//        }
        
        //Cargar html desde una variable
//        let html = """
//            <html>
//            <body>
//                <h1>Hola mi gente</h1>
//                <ol>
//                    <li>una opcion</li>
//                    <li>segunda opcion</li>
//                    <li>tercera opcion</li>
//                </ol>
//            </body>
//            </html>
//        """
//        webView.loadHTMLString(html, baseURL: nil)

//        webView.evaluateJavaScript("document.getElementbyId('sm-1706812120893242534-7').innerText"){result,error in
//            if let result = result{
//                print(result)
//            }
//        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), context: nil)
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.title), context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
        removeObserver(self, forKeyPath: #keyPath(WKWebView.title))
    }
    
    @objc func abrirMenu(){
        let ac = UIAlertController(title: "Abrir pagina web", message: nil, preferredStyle: .actionSheet)
        
        ac.addAction(UIAlertAction(title: "escuelaestech.es", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        
        ac.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
        
        present(ac, animated: true)
    }
    
    func openPage(action: UIAlertAction){
        let url = URL(string: "https://" + action.title!)!
        webView.load(URLRequest(url: url))
    }
    
    
    
    // para restringir algunas paginas
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        if let host = navigationAction.request.url?.host{
            if host == "safari.com"{
                //UIApplication.shared.open(navigationAction.request.url!)
                webView.load("https://apple.es")
                decisionHandler(.cancel)
                return
            }
        
        }
        decisionHandler(.allow)
        
        //Para leer el historial
//        for page in webView.backForwardList.backList{
//            print("El usuario a visitado \(page.url.absoluteString)")
//        }
        
        
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatestimatedProgress"{
            //print(Float(webView.estimatedProgress))
            progressView.progress = Float(webView.estimatedProgress)
        }else if keyPath == title{
            print(webView.title)
            self.navigationItem.title = webView.title
        }
    }

}

extension WKWebView{
    
    func load(_ urlString: String){
        if let url = URL(string: urlString){
           let request = URLRequest(url: url)
            load(request)
        }else{
         // añadir codigo
            print("algo salio mal")
        }
    }
}
