//
//  ViewController.swift
//  GradientDemo
//
//  Created by iosci on 2016/11/22.
//  Copyright © 2016年 secoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colorSets: [[CGColor]] = [
        [UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.green.cgColor],
        [UIColor.cyan.cgColor, UIColor.orange.cgColor, UIColor.blue.cgColor],
        [UIColor.brown.cgColor, UIColor.magenta.cgColor, UIColor.purple.cgColor]
    ]
    
    let colorLocations: [NSNumber] = [0.0, 0.35, 0.85]
    
    var currentIndex: Int = 0
    
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatGradientLayer()
        
        let singleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleSingleTapAction))
        self.view.addGestureRecognizer(singleTapGesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc private func handleSingleTapAction() {
        if currentIndex < colorSets.count - 1 {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        
        let colorChangeAnimation = CABasicAnimation(keyPath: "colors")
        colorChangeAnimation.duration = 0.5
        colorChangeAnimation.toValue = colorSets[currentIndex]
        colorChangeAnimation.fillMode = kCAFillModeForwards
        colorChangeAnimation.isRemovedOnCompletion = false
        colorChangeAnimation.delegate = self
        gradientLayer.add(colorChangeAnimation, forKey: "colorChange")
    }

    private func creatGradientLayer() {
        gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = colorSets[currentIndex]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.locations = colorLocations
        self.view.layer.addSublayer(gradientLayer)
    }
}

extension ViewController: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            gradientLayer.colors = colorSets[currentIndex]
        }
    }
}

