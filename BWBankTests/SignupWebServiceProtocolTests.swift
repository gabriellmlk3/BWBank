//
//  SignupWebServiceProtocolTests.swift
//  MyProjectTests
//
//  Created by Gabriel Olbrisch on 04/06/22.
//

import XCTest
@testable import MyProject

class SignupWebServiceProtocolTests: XCTestCase {
    var sut: SignupWebServiceProtocol?

    override func setUpWithError() throws {
        sut = SignupWebServiceMock()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testSignupWebService_WhenValidFormIsProvided_ShouldReturnUser() {
        //Arrange
        let formModel = SignupFormModel(name: "Peter",
                                        lastName: "Parker",
                                        email: "peterparker@gmail.com",
                                        password: "12345678",
                                        repeatedPassword: "12345678")
        
        //Act & Assert
        sut?.signup(with: formModel, completionHandler: { result in
            switch result {
            case .success(let user):
                XCTAssertNotNil(user, "The provided form to signup() should have return NOT NIL 'User' for success case, but NIL was returned.")
            case.failure(let error):
                XCTAssertNotNil(error, "The provided form to signup() should have return NOT NIL 'Error' for failure case, but NIL was returned.")
            }
        })
    }

}
