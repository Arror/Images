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
        
        let imgStr = "https://i.ezbuy.sg/Frc0C3N6KjH9bWD7aOGJFWqJuJVn"
        
        self.imageView.img.setImage(iterator: imgStr.makeImageURLIterator(size: self.imageView.bounds.size))
    }
}

