//
//  ColorExtend.swift
//  CATransitionDemo
//
//  Created by iosci on 2017/7/17.
//  Copyright © 2017年 secoo. All rights reserved.
//

import UIKit

extension UIColor {
  class func random() -> UIColor! {
    let r = arc4random() % 256
    let g = arc4random() % 256
    let b = arc4random() % 256
    return UIColor(colorLiteralRed: Float(r) / 255.0, green: Float(g) / 255.0, blue: Float(b) / 255.0, alpha: 1)
  }
}
