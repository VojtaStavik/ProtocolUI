//
//  Appearance.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 15/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit

// MARK: - Base protocols (do not edit)

protocol BackgroundColor    { var pBackgroundColor: UIColor?    { get } }
protocol TextColor          { var pTextColor: UIColor?          { get } }
protocol CornerRadius       { var pCornerRadius: CGFloat        { get } }

//


// MARK: - Your custom protocols
// (alway inherit from one of the base protocols)

// MARK: Background color

protocol YellowBackground : BackgroundColor { }
extension YellowBackground {  var pBackgroundColor : UIColor? { return UIColor.yellowColor() } }

protocol BlackBackground : BackgroundColor { }
extension BlackBackground {  var pBackgroundColor : UIColor? { return UIColor.blackColor() } }



// MARK: Text Color

protocol GreenTextColor : TextColor { }
extension GreenTextColor { var pTextColor : UIColor? { return UIColor.greenColor() } }


// MARK: Corner Radius

protocol RoundedCorners : CornerRadius { }
extension RoundedCorners {  var pCornerRadius : CGFloat { return 5 } }


// MARK: Compound protocols

protocol MainLabel : GreenTextColor, YellowBackground, RoundedCorners { }

