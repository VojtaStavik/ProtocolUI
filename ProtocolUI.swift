//
//  ProtocolUI.swift
//
//  Created by Vojta Stavik on 18/05/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//


import UIKit

protocol CustomAppearance {
    
    func applyAppearance()
}


extension UIView: CustomAppearance {

    public override func awakeFromNib() {
        
        super.awakeFromNib()
        applyAppearance()
    }
    
    func applyAppearance() {
        
        // CALayer
        if let aSelf = self as? BorderWidth     { layer.borderWidth     = aSelf.pBorderWidth }
        if let aSelf = self as? BorderColor     { layer.borderColor     = aSelf.pBorderColor.CGColor }
        if let aSelf = self as? ShadowColor     { layer.shadowColor     = aSelf.pShadowColor.CGColor }
        if let aSelf = self as? ShadowOpacity   { layer.shadowOpacity   = aSelf.pShadowOpacity }
        if let aSelf = self as? ShadowOffset    { layer.shadowOffset    = aSelf.pShadowOffset }
        if let aSelf = self as? ShadowRadius    { layer.shadowRadius    = aSelf.pShadowRadius }
        if let aSelf = self as? CornerRadius    { layer.cornerRadius    = aSelf.pCornerRadius }
        
        layer.masksToBounds = self is MasksToBoundsTRUE
        
        
        // UIView
        if let aSelf = self as? BackgroundColor { backgroundColor       = aSelf.pBackgroundColor }

        
        // Custom Closure
        if let aSelf = self as? CustomClosure   { aSelf.pCustomClosure() }
    }
}


extension UILabel {
    
    override func applyAppearance() {
        
        super.applyAppearance()
        
        if let aSelf = self as? TextColor {
            
            textColor = aSelf.pTextColor
        }
    }
}



extension UITextField {
    
    override func applyAppearance() {
        
        super.applyAppearance()
        
        if let aSelf = self as? TextColor {
            
            textColor = aSelf.pTextColor
        }
    }
}


