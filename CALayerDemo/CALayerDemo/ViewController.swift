//
//  ViewController.swift
//  CALayerDemo
//
//  Created by iosci on 2016/11/17.
//  Copyright © 2016年 secoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var box: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.box.layer.cornerRadius = 5
        self.box.layer.shadowOffset = CGSize(width: 10, height: 10)
        self.box.layer.shadowOpacity = 0.7
        self.box.layer.shadowRadius = 5
        self.box.layer.shadowColor = UIColor(colorLiteralRed: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1).cgColor
        
        self.box.layer.borderColor = UIColor.blue.cgColor
        self.box.layer.borderWidth = 3
        
        self.box.layer.contents = UIImage(named: "tree.jpg")?.cgImage
        self.box.layer.contentsGravity = kCAGravityResize
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

