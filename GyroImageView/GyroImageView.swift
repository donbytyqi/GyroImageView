//
//  GyroImageView.swift
//  GyroImageView
//
//  Created by Don Bytyqi on 7/9/19.
//  Copyright © 2019 Don Bytyqi. All rights reserved.
//

import UIKit
import CoreMotion

enum StartPoint {
    case left
    case middle
    case right
}

class GyroImageView: UIView {
    
    private let motionManager = CMMotionManager()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: UIScreen.main.bounds)
        scrollView.isUserInteractionEnabled = false
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    /// Motion manager starts capturing gyroscope data only when the image is set.
    var image: UIImage? = nil {
        didSet {
            guard let image = image else { return }
            imageView.image = image
            animateFor(image: image)
        }
    }
    
    /// Where the scrollView will point at when the image is first loaded. Default is MIDDLE.
    var startPoint: StartPoint = .middle
    
    /// Speed of scrolling animation. Default is 70.0.
    var speed: Double = 70.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        scrollView.addSubview(imageView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if imageView.frame != scrollView.bounds && image != nil {
            guard let image = image else { return }
            imageView.frame = CGRect(x: 0, y: 0, width: image.size.width, height: self.frame.height)
            setStartPoint()
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func animateFor(image: UIImage) {
        
        motionManager.gyroUpdateInterval = 0.1
        
        let highestScrollPoint = image.size.width - (UIScreen.main.bounds.width)
        let lowestScrollPoint = CGFloat(0.0)
        
        let mainOperationQueue = OperationQueue.main
        
        motionManager.startGyroUpdates(to: mainOperationQueue, withHandler: { (data, error) in
            guard let data = data else { return }
            
            let yRotationRate = data.rotationRate.y
            var currentScrollX = self.scrollView.contentOffset.x - CGFloat(yRotationRate * self.speed)
            
            if (currentScrollX > highestScrollPoint) {
                currentScrollX = highestScrollPoint
            } else if (currentScrollX < lowestScrollPoint) {
                currentScrollX = lowestScrollPoint
            }
            
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [.allowUserInteraction], animations: {
                self.scrollView.contentOffset = CGPoint(x: currentScrollX, y: CGFloat(0.0))
                self.scrollView.layoutIfNeeded()
            }, completion: nil)
            
        })
    }
    
    func setStartPoint() {
        guard let image = image else { return }
        
        switch startPoint {
        case .left:
            self.scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)
        case .middle:
            self.scrollView.contentOffset = CGPoint(x: image.size.width / 2, y: 0.0)
        case .right:
            self.scrollView.contentOffset = CGPoint(x: image.size.width - (UIScreen.main.bounds.width), y: 0.0)
        }
        
    }
    
}