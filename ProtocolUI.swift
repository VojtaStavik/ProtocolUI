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
        
        if let aSelf = self as? BackgroundColor {
            
            backgroundColor = aSelf.pBackgroundColor
        }

        if let aSelf = self as? CornerRadius {
            
            layer.cornerRadius = aSelf.pCornerRadius
            layer.masksToBounds = true
        }
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


