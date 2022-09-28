//
//  MyProjectTests.swift
//  MyProjectTests
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import XCTest
@testable import MyProject

class FormValidatorTests: XCTestCase {
    
    func testFormValidator_WhenValidEmailIsProvided_shouldReturnTrue() {
        //Act
        let testResult = FormValidator.validateEmail("exemple@exemple.com")
        
        //Assert
        XCTAssertTrue(testResult, "The isValidEmail should have returned TRUE for a valid email, but FALSE was returned.")
    }
    
    func testFormValidator_WhenEmailWithoutArrobaIsProvided_shouldReturnFalse() {
        //Act
        let testResult = FormValidator.validateEmail("exempleexemple.com")
        
        //Assert
        XCTAssertFalse(testResult, "The isValidEmail should have returned FALSE for a invalid email, but TRUE was returned.")
    }
    
    func testFormValidator_WhenEmailWithoutDotIsProvided_shouldReturnFalse() {
        //Act
        let testResult = FormValidator.validateEmail("exemple@exemplecom")
        
        //Assert
        XCTAssertFalse(testResult, "The isValidEmail should have returned FALSE for a invalid email, but TRUE was returned.")
    }
    
    func testFormValidator_whenValidPasswordProvided_shouldReturnTrue() {
        //Act
        let testResult = FormValidator.validatePassword("12345678")
        
        //Assert
        XCTAssertTrue(testResult, "The validatePassword should have returned TRUE for a valid password, but FALSE was returned.")
    }
    
    func testFormValidator_whenShortPasswordProvided_shouldReturnFalse() {
        //Act
        let testResult = FormValidator.validatePassword("1234567")
        
        //Assert
        XCTAssertFalse(testResult, "The validatePassword should have returned FALSE for a short password, but TRUE was returned.")
    }
    
    func testFormValidator_WhenEqualPasswordProvided_shouldReturnTrue() {
        //Act
        let testResult = FormValidator.passwordsMatch(password: "12345678", repeatedPasswords: "12345678")
        
        //Assert
        XCTAssertTrue(testResult, "The passwordsMatch should have returned TRUE for matching passwords, but FALSE was returned.")
    }
    
    func testFormValidator_WhenDiferentPasswordProvided_shouldReturnFalse() {
        //Act
        let testResult = FormValidator.passwordsMatch(password: "1234513450", repeatedPasswords: "12345678")
        
        //Assert
        XCTAssertFalse(testResult, "The passwordsMatch should have returned FALSE for passwords that do not matching, but TRUE was returned.")
    }
    
    func testFormValidator_WhenValidNameProvided_shouldReturnTrue() {
        //Act
        let testResult = FormValidator.validateName("Jorge")
        
        //Assert
        XCTAssertTrue(testResult, "The validateName() should have returned TRUE for valid name, but FALSE was returned.")
    }
    
    func testFormValidator_WhenInalidNameProvided_shouldReturnFalse() {
        //Act
        let testResult = FormValidator.validateName("J")
        
        //Assert
        XCTAssertFalse(testResult, "The validateName() should have returned FALSE for invalid name, but TRUE was returned.")
    }

}
