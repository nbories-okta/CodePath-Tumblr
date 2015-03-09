//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Nicolas Bories on 3/7/15.
//  Copyright (c) 2015 Nico. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 56/255, green: 77/255, blue: 103/255, alpha: 0.9)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPressNevermind(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
