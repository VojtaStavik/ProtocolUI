//
//  Labels.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 15/07/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import UIKit

class DefaulLabel : UILabel, BlueBackground, TestClosureProtocol { }
class YellowLabel : UILabel, SharedAppearance { }

class YellowLabelWithGreenText: UILabel,
                                BlackBackground,
                                GreenTextColor,
                                RoundedCorners
                                { }
// test
class TestTextView : UITextView, SharedAppearance { }
class TestTextField : UITextField, SharedAppearance { }


class TestButton: UIButton, SharedAppearance { }
