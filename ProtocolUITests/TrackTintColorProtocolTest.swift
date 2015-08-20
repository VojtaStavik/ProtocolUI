//
//  TrackTintColorProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension TrackTintColor {
    
    var pTrackTintColor : UIColor { return TrackTintColorProtocolTest.testValue }
}


class TrackTintColorProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TrackTintColor
    typealias CurrentTestValueType          = UIColor
    static let testValue : CurrentTestValueType    = UIColor(red: 0.01, green: 0.99, blue: 0.02, alpha: 0.98)
    
    func testUIProgressView() {
        
        class TestView : UIProgressView, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.trackTintColor, self.dynamicType.testValue)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.trackTintColor, self.dynamicType.testValue)
    }
}