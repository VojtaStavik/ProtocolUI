//
//  BorderColorProtocolTest.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 18/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension BorderColor {
    
    var pBorderColor : UIColor { return BorderColorProtocolTest.testValue }
}

class BorderColorProtocolTest: UIViewBasedTestSet {

    typealias CurrentTestProtocol           = BorderColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor.greenColor()
    
    func performTestWithClass(classType : UIView.Type) {
        
        let testView = classType.init()
        testView.applyProtocolUIAppearance()
        
        XCTAssertNotNil(testView.layer.borderColor)
        
        let color1 = UIColor(CGColor: testView.layer.borderColor!)
        let color2 = self.dynamicType.testValue
        
        XCTAssert(UIColor(CGColor: testView.layer.borderColor!).isEqual(self.dynamicType.testValue))
    }
}



