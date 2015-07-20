//
//  ProtocolUI.swift
//
//  Created by Vojta Stavik on 18/05/15.
//  Copyright (c) 2015 STRV. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.


import UIKit


// MARK: - Base protocols (do not edit)

// CALayer
protocol BorderWidth        { var pBorderWidth: CGFloat         { get } }
protocol BorderColor        { var pBorderColor: UIColor         { get } }
protocol ShadowColor        { var pShadowColor: UIColor         { get } }
protocol ShadowOpacity      { var pShadowOpacity: Float         { get } }
protocol ShadowOffset       { var pShadowOffset: CGSize         { get } }
protocol ShadowRadius       { var pShadowRadius: CGFloat        { get } }
protocol CornerRadius: MasksToBoundsTRUE { var pCornerRadius: CGFloat   { get } }
protocol MasksToBoundsTRUE      { }
protocol ShouldRasterizeTRUE    { }


// UIView
protocol BackgroundColor    { var pBackgroundColor: UIColor     { get } }
protocol TintColor          { var pTintColor: UIColor           { get } }
protocol Alpha              { var pAlpha: CGFloat               { get } }


// Text related
protocol TextColor          { var pTextColor: UIColor           { get } }
protocol Font               { var pFont: UIFont                 { get } }
protocol TextAlignment      { var pTextAlignment: NSTextAlignment   { get } }
protocol AdjustFontSizeToFitWidthTRUE    { }

// UILabel
protocol LineBreakMode      { var pLineBreakMode: NSLineBreakMode   { get } }



// Customize appearance using closure
typealias ProtocolUICustomClosure = () -> Void
protocol CustomClosure      { var pCustomClosure:ProtocolUICustomClosure    { get } }



//////////////////////////////////////////////////////////////

// ProtocolUI

protocol ProtocolUI {
    
    func applyAppearance()
}


extension UIView: ProtocolUI {

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
        if let aSelf = self as? TintColor       { tintColor             = aSelf.pTintColor }
        if let aSelf = self as? Alpha           { alpha                 = aSelf.pAlpha }
        
        
        // Custom Closure
        if let aSelf = self as? CustomClosure   { aSelf.pCustomClosure() }
    }
}


extension UILabel {
    
    override func applyAppearance() {
        
        super.applyAppearance()
        
        if let aSelf = self as? TextColor       { textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { textAlignment         = aSelf.pTextAlignment }
        if let aSelf = self as? LineBreakMode   { lineBreakMode         = aSelf.pLineBreakMode }
        
        adjustsFontSizeToFitWidth = self is AdjustFontSizeToFitWidthTRUE
    }
}


extension UITextField {
    
    override func applyAppearance() {
        
        super.applyAppearance()
        
        if let aSelf = self as? TextColor       { textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { textAlignment         = aSelf.pTextAlignment }
        
        adjustsFontSizeToFitWidth = self is AdjustFontSizeToFitWidthTRUE
    }
}


extension UITextView {
    
    override func applyAppearance() {
        
        super.applyAppearance()
        
        if let aSelf = self as? TextColor       { textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { textAlignment         = aSelf.pTextAlignment }
    }
}



extension UIButton {
    
    override func applyAppearance() {
        
        super.applyAppearance()
        
        // If you want to set different colors for various UIControlStates use "CustomClosure" protocol instead
        if let aSelf = self as? TextColor       { setTitleColor(aSelf.pTextColor, forState: UIControlState.Normal) }

        if let aSelf = self as? Font            { titleLabel?.font      = aSelf.pFont }
    }
}


extension UIStepper {
    
    
}


extension UISegmentedControl {

}

