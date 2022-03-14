//
//  FAView.swift
//  FAShimmerViews
//
//  Created by Fahad Attique on 01/10/2018.
//  Copyright © 2018 Fahid Attique. All rights reserved.
//

import UIKit

@IBDesignable
class FAView: UIView {
    
    @IBInspectable override public var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        
        set {
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable override public var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        
        set {
            layer.borderWidth = newValue
        }
    }
    
//    @IBInspectable override public var borderColor: UIColor {
//        get {
//            return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor)
//        }
//
//        set {
//            layer.borderColor = newValue.cgColor
//        }
//    }
    
    @IBInspectable
    override var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    override var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    override var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    override var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

