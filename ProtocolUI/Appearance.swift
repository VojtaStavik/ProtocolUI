//
//  Appearance.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 15/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit


protocol YellowBackground : BackgroundColor { }

extension YellowBackground {
    
    var pBackgroundColor : UIColor? { return UIColor.yellowColor() }
}




protocol GreenTextColor : TextColor { }

extension GreenTextColor {
    
    var pTextColor : UIColor? { return UIColor.greenColor() }
}



