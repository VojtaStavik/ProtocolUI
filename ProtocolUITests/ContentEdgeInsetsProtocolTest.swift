//
//  ContentEdgeInsetsProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ContentEdgeInsets {
    
    var pContentEdgeInsets : UIEdgeInsets { return ContentEdgeInsetsProtocolTest.testValue }
}


class ContentEdgeInsetsProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ContentEdgeInsets
    typealias CurrentTestValueType          = UIEdgeInsets
    static let testValue : CurrentTestValueType    = UIEdgeInsets(top: 12.2, left: 13.3, bottom: 14.4, right: 15.5)
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.contentEdgeInsets, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.contentEdgeInsets, self.dynamicType.testValue)
    }
}