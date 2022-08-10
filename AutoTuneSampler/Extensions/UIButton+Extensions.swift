//
//  UIButton+Extensions.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

extension UIButton {
    
    static func createButton(title: String, titleColor: UIColor = UIColor.white, bgColor: UIColor) -> UIButton {
        
        let b = UIButton(type: .system)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(title, for: .normal)
        b.setTitleColor(titleColor, for: .normal)
        b.backgroundColor = bgColor
        b.layer.cornerRadius = 7
        return b
    }
}
