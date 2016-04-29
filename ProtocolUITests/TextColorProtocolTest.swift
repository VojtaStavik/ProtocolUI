//
//  TextColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 19/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension TextColor {
    
    var pTextColor : UIColor { return TextColorProtocolTest.testValue }
}

class TextColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TextColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor.yellowColor()
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributesForState(.Normal)?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)

    
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributesForState(.Normal)?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }


    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleColorForState(.Normal), self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleColorForState(.Normal), self.dynamicType.testValue)
    }
    
    
    func testUITextView() {
        
        class TestView : UITextView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textColor, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textColor, self.dynamicType.testValue)
    }

    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textColor, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textColor, self.dynamicType.testValue)
    }

    
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textColor, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textColor, self.dynamicType.testValue)
    }

    
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributes?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributes?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }

    
    func testUIBarItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()

        XCTAssertEqual(test1.titleTextAttributesForState(.Normal)?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributesForState(.Normal)?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }
    
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleTextAttributesForState(.Normal)?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleTextAttributesForState(.Normal)?[NSForegroundColorAttributeName] as? CurrentTestValueType, self.dynamicType.testValue)
    }


    func testUISearchBar() {
        
        class TestView : UISearchBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual((test1.valueForKey("searchField") as? UITextField)?.textColor, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual((test2.valueForKey("searchField") as? UITextField)?.textColor, self.dynamicType.testValue)
    }
}