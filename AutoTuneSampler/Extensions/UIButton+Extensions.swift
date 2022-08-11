//
//  UIButton+Extensions.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

extension UIButton {
    
    // MARK: - Create Button
    static func createButton(title: String, titleColor: UIColor = UIColor.white, bgColor: UIColor, addBorder: Bool = false) -> UIButton {
        
        let b = UIButton(type: .system)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(title, for: .normal)
        b.setTitleColor(titleColor, for: .normal)
        b.backgroundColor = bgColor
        b.layer.cornerRadius = 7
        
        if addBorder {
            b.layer.borderWidth = 3.5
            b.layer.masksToBounds = true
            b.layer.borderColor = UIColor.clear.cgColor
        }
        
        return b
    }
}

extension UIButton {
    
    // Shake Button
    func shakeUsingBasicAnimaion(duration: TimeInterval = 0.05, shakeCount: Float = 6, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = shakeCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - xValue, y: self.center.y - yValue))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + xValue, y: self.center.y - yValue))
        self.layer.add(animation, forKey: "shake")
    }
}
