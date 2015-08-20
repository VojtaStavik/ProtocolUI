//
//  ProgressTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ProgressTintColor {
    
    var pProgressTintColor : UIColor { return ProgressTintColorProtocolTest.testValue }
}


class ProgressTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ProgressTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.66, green: 0.77, blue: 0.88, alpha: 0.99)
    
    func testUIProgressView() {
        
        class TestView : UIProgressView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.progressTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.progressTintColor, self.dynamicType.testValue)
    }
}