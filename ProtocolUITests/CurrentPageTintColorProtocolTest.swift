//
//  CurrentPageTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension CurrentPageTintColor {
    
    var pCurrentPageTintColor : UIColor { return CurrentPageTintColorProtocolTest.testValue }
}


class CurrentPageTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = CurrentPageTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.84, green: 0.85, blue: 0.86, alpha: 0.87)
    
    func testUIPageControl() {
        
        class TestView : UIPageControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.currentPageIndicatorTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.currentPageIndicatorTintColor, self.dynamicType.testValue)
    }
}