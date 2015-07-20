//
//  Appearance.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 15/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit


// MARK: - Your custom protocols
// (always inherit from one of the base protocols)

// MARK: Background color

protocol BlueBackground : BackgroundColor { }
extension BlueBackground {  var pBackgroundColor : UIColor { return UIColor.blueColor() } }

protocol BlackBackground : BackgroundColor { }
extension BlackBackground {  var pBackgroundColor : UIColor { return UIColor.blackColor() } }

protocol SmallFont : Font { }
extension SmallFont { var pFont : UIFont { return UIFont(name: "Papyrus", size: 13)! } }


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
            
                if self is UIView {
                    
                    print("I'm an UIView with ProtocolUICustomClosure!")
                }
            }
    }
}


// MARK: Compound protocols
protocol SharedAppearance : GreenTextColor, BlueBackground, RoundedCorners, SmallFont { }

