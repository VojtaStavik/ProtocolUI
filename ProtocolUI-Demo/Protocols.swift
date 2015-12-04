//
//  Temp.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 28/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit
import ProtocolUI

// examples for blog post http://vojtastavik.com/2015/07/29/protocolui-customizing-uikit-using-protocols/

struct Fonts {
    
    static let MainFont = UIFont(name: "Helvetica Neue", size: 15.0)!
}

struct Colors {
    
    static let MainColor = UIColor.redColor()
}


protocol GreenBackgroundColor : BackgroundColor  { }
extension GreenBackgroundColor { var pBackgroundColor : UIColor { return UIColor.greenColor() } }

@IBDesignable
class MyView : UIView, GreenBackgroundColor { }
@IBDesignable
class MyButton : UIButton, GreenBackgroundColor { }
@IBDesignable
class MyTextField : UITextField, GreenBackgroundColor { }


protocol YellowBackgroundColor : BackgroundColor  { }
extension YellowBackgroundColor { var pBackgroundColor : UIColor { return UIColor.yellowColor() } }

protocol BlueBackgroundColor : BackgroundColor  { }
extension BlueBackgroundColor { var pBackgroundColor : UIColor { return UIColor.blueColor() } }

protocol GrayBackground : BackgroundColor  { }
extension GrayBackground { var pBackgroundColor : UIColor { return UIColor.lightGrayColor() } }



protocol ButtonFont : Font { }
extension ButtonFont { var pFont : UIFont { return Fonts.MainFont } }

protocol ButtonAppearance : YellowBackgroundColor, ButtonFont, CornerRadius, MasksToBoundsTRUE, LeftAlignment { }
extension ButtonAppearance { var pCornerRadius : CGFloat { return 10 } }



protocol GreenBorder : BorderColor { }
extension GreenBorder { var pBorderColor : UIColor { return UIColor.greenColor() } }

protocol DefaultBorderWidth : BorderWidth { }
extension DefaultBorderWidth { var pBorderWidth : CGFloat { return 2.0 } }

protocol CallToActionAppearance : GreenBorder, DefaultBorderWidth { }



protocol WhiteTextColor : TextColor { }
extension WhiteTextColor { var pTextColor : UIColor { return UIColor.whiteColor() } }


@IBDesignable
class RegularButton : UIButton, ButtonAppearance { }
@IBDesignable
class CallToActionButton : UIButton, ButtonAppearance, CallToActionAppearance { }
@IBDesignable
class CallToActionTextField : UITextField, WhiteTextColor, BlueBackgroundColor, CallToActionAppearance { }

@IBDesignable
class RegularBackgroundView : UIView, GrayBackground { }


protocol SmartButtonApperance : TitleColorForState { }
extension SmartButtonApperance {

    var pTitleColorForState : [(UIControlState, UIColor)] {
        
        return [ (.Normal, UIColor.brownColor() ),(.Highlighted, UIColor.greenColor()) ]
    }
}

@IBDesignable
class MySmartButton : UIButton, ButtonAppearance, SmartButtonApperance { }



protocol RedTintColor : TintColor { }
extension RedTintColor { var pTintColor : UIColor { return Colors.MainColor } }
@IBDesignable
class RedBarButtonItem : UIBarButtonItem, RedTintColor, ButtonFont { }


protocol LeftAlignment : TextAlignment { }
extension LeftAlignment { var pTextAlignment : NSTextAlignment { return NSTextAlignment.Right } }

@IBDesignable
class RedSegmentedControl : UISegmentedControl, RedTintColor, ButtonFont { }
@IBDesignable
class WhiteBarButtonItem : UIBarButtonItem, WhiteTextColor { } // I can use either TintColor or TextColor for this



protocol YellowBarTintColor : BarTintColor { }
extension YellowBarTintColor { var pBarTintColor : UIColor { return UIColor.yellowColor() } }

@IBDesignable
class YellowNavigationBar : UINavigationBar, YellowBarTintColor, YellowBackgroundColor, ButtonFont { }
@IBDesignable
class YellowToolbar : UIToolbar, YellowBackgroundColor { } // I can use either BakckgorundColor or BarTintColor for this




protocol RegulagSliderAppearance : MaximumTrackTintColor, MinimumTrackTintColor, ThumbTintColor { }
extension RegulagSliderAppearance {
    
    var pMaximumTrackTintColor : UIColor { return UIColor.greenColor() }
    var pMinimumTrackTintColor : UIColor { return UIColor.redColor() }
    var pThumbTintColor : UIColor { return UIColor.grayColor() }
}

@IBDesignable
class MySlider : UISlider, RegulagSliderAppearance { }


protocol MyProgressViewAppearance : ProgressTintColor, TrackTintColor, RedTintColor { }
extension MyProgressViewAppearance {
    
    var pProgressTintColor : UIColor { return pTintColor }
    var pTrackTintColor : UIColor { return pTintColor.colorWithAlphaComponent(0.3) }
}

@IBDesignable
class MyProgressView : UIProgressView, MyProgressViewAppearance { }


protocol MySwitchAppearance : OnTintColor, ThumbTintColor { }
extension MySwitchAppearance {
    
    var pOnTintColor : UIColor { return UIColor.blueColor() }
    var pThumbTintColor : UIColor { return Colors.MainColor }
}

@IBDesignable
class MySwitch : UISwitch, MySwitchAppearance { }
@IBDesignable
class MyStepper : UIStepper, RedTintColor { }


protocol GreenCurrentPageTintColor : CurrentPageTintColor { }
extension GreenCurrentPageTintColor {
    
    var pCurrentPageTintColor : UIColor { return UIColor.greenColor() }
}

@IBDesignable
class MyPageControl : UIPageControl, RedTintColor, GreenCurrentPageTintColor { }


