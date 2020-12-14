//
//  ViewController.swift
//  CATransitionDemo
//
//  Created by iosci on 2016/11/29.
//  Copyright © 2016年 secoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    changeBackgroundColor()
  }
  
  @IBAction func handleClickAction(_ sender: UIButton) {
    print(sender.title(for: .normal)!)
	transition(with: sender.title(for: .normal)!, subType: CATransitionSubtype.fromLeft.rawValue)
    changeBackgroundColor()
  }
  
  private func transition(with type: String, subType: String) {
    let animation = CATransition()
    animation.duration = 0.5
	animation.type = CATransitionType(rawValue: type)
	animation.subtype = CATransitionSubtype(rawValue: subType)
	animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    view.layer.add(animation, forKey: nil)
  }

  var index: Int = 0
  private func changeBackgroundColor() {
    let imageName = (index > 0) ? "02.jpg" : "01.jpg"
    let image = UIImage(named: imageName)
    view.backgroundColor = UIColor(patternImage: image!)
    index = (index == 0) ? 1 : 0
  }
  
}

