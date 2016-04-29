//
//  TitleEdgeInsetsProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension TitleEdgeInstets {
    
    var pTitleEdgeInsets : UIEdgeInsets { return TitleEdgeInstesProtocolTest.testValue }
}


class TitleEdgeInstesProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TitleEdgeInstets
    typealias CurrentTestValueType          = UIEdgeInsets
    static let testValue : CurrentTestValueType    = UIEdgeInsets(top: 2.2, left: 3.3, bottom: 4.4, right: 5.5)
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleEdgeInsets, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleEdgeInsets, self.dynamicType.testValue)
    }
}