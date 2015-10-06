//
//  TintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 19/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI


extension TintColor {
    
    var pTintColor : UIColor { return TintColorProtocolTest.testValue }
}

class TintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.33, green: 0.22, blue: 0.11, alpha: 0.1)
    
    func performTestWithClass(classType : UIView.Type, shouldTestIBDesignable: Bool = false) {
        
        let testView = classType.init()
        
        if shouldTestIBDesignable {
            
            testView.prepareForInterfaceBuilder()
            
        } else {
            
            testView.applyProtocolUIAppearance()
        }
        
        XCTAssert(testView is CurrentTestProtocol)
        
        if let pageControl = testView as? UIPageControl {
            
            XCTAssertEqual(pageControl.pageIndicatorTintColor, self.dynamicType.testValue)
            
        } else {
            
            XCTAssertEqual(testView.tintColor, self.dynamicType.testValue)
        }
    }
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.tintColor, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.tintColor, self.dynamicType.testValue)
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