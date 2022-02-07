//
//  UserFormProviderTests.swift
//  HarryPotterCharactersTests
//
//  Created by Elia Dotor Puente on 3/2/22.
//

import XCTest
@testable import HarryPotterCharacters

class UserFormInteractorTests: XCTestCase {

    class MockUserDefaultsProvider: UserFormProviderContract {

        let user: UserFormModel = .init(name: "Elia", phone: "608358266", mail: "elia@gmail.com", data: "")

        var shouldFail = false

        func saveUser(_ user: UserFormModel, _ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ()) {
            if shouldFail {
                print("not")
                completion(.failure(.loadError))
            } else {
                completion(.success(user))
                print("yes")

            }
        }

        func loadUser(_ completion: @escaping (Result<UserFormModel?, UserFormProviderError>) -> ()) {
            if shouldFail {
                completion(.failure(.loadError))
                print("notL")
            } else {
                completion(.success(user))
                print("yesL")

            }
        }


    }

    class MockUserFormInteractorOutput: UserFormInteractorOutputContract {
        let expectation: XCTestExpectation

        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }

        var user = UserFormModel()
        var didFailFetch = false
        var didFailSave = false

        
        func didFetchUser(_ user: UserFormModel) {
            self.user = user
            expectation.fulfill()
        }
        
        func fetchDidFail() {
            didFailFetch = true
            expectation.fulfill()
        }
        func didSaveUser(_ user: UserFormModel) {
            self.user = user
            expectation.fulfill()
        }
        
        func saveDidFail() {
            didFailSave = true
            expectation.fulfill()
        }

    }

    let provider = MockUserDefaultsProvider()
    let sut = UserFormInteractor(provider: MockUserDefaultsProvider())

    func testShouldFetchUser() {
        let expectation = expectation(description: "")
        let output = MockUserFormInteractorOutput(expectation: expectation)

        sut.output = output
        sut.fetchUser()

        waitForExpectations(timeout: 0.5) { [self] _ in
            XCTAssertEqual(output.user, self.provider.user)
        }

    }

    func testShouldNotify() {
        let sut = UserFormInteractor(provider: provider)
        let expectation = expectation(description: "")
        provider.shouldFail = true
        let output = MockUserFormInteractorOutput(expectation: expectation)

        sut.output = output
        sut.fetchUser()

        waitForExpectations(timeout: 0.5) { _ in
            XCTAssertTrue(output.didFailFetch)
        }
    }
    
    func testShouldSaveUser() {
        let expectation = expectation(description: "")
        let output = MockUserFormInteractorOutput(expectation: expectation)
        sut.output = output
        sut.saveUser(self.provider.user)

        waitForExpectations(timeout: 0.5) { _ in
            XCTAssert(expectation.assertForOverFulfill)
        }

    }

    func testShouldNotifySave() {
        let sut = UserFormInteractor(provider: provider)
        let expectation = expectation(description: "")
        provider.shouldFail = true
        let output = MockUserFormInteractorOutput(expectation: expectation)
        sut.output = output
        sut.saveUser(self.provider.user)

        waitForExpectations(timeout: 0.5) { _ in
            XCTAssertTrue(output.didFailSave)
        }
    }

}

