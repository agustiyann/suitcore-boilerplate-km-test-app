//
//  SMButtonPrimary.swift
//  SMV-iper
//
//  Created by Rifat Firdaus on 13/12/18.
//  Copyright © 2018 Rifat Firdaus. All rights reserved.
//

import UIKit

@IBDesignable class SMButtonPrimary: SMButton {
    
    convenience init(bgColor: UIColor? = nil, titleColor: UIColor? = nil, font: UIFont? = nil, cornerRadius: CGFloat? = nil) {
        self.init()
        initialize(bgColor: bgColor, titleColor: titleColor, font: font, cornerRadius: cornerRadius)
    }

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initialize()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        initialize()
    }

    private func initialize(bgColor: UIColor? = nil, titleColor: UIColor? = nil, font: UIFont? = nil, cornerRadius: CGFloat? = nil) {
        self.backgroundColor = bgColor ?? SMUITheme.buttonTheme.primary.backgroundColor
        self.setTitleColor(titleColor ?? SMUITheme.buttonTheme.primary.titleColor, for: .normal)
        self.titleLabel?.font = font ?? SMUITheme.buttonTheme.primary.font
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius ?? SMUITheme.buttonTheme.primary.cornerRadius
    }
    
}
