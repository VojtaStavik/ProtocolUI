
//
//  BorderStyleProtocolTest.swift
//  ProtocolUI
//
//  Created by Jozef Matus on 06/10/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension BorderStyle {
    
    var pBorderStyle : UITextBorderStyle { return BorderStyleProtocolTest.testValue }
}


class BorderStyleProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = BorderStyle
    typealias CurrentTestValueType          = UITextBorderStyle
    static let testValue : CurrentTestValueType    = UITextBorderStyle.None
    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.borderStyle, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.borderStyle, self.dynamicType.testValue)
    }
}