//
//  TestClassesExtension.swift
//  ProtocolUI
//
//  Created by Vojta Stavik on 18/08/15.
//  Copyright © 2015 STRV. All rights reserved.
//

import Foundation
import XCTest

@testable import ProtocolUI

class UIViewBasedTestSet : XCTestCase, TTTT {

    typealias CurrentTestProtocol = EmptyProtocol
    
    class TestView : UIView, CurrentTestProtocol { }
    func testUIView() {
        
        performTestWithClass(TestView)
    }
    
    
    class TestNavigationBar : UINavigationBar, CurrentTestProtocol { }
    func testUINavigationBar() {
        
        performTestWithClass(TestNavigationBar)
    }
    
    
    class TestToolbar : UIToolbar, CurrentTestProtocol { }
    func testUIToolbar() {
        
        performTestWithClass(TestToolbar)
    }
}


protocol EmptyProtocol {    }

protocol TTTT { }

extension TTTT {

    func performTestWithClass(classType : UIView.Type) { }
}