//
//  TitleShadowColorForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension TitleShadowColorForState {
    
    var pTitleShadowColorForState : [(UIControlState, UIColor)] { return TitleShadowColorForStateProtocolTest.testValue }
}


class TitleShadowColorForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TitleShadowColorForState
    typealias CurrentTestValueType          = [(UIControlState, UIColor)]

    static let color1 = UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 0.4)
    static let color2 = UIColor(red: 0.2, green: 0.3, blue: 0.4, alpha: 0.5)
    
    static let testValue : CurrentTestValueType    = [
    
        (UIControlState.Normal, TitleShadowColorForStateProtocolTest.color1), (UIControlState.Highlighted, TitleShadowColorForStateProtocolTest.color2)
    ]
    
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.titleShadowColorForState(.Normal), self.dynamicType.color1)
        XCTAssertEqual(test1.titleShadowColorForState(.Highlighted), self.dynamicType.color2)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.titleShadowColorForState(.Normal), self.dynamicType.color1)
        XCTAssertEqual(test2.titleShadowColorForState(.Highlighted), self.dynamicType.color2)
    }
}