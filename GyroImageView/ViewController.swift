//
//  ViewController.swift
//  GyroImageView
//
//  Created by Don Bytyqi on 7/9/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    let gyroImageView = GyroImageView(frame: UIScreen.main.bounds)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        gyroImageView.image = UIImage(named: "test")
        gyroImageView.speed = 70.0
        gyroImageView.startPoint = .middle
        self.view.addSubview(gyroImageView)
        
        self.view.addSubview(choosePhoto)
        
        choosePhoto.frame = CGRect(x: 32, y: 40, width: 100, height: 30)
    }
    
    private lazy var imagePickerController: UIImagePickerController = {
        let ipc = UIImagePickerController()
        ipc.delegate = self
        ipc.allowsEditing = false
        return ipc
    }()
    
    private lazy var choosePhoto: UIButton = {
        let cp = UIButton(type: .system)
        cp.setTitle("Choose photo", for: .normal)
        cp.addTarget(self, action: #selector(choosePhotoTapped), for: .touchUpInside)
        return cp
    }()
    
    @objc func choosePhotoTapped() {
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            gyroImageView.image = pickedImage
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    


}

