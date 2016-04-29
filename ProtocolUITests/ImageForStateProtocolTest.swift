//
//  ImageForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension ImageForState {
    
    var pImageForState : [(UIControlState, UIImage)] { return ImageForStateProtocolTest.testValue }
}


class ImageForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = ImageForState
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
        
        XCTAssertEqual(test1.imageForState(.Normal), self.dynamicType.image1)
        XCTAssertEqual(test1.imageForState(.Highlighted), self.dynamicType.image2)
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertEqual(test2.imageForState(.Normal), self.dynamicType.image1)
        XCTAssertEqual(test2.imageForState(.Highlighted), self.dynamicType.image2)
    }
}