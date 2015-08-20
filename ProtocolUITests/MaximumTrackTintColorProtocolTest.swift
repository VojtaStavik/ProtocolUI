//
//  MaximumTrackTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension MaximumTrackTintColor {
    
    var pMaximumTrackTintColor : UIColor { return MaximumTrackTintColorProtocolTest.testValue }
}


class MaximumTrackTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = MaximumTrackTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.44, green: 0.45, blue: 0.46, alpha: 0.47)
    
    func testUISlider() {
        
        class TestView : UISlider, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.maximumTrackTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.maximumTrackTintColor, self.dynamicType.testValue)
    }
}