//
//  CustomAppearanceProtocol.swift
//
//  Created by Vojta Stavik on 18/05/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//


import UIKit

protocol CustomAppearance {
    
    func applyAppearance()
}


protocol BackgroundColor {
    
    var pBackgroundColor: UIColor? { get }
}

protocol TextColor {
    
    var pTextColor: UIColor? { get }
}




extension UILabel: CustomAppearance {
    
    public override func awakeFromNib() {
        
        super.awakeFromNib()
        applyAppearance()
    }
    
    
    func applyAppearance() {
        
        if let aSelf = self as? BackgroundColor {
            
            backgroundColor = aSelf.pBackgroundColor
        }

        if let aSelf = self as? TextColor {
            
            textColor = aSelf.pTextColor
        }
    }
}


