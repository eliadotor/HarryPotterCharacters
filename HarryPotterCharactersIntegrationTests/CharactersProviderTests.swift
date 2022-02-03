//
//  CharactersProviderTests.swift
//  HarryPotterCharactersIntegrationTests
//
//  Created by Elia Dotor Puente on 3/2/22.
//

import XCTest
@testable import HarryPotterCharacters


class CharactersProviderTests: XCTestCase {

    let sut = NetworkCharactersProvider()
    
    func testShouldFetchCharacters() {
        let expectation = expectation(description: "")
        
        sut.getCharacters { result in
            switch result {
            case .success(let characters) :
                XCTAssertFalse(characters.isEmpty)
            case .failure(let error): XCTFail(error.localizedDescription)
            }
            expectation.fulfill()
            
        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}

