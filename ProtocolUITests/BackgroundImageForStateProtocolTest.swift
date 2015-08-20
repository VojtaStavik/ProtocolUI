//
//  BackgroundImageForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension BackgroundImageForState {
    
    var pBackgroundImageForState : [(UIControlState, UIImage)] { return BackgroundImageForStateProtocolTest.testValue }
}


class BackgroundImageForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = BackgroundImageForState
    typealias CurrentTestValueType          = [(UIControlState, UIImage)]

    static let image1 = UIImage(named: "bob", inBundle: NSBundle(forClass: ImageForStateProtocolTest.self), compatibleWithTraitCollection: nil)!
    static let image2 = UIImage(named: "kevin", inBundle: NSBundle(forClass: ImageForStateProtocolTest.self), compatibleWithTraitCollection: nil)!
    
    static let testValue : CurrentTestValueType    = [
    
        (UIControlState.Normal, ImageForStateProtocolTest.image1), (UIControlState.Highlighted, ImageForStateProtocolTest.image2)
    ]
    
    
    func testUIButton() {
        
        class TestView : UIButton, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertEqual(test1.backgroundImageForState(.Normal), self.dynamicType.image1)
        XCTAssertEqual(test1.backgroundImageForState(.Highlighted), self.dynamicType.image2)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.backgroundImageForState(.Normal), self.dynamicType.image1)
        XCTAssertEqual(test2.backgroundImageForState(.Highlighted), self.dynamicType.image2)
    }
}