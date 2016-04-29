//
//  ContentVerticalAlignmentProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ContentVerticalAlignment {
    
    var pContentVerticalAlignment : UIControlContentVerticalAlignment { return ContentVerticalAlignmentProtocolTest.testValue }
}


class ContentVerticalAlignmentProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ContentVerticalAlignment
    typealias CurrentTestValueType          = UIControlContentVerticalAlignment
    static let testValue : CurrentTestValueType    = .Fill
    
    func testUIControl() {
        
        class TestView : UIControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.contentVerticalAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.contentVerticalAlignment, self.dynamicType.testValue)
    }
}