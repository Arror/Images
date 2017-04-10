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
    
    @IBAction func setImageButtonTapped(_ sender: UIBarButtonItem) {
        
        self.imageView.img.setImage(urlStrings: ["https://i.ezbuy.sg/Frc0C3N6KjH9bWD7aOGJFWqJuJVn"])
    }
}

