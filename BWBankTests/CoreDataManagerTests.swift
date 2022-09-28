//
//  CoreDataManagerTests.swift
//  MyProjectTests
//
//  Created by Gabriel Olbrisch on 28/05/22.
//

import XCTest
@testable import MyProject

class CoreDataManagerTests: XCTestCase {

    var sut: CoreDataManager!
    
    override func setUpWithError() throws {
        sut = CoreDataManager()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testCoreDataManager_WhenContextHasCreated_ShouldReturnNotNil() {
        //Act
        let result = sut.context
        
        //Assert
        XCTAssertNotNil(result, "The contex provided should have return NOT NIL, but NIL was returned.")
    }
    
    func testCoreDataManager_WhenValidFormProvided_ShouldSaveUserAccountAndReturnUser() {
        //Arrange
        let form = SignupFormModel(name: "Peter",
                                   lastName: "Parker",
                                   email: "exemple@exemple.com",
                                   password: "12345678",
                                   repeatedPassword: "12345678")
        
        //Act & Assert
        sut.saveCurrentUser(form: form) { result in
            switch result {
            case .success(let user):
                XCTAssertNotNil(user, "The form provided to saveCurrentUSer() should have return NOT NIL 'User', but NIL was returned")
            case .failure(let error):
                if error == .alreadyExistAccount {
                    XCTAssert(true, error.errorMessage)
                } else {
                    XCTAssert(false, error.errorMessage)
                }
            }
                
        }
    }
    
    func testCoreDataManager_WhenValidEmailAndPasswordProvidedButContextIsNil_ShouldReturnFalse() {
        //Arrange
        sut.context = nil
        let form = SignupFormModel(name: "Peter",
                                   lastName: "Parker",
                                   email: "exemple@exemple.com",
                                   password: "12345678",
                                   repeatedPassword: "12345678")
        
        //Act & Assert
        sut.saveCurrentUser(form: form) { result in
            switch result {
            case .success(let user):
                XCTAssertNil(user, "The form and context provided to saveCurrentUSer() should have return NIL 'User', but NOT NIL was returned")
            case .failure(let error):
                XCTAssertNotNil(error, "The form and context provided to saveCurrentUSer() should have return NOT NIL 'Error', but NIL was returned")
            }
        }
    }

}
