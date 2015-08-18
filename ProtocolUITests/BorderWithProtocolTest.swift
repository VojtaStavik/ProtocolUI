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

class BorderWidthProtocolTest: XCTestCase {

    typealias CurrentTestProtocol           = BorderWidth
    typealias CurrentTestValueType          = CGFloat
    static let testValue : CurrentTestValueType    = 10
    
    func performTestWithClass(classType : UIView.Type) {
        
        let testView = classType.init()
        testView.applyProtocolUIAppearance()
        
        XCTAssert(testView is CurrentTestProtocol)
        XCTAssert(testView.layer.borderWidth == self.dynamicType.testValue)
    }
    
    // DO NOT EDIT HERE
    // The following code is copied to every test case file from the SharedTestCode.swift file
    // If needed, do your changes there
    
    
    
    
    
    //~~~**~~~

    //func testUIBarButtonItem() {
    //    class TestView : UIBarButtonItem, CurrentTestProtocol { }
    //    performTestWithClass(TestView)
    //}
    //
    //func testUIBarItem() {
    //    class TestView : UIBarItem, CurrentTestProtocol { }
    //    performTestWithClass(TestView)
    //}

    func testUIButton() {
        class TestView : UIButton, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUIControl() {
        class TestView : UIControl, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUILabel() {
        class TestView : UILabel, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUINavigationBar() {
        class TestView : UINavigationBar, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUIPageControl() {
        class TestView : UIPageControl, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUIProgressView() {
        class TestView : UIProgressView, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUISerchBar() {
        class TestView : UISearchBar, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUISegmentedControl() {
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUISlider() {
        class TestView : UISlider, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUISwitch() {
        class TestView : UISwitch, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUITabBar() {
        class TestView : UITabBar, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    //func testUITabBarItem() {
    //    class TestView : UITabBarItem, CurrentTestProtocol { }
    //    performTestWithClass(TestView)
    //}

    func testUITextField() {
        class TestView : UITextField, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUITextView() {
        class TestView : UITextView, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUIToolbar() {
        class TestView : UIToolbar, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    func testUIView() {
        class TestView : UIView, CurrentTestProtocol { }
        performTestWithClass(TestView)
    }

    //~~~**~~~
}
