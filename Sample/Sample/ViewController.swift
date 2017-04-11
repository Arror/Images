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
        
        let extensionInfo = ImageURLInfo(mode: .m0)
        
        let width = Int(self.imageView.bounds.width)
        let height = Int(self.imageView.bounds.height)
        
        let info = extensionInfo.makeQiniuImageURLExtension(w: width, h: height)
        
        let urlString = "https://i.ezbuy.sg/Frc0C3N6KjH9bWD7aOGJFWqJuJVn?\(info)"
        
        print(urlString)
        
        self.imageView.img.setImage(urlStrings: [urlString])
    }
}

