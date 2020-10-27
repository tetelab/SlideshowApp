//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 松岡哲平 on 2020/10/25.
//  Copyright © 2020 tetelab. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    //引数を受け取るための変数
    var imageNumber = UIImage(named: "Ham1.jpg")!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        //引数として受け取った画像を表示
        imageView.image = imageNumber
        
    }
}
