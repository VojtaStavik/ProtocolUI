//
//  TitleTextAttributesForStateProtocolTest.swift
//  ProtocolUI
//
//  Created by STRV on 20/08/15.
//  Copyright © 2015 Vojta Stavik. All rights reserved.
//

import XCTest
@testable import ProtocolUI

extension TitleTextAttributesForState {
    
    var pTitleTextAttributesForState : [(UIControlState, [String : AnyObject])] { return TitleTextAttributesForStateProtocolTest.testValue }
}


class TitleTextAttributesForStateProtocolTest: XCTestCase {
    
    typealias CurrentTestProtocol           = TitleTextAttributesForState
    typealias CurrentTestValueType          = [(UIControlState, [String : AnyObject])]
    
    static let attributes1 : [String : AnyObject] = [
    
        NSFontAttributeName : UIFont.boldSystemFontOfSize(19),
        NSForegroundColorAttributeName : UIColor.blueColor()
    ]

    static let attributes2 : [String : AnyObject] = [
        
        NSFontAttributeName : UIFont.boldSystemFontOfSize(21),
        NSForegroundColorAttributeName : UIColor.greenColor()
    ]

    
    static let testValue : CurrentTestValueType    = [
        
        (UIControlState.Normal, TitleTextAttributesForStateProtocolTest.attributes1),
        (UIControlState.Highlighted, TitleTextAttributesForStateProtocolTest.attributes2)
    ]
    
    
    func testUIBarButtonItem() {
        
        class TestView : UIBarButtonItem, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertNotNil(test1.titleTextAttributesForState(.Normal))
        let attr1 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Normal)!)
        let attr2 = NSDictionary(dictionary: self.dynamicType.attributes1)
        XCTAssertEqual(attr1, attr2)

        XCTAssertNotNil(test1.titleTextAttributesForState(.Highlighted))
        let attr11 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Highlighted)!)
        let attr22 = NSDictionary(dictionary: self.dynamicType.attributes2)
        XCTAssertEqual(attr11, attr22)


        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertNotNil(test2.titleTextAttributesForState(.Normal))
        let attr111 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Normal)!)
        let attr222 = NSDictionary(dictionary: self.dynamicType.attributes1)
        XCTAssertEqual(attr111, attr222)
        
        XCTAssertNotNil(test2.titleTextAttributesForState(.Highlighted))
        let attr1111 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Highlighted)!)
        let attr2222 = NSDictionary(dictionary: self.dynamicType.attributes2)
        XCTAssertEqual(attr1111, attr2222)
    }
    
    
    func testUISegmentedControl() {
        
        class TestView : UISegmentedControl, CurrentTestProtocol { }
        
        let test1 = TestView()
        test1.applyProtocolUIAppearance()
        
        XCTAssertNotNil(test1.titleTextAttributesForState(.Normal))
        let attr1 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Normal)!)
        let attr2 = NSDictionary(dictionary: self.dynamicType.attributes1)
        XCTAssertEqual(attr1, attr2)
        
        XCTAssertNotNil(test1.titleTextAttributesForState(.Highlighted))
        let attr11 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Highlighted)!)
        let attr22 = NSDictionary(dictionary: self.dynamicType.attributes2)
        XCTAssertEqual(attr11, attr22)
        
        
        let test2 = TestView()
        test2.prepareForInterfaceBuilder()
        
        XCTAssertNotNil(test2.titleTextAttributesForState(.Normal))
        let attr111 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Normal)!)
        let attr222 = NSDictionary(dictionary: self.dynamicType.attributes1)
        XCTAssertEqual(attr111, attr222)
        
        XCTAssertNotNil(test2.titleTextAttributesForState(.Highlighted))
        let attr1111 = NSDictionary(dictionary: test1.titleTextAttributesForState(.Highlighted)!)
        let attr2222 = NSDictionary(dictionary: self.dynamicType.attributes2)
        XCTAssertEqual(attr1111, attr2222)
    }

}