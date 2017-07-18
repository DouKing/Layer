//
//  VCExtend.swift
//  CATransitionDemo
//
//  Created by iosci on 2017/7/17.
//  Copyright © 2017年 secoo. All rights reserved.
//

import UIKit

extension UINavigationController {
  open override var shouldAutorotate: Bool {
    return (topViewController?.shouldAutorotate)!
  }
}
