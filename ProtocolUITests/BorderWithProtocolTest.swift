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
    
    func performTestWithClass(classType : UIView.Type, shouldTestIBDesignable: Bool = false) {
        
        let testView = classType.init()
        
        if shouldTestIBDesignable {
            
            testView.prepareForInterfaceBuilder()
            
        } else {
            
            testView.applyProtocolUIAppearance()
        }
        
        XCTAssert(testView is CurrentTestProtocol)
        XCTAssert(testView.layer.borderWidth == self.dynamicType.testValue)
    }
    
    // DO NOT EDIT HERE
    // The following code is copied to every test case file from the SharedTestCode.swift file
    // If needed, do your changes there
        
    
    
    
    
    
    
    
    
    
    
                                                                                                                                                                                                                                                                                                                                                                                    //~~~**~~~

    func testUIButton() {
        class TestView : UIButton, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUIControl() {
        class TestView : UIControl, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUILabel() {
        class TestView : UILabel, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUINavigationBar() {
        class TestView : UINavigationBar, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUIPageControl() {
        class TestView : UIPageControl, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUIProgressView() {
        class TestView : UIProgressView, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUISearchBar() {
        class TestView : UISearchBar, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUISegmentedControl() {
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUISlider() {
        class TestView : UISlider, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUISwitch() {
        class TestView : UISwitch, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUITabBar() {
        class TestView : UITabBar, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUITextField() {
        class TestView : UITextField, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUITextView() {
        class TestView : UITextView, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUIToolbar() {
        class TestView : UIToolbar, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    func testUIView() {
        class TestView : UIView, CurrentTestProtocol { }
        performTestWithClass(TestView)
        performTestWithClass(TestView.self, shouldTestIBDesignable: true)
    }

    //~~~**~~~
}
