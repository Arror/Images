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
        
        let i = AnyIterator<URL>([URL(string: "https://i.ezbuy.sg/Frc0C3N6KjH9bWD7aOGJFWqJuJVn")!].makeIterator())
        
        self.imageView.img.setImage(iterator: i)
    }
}

