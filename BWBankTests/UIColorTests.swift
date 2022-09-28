//
//  UIColorTests.swift
//  MyProjectTests
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import XCTest
@testable import MyProject

class UIColorTests: XCTestCase {

    func testUIColor_WhenValidHexProvided_ShouldReturnNotNil() {
        // Act
        let color = UIColor(hex: "#551c2ef")
        
        // Assert
        XCTAssertNotNil(color, "The valid UIColor(hexString: String) should have return NOT NIL, but NIL was returned.")
    }
    
    func testUIColor_WhenInvalidHexProvided_ShouldReturnNil() {
        // Act
        let color = UIColor(hex: "#551c242ef")
        
        // Assert
        XCTAssertNil(color, "The invalid UIColor(hexString: String) should have return NIL, but NOT NIL was returned.")
    }

}
