//
//  LineBreakModeProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension LineBreakMode {
    
    var pLineBreakMode : NSLineBreakMode { return LineBreakModeProtocolTest.testValue }
}


class LineBreakModeProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = LineBreakMode
    typealias CurrentTestValueType          = NSLineBreakMode
    static let testValue : CurrentTestValueType    = .ByTruncatingMiddle
    
    func testUILabel() {
        
        class TestView : UILabel, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.lineBreakMode, self.dynamicType.testValue)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.lineBreakMode, self.dynamicType.testValue)
    }
}