//
//  TextAlignmentProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension TextAlignment {
    
    var pTextAlignment : NSTextAlignment { return TextAlignmentProtocolTest.testValue }
}

class TextAlignmentProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TextAlignment
    typealias CurrentTestValueType          = NSTextAlignment
    static let testValue : CurrentTestValueType    = NSTextAlignment.Right
    
    
    let textAligmnmentFromTextAttributes : [NSObject : AnyObject]? -> NSTextAlignment? = { attributes in
        
        guard let attributes = attributes else {
            return nil
        }
    
        return (attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle)?.alignment
    }
    
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()

        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributesForState(.Normal))
            , self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributesForState(.Normal))
            , self.dynamicType.testValue)
    }
    
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleLabel?.textAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleLabel?.textAlignment, self.dynamicType.testValue)
    }
    
    
    func testUITextView() {
        
        class TestView : UITextView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textAlignment, self.dynamicType.testValue)
    }
    
    
    func testUITextField() {
        
        class TestView : UITextField, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textAlignment, self.dynamicType.testValue)
    }
    
    
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.textAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.textAlignment, self.dynamicType.testValue)
    }
    
    
    
    func testUINavigationBar() {
        
        class TestView : UINavigationBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributes), self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributes), self.dynamicType.testValue)
    }
    
    
    func testUIBarItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributesForState(.Normal)), self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributesForState(.Normal)), self.dynamicType.testValue)
    }
    
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test1.titleTextAttributesForState(.Normal)), self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(textAligmnmentFromTextAttributes(test2.titleTextAttributesForState(.Normal)), self.dynamicType.testValue)
    }
    
    
    func testUISearchBar() {
        
        class TestView : UISearchBar, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual((test1.valueForKey("searchField") as? UITextField)?.textAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual((test2.valueForKey("searchField") as? UITextField)?.textAlignment, self.dynamicType.testValue)
    }
}