//
//  ViewController2.swift
//  CATransitionDemo
//
//  Created by iosci on 2017/7/14.
//  Copyright © 2017年 secoo. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {

  @IBOutlet weak var layerView: UIView!
  var colorLayer: CALayer?

  override func viewDidLoad() {
    super.viewDidLoad()
    colorLayer = CALayer()
    colorLayer?.frame = CGRect(x: 20, y: 20, width: 200, height: 200)
    colorLayer?.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1).cgColor

    let transition = CATransition()
    transition.type = kCATransitionPush
    transition.subtype = kCATransitionFromLeft
    colorLayer?.actions = ["backgroundColor" : transition]

    layerView.layer.addSublayer(colorLayer!)
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    changeColor()
  }

  private func changeColor() {
    colorLayer?.backgroundColor = UIColor.random().cgColor
  }

  /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */

}
