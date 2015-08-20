//
//  ThumbTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ThumbTintColor {
    
    var pThumbTintColor : UIColor { return ThumbTintColorProtocolTest.testValue }
}


class ThumbTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ThumbTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.54, green: 0.55, blue: 0.56, alpha: 0.57)
    
    func testUISlider() {
        
        class TestView : UISlider, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.thumbTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.thumbTintColor, self.dynamicType.testValue)
    }

    
    func testUISwitch() {
        
        class TestView : UISwitch, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.thumbTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.thumbTintColor, self.dynamicType.testValue)
    }
}