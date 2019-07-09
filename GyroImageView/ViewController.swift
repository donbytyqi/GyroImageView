//
//  ViewController.swift
//  GyroImageView
//
//  Created by Don Bytyqi on 7/9/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gyroImageView = GyroImageView(frame: UIScreen.main.bounds)
        gyroImageView.image = UIImage(named: "test4")
        gyroImageView.speed = 150.0
        gyroImageView.startPoint = .middle
        self.view.addSubview(gyroImageView)
        
    }


}

