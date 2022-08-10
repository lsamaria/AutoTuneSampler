//
//  UITextField+Extensions.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

extension UITextField {
    
    static func createTextField(delegate: UITextFieldDelegate, placeholderText: String) -> UITextField {
        
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.delegate = delegate
        tf.placeholder = placeholderText
        tf.layer.cornerRadius = 7
        tf.layer.borderWidth = 0.5
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }
}

extension UITextField {
    
    func addNumericAccessory(addPlusMinus: Bool, useNumberPad: Bool = false) {
        let numberToolbar = UIToolbar()
        numberToolbar.barStyle = UIBarStyle.default
        
        var accessories : [UIBarButtonItem] = []
        
        if addPlusMinus {
            accessories.append(UIBarButtonItem(title: "+/-", style: UIBarButtonItem.Style.plain, target: self, action: #selector(plusMinusPressed)))
            accessories.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))   //add padding after
        }
        
        if useNumberPad {
            keyboardType = .numberPad
        }
        
        accessories.append(UIBarButtonItem(title: "Clear", style: UIBarButtonItem.Style.plain, target: self, action: #selector(numberPadClear)))
        accessories.append(UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil))   //add padding space
        accessories.append(UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(numberPadDone)))
        
        numberToolbar.items = accessories
        numberToolbar.sizeToFit()
        
        inputAccessoryView = numberToolbar
    }
    
    @objc func numberPadDone() {
        self.resignFirstResponder()
    }
    
    @objc func numberPadClear() {
        self.text = ""
    }
    
    @objc func plusMinusPressed() {
        guard let currentText = self.text else {
            return
        }
        if currentText.hasPrefix("-") {
            let offsetIndex = currentText.index(currentText.startIndex, offsetBy: 1)
            let substring = currentText[offsetIndex...]  //remove first character
            self.text = String(substring)
        }
        else {
            self.text = "-" + currentText
        }
    }
    
}
