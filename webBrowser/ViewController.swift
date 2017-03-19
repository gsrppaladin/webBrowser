//
//  ViewController.swift
//  webBrowser
//
//  Created by Sam Greenhill on 3/12/17.
//  Copyright © 2017 simplyAmazingMachines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webAddress: UITextField!
    
    
    @IBOutlet var webView: UIWebView!
    
    var address: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            webView.scalesPageToFit = true
    }

    @IBAction func goPressed(_ sender: UIButton) {
        
        webAddress.resignFirstResponder()
        loadWebpage()
        
    }
    
    @IBAction func leftPressed(_ sender: UIBarButtonItem) {
        if webView.canGoBack {
            webView.goForward()
        }
    }
    
    @IBAction func rightPressed(_ sender: UIBarButtonItem) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func zoomOut(_ sender: UIBarButtonItem) {
        
        webView.scrollView.zoomScale -= 0.1
        
    }
    
    @IBAction func zoomIn(_ sender: UIBarButtonItem) {
        
        webView.scrollView.zoomScale += 0.1
    }
    
    
    func loadWebpage() {
        if webAddress.text != "" {
            address = webAddress.text!
            //this puts what is typed in the textfield into the variable address. 
            
            if address.hasPrefix("www.") {
                address = "http://" + address
            } else if !address.hasPrefix("http://") || !address.hasPrefix("https://") {
                address = "https://" + address
             }
            
            
            //url will be constructed with a string.
            //url request will need a url
            //webview will load page by giving it a url request.
            
            
            let url = URL(string: address)
            let request = URLRequest(url: url!)
            webView.loadRequest(request)
            
        }
    }
    
    
    

}

