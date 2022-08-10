//
//  UILabel+Extensions.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

extension UILabel {
    
    static func createLabel(text: String) -> UILabel {
        
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.text = text
        l.font = UIFont.systemFont(ofSize: 17)
        l.textColor = UIColor.black
        l.textAlignment = .center
        return l
    }
}
