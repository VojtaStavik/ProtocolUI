//
//  BorderWithProtocolTest.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 18/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension BorderWidth {
    
    var pBorderWidth : CGFloat { return BorderWidthProtocolTest.testValue }
}

class BorderWidthProtocolTest: UIViewBasedTestSet {

    typealias CurrentTestProtocol           = BorderWidth
    typealias CurrentTestValueType          = CGFloat
    static let testValue : CurrentTestValueType    = 10
    
    func performTestWithClass(classType : UIView.Type) {
        
        let testView = classType.init()
        testView.applyProtocolUIAppearance()
        
        XCTAssert(testView is CurrentTestProtocol)
        XCTAssert(testView.layer.borderWidth == self.dynamicType.testValue)
    }
}
