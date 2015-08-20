//
//  MinimumTrackTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension MinimumTrackTintColor {
    
    var pMinimumTrackTintColor : UIColor { return MinimumTrackTintColorProtocolTest.testValue }
}


class MinimumTrackTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = MinimumTrackTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.33, green: 0.44, blue: 0.55, alpha: 0.66)
    
    func testUISlider() {
        
        class TestView : UISlider, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.minimumTrackTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.minimumTrackTintColor, self.dynamicType.testValue)
    }
}