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
public protocol BorderWidth        { var pBorderWidth: CGFloat         { get } }
public protocol BorderColor        { var pBorderColor: UIColor         { get } }
public protocol ShadowColor        { var pShadowColor: UIColor         { get } }
public protocol ShadowOpacity      { var pShadowOpacity: Float         { get } }
public protocol ShadowOffset       { var pShadowOffset: CGSize         { get } }
public protocol ShadowRadius       { var pShadowRadius: CGFloat        { get } }
public protocol CornerRadius       { var pCornerRadius: CGFloat   { get } }
public protocol MasksToBoundsTRUE      { }
public protocol ShouldRasterizeTRUE    { }


// UIView
public protocol BackgroundColor    { var pBackgroundColor: UIColor     { get } }
public protocol TintColor          { var pTintColor: UIColor           { get } }
public protocol Alpha              { var pAlpha: CGFloat               { get } }
public protocol ContentMode        { var pContentMode: UIViewContentMode   { get } }
public protocol OpaqueTRUE         { }


// Text related
public protocol TextColor          { var pTextColor: UIColor           { get } }
public protocol Font               { var pFont: UIFont                 { get } }
public protocol TextAlignment      { var pTextAlignment: NSTextAlignment   { get } }


// UILabel
public protocol LineBreakMode      { var pLineBreakMode: NSLineBreakMode   { get } }
public protocol AdjustFontSizeToFitWidthTRUE    { }


// UIControl
public protocol ContentVerticalAlignment   { var pContentVerticalAlignment:     UIControlContentVerticalAlignment   { get } }
public protocol ContentHorizontalAlignment { var pContentHorizontalAlignment:   UIControlContentHorizontalAlignment { get } }


// UIButton
public protocol ContentEdgeInsets  { var pContentEdgeInsets    : UIEdgeInsets  { get } }
public protocol TitleEdgeInstets   { var pTitleEdgeInsets      : UIEdgeInsets  { get } }
public protocol TitleColorForState { var pTitleColorForState : [(UIControlState, UIColor)] { get } }
public protocol TitleShadowColorForState { var pTitleShadowColorForState : [(UIControlState, UIColor)]     { get } }
public protocol ImageForState      { var pImageForState :      [(UIControlState, UIImage)] { get } }
public protocol BackgroundImageForState    { var pBackgroundImageForState : [(UIControlState, UIImage)]    { get } }


// UIBarButtonItem + UISegmentedControl
public protocol TitleTextAttributesForState    { var pTitleTextAttributesForState : [(UIControlState, [String: AnyObject])]    { get } }


// UISlider
public protocol MinimumTrackTintColor  { var pMinimumTrackTintColor    : UIColor  { get } }
public protocol MaximumTrackTintColor  { var pMaximumTrackTintColor    : UIColor  { get } }
public protocol ThumbTintColor         { var pThumbTintColor           : UIColor  { get } }


// UIProgressView
public protocol ProgressTintColor      { var pProgressTintColor        : UIColor  { get } }
public protocol TrackTintColor         { var pTrackTintColor           : UIColor  { get } }


// UISwitch
public protocol OnTintColor            { var pOnTintColor              : UIColor { get } }
// ThumbTintColor is defined in UISlider


// UINavigationBar
public protocol BarTintColor       { var pBarTintColor: UIColor        { get } }
public protocol TransluentTRUE     { }


// UIPageControl
public protocol CurrentPageTintColor   { var pCurrentPageTintColor     : UIColor  { get } }
// for the tint color setting is used the TintColor protocol


// Customize appearance using closure
public typealias ProtocolUICustomClosure = () -> Void
public protocol CustomClosure      { var pCustomClosure:ProtocolUICustomClosure    { get } }



//////////////////////////////////////////////////////////////

// ProtocolUI

public protocol ProtocolUI {
    
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
        
        layer.masksToBounds     = self is MasksToBoundsTRUE
        layer.shouldRasterize   = self is ShouldRasterizeTRUE
        
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
            var attributes = titleTextAttributesForState(.Normal) ?? [String: AnyObject]()
            attributes[NSForegroundColorAttributeName] = aSelf.pTextColor
            setTitleTextAttributes(attributes, forState: .Normal)
        }
        
        if let aSelf = self as? Font {
            var attributes = titleTextAttributesForState(.Normal) ?? [String: AnyObject]()
            attributes[NSFontAttributeName] = aSelf.pFont
            setTitleTextAttributes(attributes, forState: .Normal)
        }
        
        if let aSelf = self as? TextAlignment {
            
            var attributes = titleTextAttributesForState(.Normal) ?? [String : AnyObject]()
            let paragraphStyle = (attributes[NSParagraphStyleAttributeName] ?? NSParagraphStyle()).mutableCopy() as? NSMutableParagraphStyle
            
            paragraphStyle?.alignment = aSelf.pTextAlignment
            
            attributes[NSParagraphStyleAttributeName] = paragraphStyle

            setTitleTextAttributes(attributes, forState: .Normal)
        }

        
        if let aSelf = self as? TitleTextAttributesForState {
            for (state, attributes) in aSelf.pTitleTextAttributesForState { setTitleTextAttributes(attributes, forState: state) }
        }
        
        // Custom Closure
        if let aSelf = self as? CustomClosure   { aSelf.pCustomClosure() }
    }

    public override func prepareForInterfaceBuilder() {
        
        applyProtocolUIAppearance()
    }
}

@IBDesignable // IBDesignable is not working for UIBarButtonItems?
extension UIBarButtonItem : ProtocolUI {
    
    override public func applyProtocolUIAppearance() {

        super.applyProtocolUIAppearance()
        
        if let aSelf = self as? TintColor       { tintColor             = aSelf.pTintColor }
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

        if let aSelf = self as? TextAlignment {
            
            let paragraphStyle = (titleTextAttributes?[NSParagraphStyleAttributeName] ?? NSParagraphStyle()).mutableCopy() as? NSMutableParagraphStyle
            
            paragraphStyle?.alignment = aSelf.pTextAlignment
            
            titleTextAttributes?[NSParagraphStyleAttributeName] = paragraphStyle
        }
        
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


@IBDesignable // IBDesignable is not working for UITabBarItems?
extension UITabBarItem : ProtocolUI {
    
    public override func applyProtocolUIAppearance() {

        super.applyProtocolUIAppearance()
        
        // TODO: Add more values
    }
}



extension UISearchBar {
    
    override public func applyProtocolUIAppearance() {
        
        super.applyProtocolUIAppearance()

        guard let searchTextField = valueForKey("searchField") as? UITextField else {
            
            print("#ProtocolUI: Error. Can get textField from UISearchBar.")
            return
        }
        
        if let aSelf = self as? TextColor       { searchTextField.textColor             = aSelf.pTextColor }
        if let aSelf = self as? Font            { searchTextField.font                  = aSelf.pFont }
        if let aSelf = self as? TextAlignment   { searchTextField.textAlignment         = aSelf.pTextAlignment }
    }
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
        
        // TODO: Is this a good idea?
        if let aSelf = self as? TextAlignment where (self is ContentHorizontalAlignment) == false {
            
            let textAlignment2ContentAlignment : (NSTextAlignment -> UIControlContentHorizontalAlignment?) = { textAlignment in
                
                switch textAlignment {
                    
                case .Left:
                    return .Left
                    
                case .Center:
                    return .Center
                    
                case .Right:
                    return .Right
                    
                default:
                    return nil
                }
            }
            
            contentHorizontalAlignment = textAlignment2ContentAlignment(aSelf.pTextAlignment) ?? contentHorizontalAlignment
        }

        
        if let aSelf = self as? ContentEdgeInsets   { contentEdgeInsets     = aSelf.pContentEdgeInsets }
        if let aSelf = self as? TitleEdgeInstets    { titleEdgeInsets       = aSelf.pTitleEdgeInsets }
        
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
        
        if let aSelf = self as? TextAlignment {
            
            var attributes = titleTextAttributesForState(.Normal) ?? [NSObject : AnyObject]()
            let paragraphStyle = (attributes[NSParagraphStyleAttributeName] ?? NSParagraphStyle()).mutableCopy() as? NSMutableParagraphStyle
            
            paragraphStyle?.alignment = aSelf.pTextAlignment
            
            attributes[NSParagraphStyleAttributeName] = paragraphStyle
            
            setTitleTextAttributes(attributes, forState: .Normal)
        }
        
        
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