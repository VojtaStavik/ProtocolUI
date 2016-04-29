//
//  BarTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension BarTintColor {
    
    var pBarTintColor : UIColor { return BarTintColorProtocolTest.testValue }
}


class BarTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = BarTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.24, green: 0.25, blue: 0.26, alpha: 0.27)
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.barTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.barTintColor, self.dynamicType.testValue)
    }
    
    
    func testUIToolbar() {
        
        class TestView : UIToolbar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.barTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.barTintColor, self.dynamicType.testValue)
    }
    
    
    func testUITabBar() {
        
        class TestView : UITabBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.barTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.barTintColor, self.dynamicType.testValue)
    }
    

}
