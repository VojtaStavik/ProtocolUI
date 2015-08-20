//
//  AdjustFontSizeToFitWidthTRUEProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI


class AdjustFontSizeToFitWidthTRUEProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = AdjustFontSizeToFitWidthTRUE
    typealias CurrentTestValueType          = Bool
    static let testValue : CurrentTestValueType    = true
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.adjustsFontSizeToFitWidth, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.adjustsFontSizeToFitWidth, self.dynamicType.testValue)
    }
}