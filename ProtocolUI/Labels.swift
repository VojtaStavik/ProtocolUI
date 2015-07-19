//
//  Labels.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 15/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit

class DefaulLabel : UILabel, YellowBackground, TestClosureProtocol { }
class YellowLabel : UILabel, MainLabel { }

class YellowLabelWithGreenText: UILabel,
                                BlackBackground,
                                GreenTextColor,
                                RoundedCorners
                                { }
