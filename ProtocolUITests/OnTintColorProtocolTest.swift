//
//  OnTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension OnTintColor {
    
    var pOnTintColor : UIColor { return OnTintColorProtocolTest.testValue }
}


class OnTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = OnTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.1, green: 0.9, blue: 0.2, alpha: 0.8)
    
    func testUISwitch() {
        
        class TestView : UISwitch, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.onTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.onTintColor, self.dynamicType.testValue)
    }
}