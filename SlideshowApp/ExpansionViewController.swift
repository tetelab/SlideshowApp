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
    var imageNumber = UIImage(named: "Ham1")!

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageNumber
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
