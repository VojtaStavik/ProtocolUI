//
//  ContentHorizontalAlignmentProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ContentHorizontalAlignment {
    
    var pContentHorizontalAlignment : UIControlContentHorizontalAlignment { return ContentHorizontalAlignmentProtocolTest.testValue }
}


class ContentHorizontalAlignmentProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ContentHorizontalAlignment
    typealias CurrentTestValueType          = UIControlContentHorizontalAlignment
    static let testValue : CurrentTestValueType    = .Fill
    
    func testUIControl() {
        
        class TestView : UIControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.contentHorizontalAlignment, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.contentHorizontalAlignment, self.dynamicType.testValue)
    }
}