//
//  WebViewController.swift
//  pubg101
//
//  Created by Jervy Umandap on 5/27/21.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    var weaponName: String?
    var formattedWeaponName = ""
     
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        formattedWeaponName = (weaponName?.replacingOccurrences(of: " ", with: "+"))!
        
        let searchUrl = URL(string: "https://pubg.fandom.com/wiki/Special:Search?search=\(formattedWeaponName)&go=Go")
        guard let myURL = searchUrl else {
            return
        }
        
        let myRequest = URLRequest(url: myURL)
        webView.load(myRequest)
    }
    
    
    
}
