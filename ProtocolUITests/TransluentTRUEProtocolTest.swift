//
//  TransluentTRUEProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

class TransluentTRUEProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TransluentTRUE
    typealias CurrentTestValueType          = Bool
    static let testValue : CurrentTestValueType    = true
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.translucent, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.translucent, self.dynamicType.testValue)
    }
    
    
    func testUIToolbar() {
        
        class TestView : UIToolbar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.translucent, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.translucent, self.dynamicType.testValue)
    }
    
    
    func testUITabBar() {
        
        class TestView : UITabBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.translucent, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.translucent, self.dynamicType.testValue)
    }
}
