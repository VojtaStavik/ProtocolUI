//
//  FontProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 19/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension Font {
    
    var pFont : UIFont { return FontProtocolTest.testValue }
}

class FontProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = Font
    typealias CurrentTestValueType          = UIFont
    static let testValue : CurrentTestValueType    = UIFont(name: "Helvetica Neue", size: 15.0)!
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributesForState(.Normal)?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)

    
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributesForState(.Normal)?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }


    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleLabel?.font, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleLabel?.font, self.dynamicType.testValue)
    }
    
    
    func testUITextView() {
        
        class TestView : UITextView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.font, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.font, self.dynamicType.testValue)
    }

    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.font, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.font, self.dynamicType.testValue)
    }

    
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.font, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.font, self.dynamicType.testValue)
    }

    
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }

    
    func testUIBarItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()

        XCTAssertEqual(test1.titleTextAttributesForState(.Normal)?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributesForState(.Normal)?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }
    
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributesForState(.Normal)?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributesForState(.Normal)?[NSFontAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }
    
    
    func testUISearchBar() {
        
        class TestView : UISearchBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual((test1.valueForKey("searchField") as? UITextField)?.font, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual((test2.valueForKey("searchField") as? UITextField)?.font, self.dynamicType.testValue)
    }
}