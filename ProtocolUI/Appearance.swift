//
//  Appearance.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 15/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit

// MARK: - Base protocols (do not edit)

// CALayer
protocol BorderWidth        { var pBorderWidth: CGFloat         { get } }
protocol BorderColor        { var pBorderColor: UIColor         { get } }
protocol ShadowColor        { var pShadowColor: UIColor         { get } }
protocol ShadowOpacity      { var pShadowOpacity: Float         { get } }
protocol ShadowOffset       { var pShadowOffset: CGSize         { get } }
protocol ShadowRadius       { var pShadowRadius: CGFloat        { get } }
protocol CornerRadius: MasksToBoundsTRUE
                            { var pCornerRadius: CGFloat        { get } }


// UIView
protocol BackgroundColor    { var pBackgroundColor: UIColor     { get } }
protocol TintColor          { var pTintColor: UIColor           { get } }
protocol Aplha              { var pAlpha: CGFloat               { get } }


// UILabel
protocol TextColor          { var pTextColor: UIColor           { get } }
protocol Font               { var pFont: UIFont                 { get } }
protocol TextAlignment      { var pTextAlignment: NSTextAlignment
                                                                { get } }

// Customize appearance using closure
typealias ProtocolUICustomClosure = () -> Void
protocol CustomClosure      { var pCustomClosure:ProtocolUICustomClosure  { get } }



// Static protocols
// - protocol without a value
// - use them for setting boolean flags
// - you shouldn't be using them as a base for your custom protocols

protocol MasksToBoundsTRUE      { }
protocol ShouldRasterizeTRUE    { }


//


// MARK: - Your custom protocols
// (always inherit from one of the base protocols)

// MARK: Background color

protocol YellowBackground : BackgroundColor { }
extension YellowBackground {  var pBackgroundColor : UIColor { return UIColor.yellowColor() } }

protocol BlackBackground : BackgroundColor { }
extension BlackBackground {  var pBackgroundColor : UIColor { return UIColor.blackColor() } }



// MARK: Text Color

protocol GreenTextColor : TextColor { }
extension GreenTextColor { var pTextColor : UIColor { return UIColor.greenColor() } }


// MARK: Corner Radius

protocol RoundedCorners : CornerRadius { }
extension RoundedCorners {  var pCornerRadius : CGFloat { return 5 } }


// MARK: Closure protocols
protocol TestClosureProtocol: CustomClosure { }
extension TestClosureProtocol {
    
    var pCustomClosure : ProtocolUICustomClosure {
        
        return {
            
                if let _ = self as? UIView {
                    
                    print("I'm a UIView with ProtocolUICustomClosure!")
                }
            }
    }
}


// MARK: Compound protocols
protocol MainLabel : GreenTextColor, YellowBackground, RoundedCorners { }

