//
//  ViewController.swift
//  EliKrouse-Assign6
//
//  Created by Krouse, William E. on 4/29/26.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var websiteURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let websiteURL = websiteURL,
              let url = URL(string: websiteURL) else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: url)
        webView.load(request)
        
    }


}

