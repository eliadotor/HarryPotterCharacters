////
////  UserFormProviderTests.swift
////  HarryPotterCharactersTests
////
////  Created by Elia Dotor Puente on 3/2/22.
////
//
//import XCTest
//@testable import HarryPotterCharacters
//
//class UserFormProviderTests: XCTestCase {
//
//    class MockUserDefaultsProvider: UserFormProviderContract {
//        
//        let user: UserFormModel = .init(name: "Elia", phone: "608358266", mail: "elia@gmail.com", data: "")
//        
//        var shouldFail = false
//
//        func saveUser(_ user: UserFormModel) {
//            
//        }
//        
//        func loadUser(_ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ()) {
//            if shouldFail {
//                completion(.failure(.loadError))
//            } else {
//                completion(.success(user))
//            }
//        }
//        
//        
//    }
//    
//    class MockUserFormInteractorOutput: UserFormInteractorContract {
//        
//        let expectation: XCTestExpectation
//        
//        init(expectation: XCTestExpectation) {
//            self.expectation = expectation
//        }
//        
//        var user = UserFormModel()
//        var didFail = false
//        
//        
//        func saveUser(_ user: UserFormModel) {
//            
//        }
//        
//        func fetchUser() {
//            self.user = user
//            expectation.fulfill()
//        }
//
//    }
//    
//    let provider = MockCharactersProvider()
//    let sut = CharactersListInteractor()
//
//    func testShouldFetchCharacters() {
//        let expectation = expectation(description: "")
//        let output = MockListInteractorOutput(expectation: expectation)
//        
//        sut.charactersProvider = provider
//        sut.output = output
//        sut.fetchItems()
//        
//        waitForExpectations(timeout: 0.5) { [self] _ in
//            XCTAssertEqual(output.characters, self.provider.characters)
//        }
//    
//    }
//    
//    func testShouldNotify() {
//        let expectation = expectation(description: "")
//        provider.shouldFail = true
//        let output = MockListInteractorOutput(expectation: expectation)
//        
//        sut.charactersProvider = provider
//        sut.output = output
//        sut.fetchItems()
//        
//        waitForExpectations(timeout: 0.5) { _ in
//            XCTAssertTrue(output.didFail)
//        }
//    }
//
//}
//
//
//
//        
//
//
//
//
