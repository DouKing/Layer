//
//  ViewController3.swift
//  CATransitionDemo
//
//  Created by iosci on 2017/7/14.
//  Copyright © 2017年 secoo. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

  var colorLayer: CALayer!

  override func viewDidLoad() {
    super.viewDidLoad()
    colorLayer = CALayer()
    colorLayer.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1).cgColor
    colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    colorLayer.position = CGPoint(x: view.bounds.size.width / 2.0, y: view.bounds.size.height / 2.0)
    view.layer.addSublayer(colorLayer)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    let point = touches.first?.location(in: view)
    //使用显示图层，而不是模型图层
    if ((colorLayer.presentation()?.hitTest(point!)) != nil) {
      changeColor()
    } else {
      CATransaction.begin()
      CATransaction.setAnimationDuration(4)
      colorLayer.position = point!
      CATransaction.commit()
    }
  }

  private func changeColor() {
//    colorLayer?.backgroundColor = UIColor.random().cgColor


    let keyframeAnimation = CAKeyframeAnimation()
    keyframeAnimation.keyPath = "backgroundColor"
    keyframeAnimation.duration = 2.0
    keyframeAnimation.values = [
      UIColor.blue.cgColor,
      UIColor.yellow.cgColor,
      UIColor.red.cgColor,
      UIColor.green.cgColor,
      UIColor.blue.cgColor
    ]
	let fn = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
    keyframeAnimation.timingFunctions = [fn, fn, fn, fn]
    colorLayer.add(keyframeAnimation, forKey: nil)
  }


  @IBAction func perform(_ sender: UIButton) {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
    view.layer.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    let coverView = UIImageView(image: image)
    coverView.frame = view.bounds
    view.addSubview(coverView)
    view.backgroundColor = UIColor.random()
    UIView.animate(withDuration: 1.0, animations: { 
      var transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
      transform = transform.rotated(by: CGFloat(Double.pi / 2.0))
      coverView.transform = transform
      coverView.alpha = 0
    }) { (finished) in
      coverView.removeFromSuperview()
    }
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
