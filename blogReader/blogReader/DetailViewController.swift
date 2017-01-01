//
//  DetailViewController.swift
//  blogReader
//
//  Created by Doug Wells on 12/31/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!



    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail = self.detailItem {
            
            self.title = (detail.value(forKey: "title") as! String)
            
            if let blogWebView = self.webView {
                blogWebView.loadHTMLString(detail.value(forKey: "content") as! String, baseURL: nil)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
            }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var detailItem: Event? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }


}

