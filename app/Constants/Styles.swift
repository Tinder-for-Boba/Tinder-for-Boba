//
//  Styles.swift
//  app
//
//  Created by Paul Pan on 20/4/17.
//  Copyright © 2020 Foodie Inc. All rights reserved.
//

import UIKit
import YogaKit

let inputRadius: CGFloat = 20
let authMarginBetween: CGFloat = 40
let topLeftMargin: CGFloat = 25

extension UIImageView {
    func styleLoginLogo(safeAreaTop: CGFloat) {
        self.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = YGValue(safeAreaTop)
            layout.height = YGValue(ScreenDimensions.height / 3)
            layout.width = YGValue(ScreenDimensions.width / 1.5)
            layout.alignSelf = .center
        }
        self.contentMode = .scaleAspectFit
    }
}

extension UITextField {
    func styleAuth() {
        self.backgroundColor = .white
        self.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = YGValue(authMarginBetween)
            layout.marginLeft = YGValue(ScreenDimensions.width / 10)
            layout.marginRight = YGValue(ScreenDimensions.width / 10)
            layout.height = YGValue(ScreenDimensions.height / 17.5)
        }
        self.layer.cornerRadius = inputRadius
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenDimensions.width / 40, height: self.frame.height))
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}

extension UIView {
    func styleLoginButtons() {
        self.configureLayout{ (layout) in
            layout.isEnabled = true
            layout.marginTop = YGValue(authMarginBetween)
            layout.flexDirection = .row
            layout.justifyContent = .spaceBetween
            layout.paddingLeft = YGValue(ScreenDimensions.width / 6)
            layout.paddingRight = YGValue(ScreenDimensions.width / 6)
        }
    }
}

extension UIButton {
    func styleAuth() {
        self.backgroundColor = .black
        self.configureLayout { (layout) in
            layout.isEnabled = true
            layout.width = YGValue(ScreenDimensions.width / 4)
            layout.height = YGValue(ScreenDimensions.height / 17.5)
        }
        self.layer.cornerRadius = inputRadius
    }
    
    func styleSignupBack(safeAreaTop: CGFloat) {
        self.configureLayout { (layout) in
            layout.isEnabled = true
            layout.height = YGValue(ScreenDimensions.width / 5)
            layout.marginTop = YGValue(safeAreaTop + topLeftMargin)
            layout.marginLeft = YGValue(topLeftMargin)
            layout.width = YGValue(ScreenDimensions.width / 5)
        }
    }
    
    func styleSignupButton() {
        styleAuth()
        self.configureLayout { (layout) in
            layout.isEnabled = true
            layout.marginTop = YGValue(authMarginBetween)
            layout.alignSelf = .center
            layout.width = YGValue(ScreenDimensions.width / 2)
        }
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: 1.0)
                    return
                }
            }
        }

        return nil
    }
}
