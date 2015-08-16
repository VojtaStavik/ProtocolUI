//
//  Temp.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 28/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit

// examples for blog post http://vojtastavik.com/2015/07/29/protocolui-customizing-uikit-using-protocols/


protocol GreenBackgroundColor : BackgroundColor  { }
extension GreenBackgroundColor { var pBackgroundColor : UIColor { return UIColor.greenColor() } }


class MyView : UIView, GreenBackgroundColor { }
class MyButton : UIButton, GreenBackgroundColor { }
class MyTextField : UITextField, GreenBackgroundColor { }


protocol YellowBackgroundColor : BackgroundColor  { }
extension YellowBackgroundColor { var pBackgroundColor : UIColor { return UIColor.yellowColor() } }

protocol BlueBackgroundColor : BackgroundColor  { }
extension BlueBackgroundColor { var pBackgroundColor : UIColor { return UIColor.blueColor() } }


protocol ButtonFont : Font { }
extension ButtonFont { var pFont : UIFont { return UIFont(name: "Helvetica Neue", size: 15.0)! } }

protocol ButtonAppearance : YellowBackgroundColor, ButtonFont { }


protocol GreenBorder : BorderColor { }
extension GreenBorder { var pBorderColor : UIColor { return UIColor.greenColor() } }

protocol DefaultBorderWidth : BorderWidth { }
extension DefaultBorderWidth { var pBorderWidth : CGFloat { return 2.0 } }

protocol CallToActionAppearance : GreenBorder, DefaultBorderWidth { }


protocol WhiteTextColor : TextColor { }
extension WhiteTextColor { var pTextColor : UIColor { return UIColor.whiteColor() } }


class RegularButton : UIButton, ButtonAppearance { }
class CallToActionButton : UIButton, ButtonAppearance, CallToActionAppearance { }

class CallToActionTextField : UITextField, WhiteTextColor, BlueBackgroundColor, CallToActionAppearance { }


protocol SmartButtonApperance : CustomClosure { }
extension SmartButtonApperance { var pCustomClosure : ProtocolUICustomClosure {
    
        return { () -> Void in
        
            if let aSelf = self as? UIButton {
                
                aSelf.setTitleColor(UIColor.blackColor(), forState: .Normal)
                aSelf.setTitleColor(UIColor.redColor(), forState: .Highlighted)
            }
        }
    }
}


class MySmartButton : UIButton, ButtonAppearance, SmartButtonApperance { }
