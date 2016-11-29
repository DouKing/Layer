//
//  DetailViewController.swift
//  CALayerDemo
//
//  Created by iosci on 2016/11/18.
//  Copyright © 2016年 secoo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    let photoHeight: CGFloat = 150
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CALayer()
        layer.backgroundColor = UIColor.red.cgColor
        layer.bounds = CGRect(x: 0, y: 0, width: photoHeight, height: photoHeight)
        layer.position = CGPoint(x: 160, y: 200)
        layer.cornerRadius = photoHeight / 2.0
        //注意仅仅设置圆角，对于图形而言可以正常显示，但是对于图层中绘制的图片无法正确显示
        //如果想要正确显示则必须设置masksToBounds=YES，剪切子图层
        layer.masksToBounds = true
        //阴影效果无法和masksToBounds同时使用，因为masksToBounds的目的就是剪切外边框，
        //而阴影效果刚好在外边框
//        layer.shadowOffset = CGSize(width: 5, height: 5)
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOpacity = 1
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        
        layer.delegate = self
        //调用图层setNeedDisplay,否则代理方法不会被调用
        layer.setNeedsDisplay()
        
        self.view.layer.addSublayer(layer)

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

extension DetailViewController: CALayerDelegate {
    func draw(_ layer: CALayer, in ctx: CGContext) {
        print(layer) //他是上面定义的图层
        ctx.saveGState()
        //图形上下文形变，解决图片倒立的问题
        ctx.scaleBy(x: 1, y: -1)
        ctx.translateBy(x: 0, y: -photoHeight)
        
        let image = UIImage(named: "tree.jpg")
        //相对于图层而不是屏幕
        if let img = image?.cgImage {
            ctx.draw(img, in: CGRect(x: 0, y: 0, width: photoHeight, height: photoHeight))
        }
        
        ctx.restoreGState()
    }
}
