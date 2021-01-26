//
//  ViewController.swift
//  Activity-Ring-Animation
//
//  Created by Abdihakin Elmi on 1/25/21.
//

import UIKit

class ViewController: UIViewController {

    /// layer that draws a cubic Bezier spline in its coordinate space.
    let shape = CAShapeLayer()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Calorie goal"
        label.font = .systemFont(ofSize: 36, weight: .light)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        
        ///path that consists of straight and curved line segments that you can render in your custom views.
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150, //size of the circle
                                      startAngle: -(.pi / 2), //.pi = 180/2 = 90
                                      endAngle: .pi * 2, //.pi = 180*2 = 360
                                      clockwise: true) // draws the circle in clockwise fashion way.
        
        let trackPath = CAShapeLayer() ///A layer that draws a cubic Bezier spline in its coordinate space.
        trackPath.path = circlePath.cgPath
        trackPath.fillColor = UIColor.clear.cgColor
        trackPath.strokeColor = UIColor.lightGray.cgColor
        trackPath.lineWidth = 15
        view.layer.addSublayer(trackPath)
        
        
        shape.path = circlePath.cgPath
        shape.lineWidth = 15
        shape.strokeColor = UIColor.cyan.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        ///Appends the layer to the layer’s list of sublayers.
        view.layer.addSublayer(shape)
        
        //Button
        let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height - 100, width: view.frame.size.width-40, height: 50))
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTabAnimate), for: .touchUpInside)
        button.setTitle("Animate", for: .normal)
        button.backgroundColor = UIColor.cyan
        
        
    }
    
    //animation method
    @objc private func didTabAnimate(){
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }


}

