//
//  DetailViewController2.swift
//  CALayerDemo
//
//  Created by iosci on 2016/11/18.
//  Copyright © 2016年 secoo. All rights reserved.
//

import UIKit

class DetailViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let starView = StarView(frame: self.view.bounds)
        starView.backgroundColor = UIColor.yellow
        self.view.addSubview(starView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

class StarLayer: CALayer {
    override func draw(in ctx: CGContext) {
        ctx.setFillColor(#colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).cgColor)
        ctx.setStrokeColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1).cgColor)
        ctx.move(to: CGPoint(x: 94.5, y: 33.5))
        
        ctx.addLine(to: CGPoint(x: 104.02, y: 47.39))
        ctx.addLine(to: CGPoint(x: 120.18, y: 52.16))
        ctx.addLine(to: CGPoint(x: 109.91, y: 65.51))
        ctx.addLine(to: CGPoint(x: 110.37, y: 82.34))
        ctx.addLine(to: CGPoint(x: 94.5, y: 76.7))
        ctx.addLine(to: CGPoint(x: 78.63, y: 82.34))
        ctx.addLine(to: CGPoint(x: 79.09, y: 65.51))
        ctx.addLine(to: CGPoint(x: 68.82, y: 52.16))
        ctx.addLine(to: CGPoint(x: 84.98, y: 47.39))
        ctx.addLine(to: CGPoint(x: 94.5, y: 33.5))

        ctx.drawPath(using: CGPathDrawingMode.fillStroke)
    }
}

class StarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let starLayer = StarLayer()
        starLayer.bounds = CGRect(x: 0, y: 0, width: 185, height: 185)
        starLayer.position = CGPoint(x: 160, y: 284)
        starLayer.backgroundColor = UIColor.cyan.cgColor
        starLayer.setNeedsDisplay()
        self.layer.addSublayer(starLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    override func draw(_ layer: CALayer, in ctx: CGContext) {
        super.draw(layer, in: ctx)
    }
    
}
