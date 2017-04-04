//
//  ViewController.swift
//  Sample
//
//  Created by Arror on 2017/4/4.
//  Copyright © 2017年 Arror. All rights reserved.
//

import UIKit
import Images

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let i1 = AnyIterator<URL>([URL(string: "http://github.com/logo.png")!].makeIterator())
        
        self.imageView.img.setImage(iterator: i1)
        
        let i2 = AnyIterator<URL>([URL(string: "http://github.com/logo.png")!].makeIterator())
        
        self.contentView.layer.img.setImage(iterator: i2)
    }
}

