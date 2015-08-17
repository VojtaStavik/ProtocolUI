//
//  ProtocolUI.swift
//
//  Created by Vojta Stavik - www.vojtastavik.com
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


// MARK: - Base protocols (your protocols should inherit from these ones)
// note: This list is in the "proof of concept" state, and it contains just a few base protocols.


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
protocol ContentMode        { var pContentMode: UIViewContentMode   { get } }
protocol OpaqueTRUE         { }


// Text related
protocol TextColor          { var pTextColor: UIColor           { get } }
protocol Font               { var pFont: UIFont                 { get } }
protocol TextAlignment      { var pTextAlignment: NSTextAlignment   { get } }
protocol AdjustFontSizeToFitWidthTRUE    { }


// UILabel
protocol LineBreakMode      { var pLineBreakMode: NSLineBreakMode   { get } }


// UIControl
protocol ContentVerticalAlignment   { var pContentVerticalAlignment:     UIControlContentVerticalAlignment   { get } }
protocol ContentHorizontalAlignment { var pContentHorizontalAlignment:   UIControlContentHorizontalAlignment { get } }


// UIButton
protocol ContentEdgeInsets  { var pContentEdgeInsets    : UIEdgeInsets  { get } }
protocol TitleEdgeInstets   { var pTitleEdgeInsets      : UIEdgeInsets  { get } }
protocol TitleColorForState { var pTitleColorForState : [(UIControlState, UIColor)] { get } }
protocol TitleShadowColorForState { var pTitleShadowColorForState : [(UIControlState, UIColor)]     { get } }
protocol ImageForState      { var pImageForState :      [(UIControlState, UIImage)] { get } }
protocol BackgroundImageForState    { var pBackgroundImageForState : [(UIControlState, UIImage)]    { get } }


// UIBarButtonItem + UISegmentedControl
protocol TitleTextAttributesForState    { var pTitleTextAttributesForState : [(UIControlState, [String: AnyObject])]    { get } }


// UISlider
protocol MinimumTrackTintColor  { var pMinimumTrackTintColor    : UIColor  { get } }
protocol MaximumTrackTintColor  { var pMaximumTrackTintColor    : UIColor  { get } }
protocol ThumbTintColor         { var pThumbTintColor           : UIColor  { get } }


// UIProgressView
protocol ProgressTintColor      { var pProgressTintColor        : UIColor  { get } }
protocol TrackTintColor         { var pTrackTintColor           : UIColor  { get } }


// UISwitch
protocol OnTintColor            { var pOnTintColor              : UIColor { get } }
// ThumbTintColor is defined in UISlider


// UINavigationBar
protocol BarTintColor       { var pBarTintColor: UIColor        { get } }
protocol TransluentTRUE     { }


// UIPageControl
protocol CurrentPageTintColor   { var pCurrentPageTintColor     : UIColor  { get } }
// for the tint color setting is used the TintColor protocol


// Customize appearance using closure
typealias ProtocolUICustomClosure = () -> Void
protocol CustomClosure      { var pCustomClosure:ProtocolUICustomClosure    { get } }



//////////////////////////////////////////////////////////////

// ProtocolUI

protocol ProtocolUI {
    
    func applyProtocolUIAppearance()
}


@IBDesignable
extension UIView: ProtocolUI {

    public override func awakeFromNib() {
        
        super.awakeFromNib()
        applyProtocolUIAppearance()
    }
    
    public func applyProtocolUIAppearance() {
        
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
        if let aSelf = self as? ContentMode     { contentMode           = aSelf.pContentMode }
        
        opaque = self is OpaqueTRUE

        // Custom Closure
        if let aSelf = self as? CustomClosure   { aSelf.pCustomClosure() }
    }
    
    
    public override func prepareForInterfaceBuilder() {
        
        applyProtocolUIAppearance()
    }
}



extension UIBarItem {
    
    public override func awakeFromNib() {
        
        super.awakeFromNib()
        applyProtocolUIAppearance()
    }
    
    public func applyProtocolUIAppearance() {
        
        if let aSelf = self as? TextColor {
            setTitleTextAttributes([NSForegroundColorAttributeName : aSelf.pTextColor], forState: .Normal)
        }
        
        if let aSelf = self as? Font {
            setTitleTextAttributes([NSFontAttributeName : aSelf.pFont], forState: .Normal)
        }
        
        if let aSelf = self as? TitleTextAttributesForState {
            for (state, attributes) in aSelf.pTitleTextAttributesForState { setTitleTextAttributes(attributes, forState: state) }
        }
    }

    public override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        applyProtocolUIAppearance()
    }
}


@IBDesignable // IBDesignable is not working for UIBarButtonItems
extension UIBarButtonItem : ProtocolUI {
    
    public override func awakeFromNib() {
        
        super.awakeFromNib()
        applyProtocolUIAppearance()
    }
    
    
    public override func applyProtocolUIAppearance() {

        applyProtocolUIAppearance()
        
        if let aSelf = self as? TintColor       { tintColor             = aSelf.pTintColor }
    }
    
    
    public override func prepareForInterfaceBuilder() {
        
        super.prepareForInterfaceBuilder()
        applyProtocolUIAppearance()
    }
}


// IBDesignable is not working for UINavigationBar?
extension UINavigationBar {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? BackgroundColor    { barTintColor             = aSelf.pBackgroundColor }
        if let aSelf = self as? BarTintColor       { barTintColor             = aSelf.pBarTintColor }

        if self is BackgroundColor && self is BarTintColor {
            print("#ProtocolUI: UINavigationBar has set both, the BackgroundColor and BarTintColor values. The BarTintColor value is used.")
        }
        
        titleTextAttributes = titleTextAttributes ?? [String: AnyObject]()
        
        if let aSelf = self as? TextColor       { titleTextAttributes?[NSForegroundColorAttributeName]  = aSelf.pTextColor }
        if let aSelf = self as? Font            { titleTextAttributes?[NSFontAttributeName]             = aSelf.pFont }

        translucent = self is TransluentTRUE
    }
}


extension UIToolbar {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? BackgroundColor    { barTintColor             = aSelf.pBackgroundColor }
        if let aSelf = self as? BarTintColor       { barTintColor             = aSelf.pBarTintColor }
        
        if self is BackgroundColor && self is BarTintColor {
            print("#ProtocolUI: UIToolbar has set both, the BackgroundColor and BarTintColor values. The BarTintColor value is used.")
        }

        
        translucent = self is TransluentTRUE
    }
}


extension UITabBar {
    
    // TODO: Add more values
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? BackgroundColor    { barTintColor             = aSelf.pBackgroundColor }
        if let aSelf = self as? BarTintColor       { barTintColor             = aSelf.pBarTintColor }
        
        if self is BackgroundColor && self is BarTintColor {
            print("#ProtocolUI: UITabBar has set both, the BackgroundColor and BarTintColor values. The BarTintColor value is used.")
        }
        
        translucent = self is TransluentTRUE
    }
}


extension UITabBarItem {
    
    // Everything is handled in UIBarItem?
}


extension UISearchBar {
    
    // TODO!
}



extension UILabel {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TextColor       { textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { textAlignment         = aSelf.pTextAlignment }
        if let aSelf = self as? LineBreakMode   { lineBreakMode         = aSelf.pLineBreakMode }
        
        adjustsFontSizeToFitWidth = self is AdjustFontSizeToFitWidthTRUE
    }
}


extension UITextField {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TextColor       { textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { textAlignment         = aSelf.pTextAlignment }
        
        adjustsFontSizeToFitWidth = self is AdjustFontSizeToFitWidthTRUE
    }
}


extension UITextView {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TextColor       { textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { textAlignment         = aSelf.pTextAlignment }
    }
}



extension UIControl {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? ContentVerticalAlignment    { contentVerticalAlignment      = aSelf.pContentVerticalAlignment }
        if let aSelf = self as? ContentHorizontalAlignment  { contentHorizontalAlignment    = aSelf.pContentHorizontalAlignment }
    }
}



extension UIButton {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TextColor       { setTitleColor(aSelf.pTextColor, forState: UIControlState.Normal) }
        if let aSelf = self as? Font            { titleLabel?.font      = aSelf.pFont }
        
        if let aSelf = self as? TitleColorForState {
            for (state, color) in aSelf.pTitleColorForState { setTitleColor(color, forState: state) }
        }

        if let aSelf = self as? TitleShadowColorForState {
            for (state, color) in aSelf.pTitleShadowColorForState { setTitleShadowColor(color, forState: state) }
        }
        
        if let aSelf = self as? ImageForState {
            for (state, image) in aSelf.pImageForState { setImage(image, forState: state) }
        }

        if let aSelf = self as? BackgroundImageForState {
            for (state, image) in aSelf.pBackgroundImageForState { setBackgroundImage(image, forState: state) }
        }
    }
}


extension UISegmentedControl {
    
    public override func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TextColor   { setTitleTextAttributes([NSForegroundColorAttributeName : aSelf.pTextColor], forState: .Normal) }
        if let aSelf = self as? Font        { setTitleTextAttributes([NSFontAttributeName : aSelf.pFont], forState: .Normal) }
        
        if let aSelf = self as? TitleTextAttributesForState {
            for (state, attributes) in aSelf.pTitleTextAttributesForState { setTitleTextAttributes(attributes, forState: state) }
        }
    }
}


extension UISlider {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? MinimumTrackTintColor   { minimumTrackTintColor     = aSelf.pMinimumTrackTintColor }
        if let aSelf = self as? MaximumTrackTintColor   { maximumTrackTintColor     = aSelf.pMaximumTrackTintColor }
        if let aSelf = self as? ThumbTintColor          { thumbTintColor            = aSelf.pThumbTintColor }
    }
}


extension UIProgressView {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? ProgressTintColor       { progressTintColor         = aSelf.pProgressTintColor }
        if let aSelf = self as? TrackTintColor          { trackTintColor            = aSelf.pTrackTintColor }
    }
}


extension UISwitch {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? OnTintColor             { onTintColor               = aSelf.pOnTintColor }
        if let aSelf = self as? ThumbTintColor          { thumbTintColor            = aSelf.pThumbTintColor }
    }
}


extension UIPageControl {

    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TintColor               { pageIndicatorTintColor        = aSelf.pTintColor }
        if let aSelf = self as? CurrentPageTintColor    { currentPageIndicatorTintColor = aSelf.pCurrentPageTintColor }
    }
}