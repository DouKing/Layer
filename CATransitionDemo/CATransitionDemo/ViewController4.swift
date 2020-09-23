//
//  ViewController4.swift
//  CATransitionDemo
//
//  Created by iosci on 2017/7/17.
//  Copyright © 2017年 secoo. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

  @IBOutlet weak var layerView: UIView!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  override var shouldAutorotate: Bool {
    return false
  }

  @IBAction func change(_ sender: UIButton) {
    let name = sender.title(for: .normal)!
    drawTimingPath(name: name)
  }

  @IBAction func customTimingFunction() {
    drawTimingFunctionPath(CAMediaTimingFunction(controlPoints: 1, 0, 0.5, 1))
  }

  private func drawTimingPath(name: String) {
    print(name)
	let function = CAMediaTimingFunction(name: CAMediaTimingFunctionName(rawValue: name))
    drawTimingFunctionPath(function)
  }

  private func drawTimingFunctionPath(_ function: CAMediaTimingFunction) {
    if let layers = layerView.layer.sublayers {
      for l in layers {
        print(l)
        l.removeFromSuperlayer()
      }
    }

    var controlPoint1: [Float] = [0, 0]
    var controlPoint2: [Float] = [0, 0]

    function.getControlPoint(at: 1, values: &controlPoint1)
    function.getControlPoint(at: 2, values: &controlPoint2)

    let path = UIBezierPath()
    path.move(to: .zero)
    path.addCurve(to: CGPoint(x: 1, y: 1),
                  controlPoint1: CGPoint(x: CGFloat(controlPoint1.first!), y: CGFloat(controlPoint1.last!)),
                  controlPoint2: CGPoint(x: CGFloat(controlPoint2.first!), y: CGFloat(controlPoint2.last!)))
    path.apply(CGAffineTransform(scaleX: 240, y: 240))

    let shapeLayer = CAShapeLayer()
    shapeLayer.strokeColor = UIColor.red.cgColor
    shapeLayer.fillColor = UIColor.clear.cgColor
    shapeLayer.lineWidth = 4
    shapeLayer.path = path.cgPath
    let tr = CATransform3DMakeTranslation(0, 240, 0);
    shapeLayer.transform = CATransform3DScale(tr, 1, -1, 1)

    layerView.layer.addSublayer(shapeLayer)
  }
}
