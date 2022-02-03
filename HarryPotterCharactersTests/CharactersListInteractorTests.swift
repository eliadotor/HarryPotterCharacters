//
//  CharactersListInteractorTests.swift
//  HarryPotterCharactersTests
//
//  Created by Elia Dotor Puente on 3/2/22.
//

import XCTest
@testable import HarryPotterCharacters

class CharactersListInteractorTests: XCTestCase {
        
    class MockCharactersProvider: CharacterProviderContract {
        
        let characters: [Character] = [.init(name: "Harry", alternate_names: [], species: "human", house: "Gryffindor", dateOfBirth: "22-03-1991", wizard: true, ancestry: "", patronus: "Deer", hogwartsStudent: true, hogwartsStaff: false, actor: "Daniel Radcliffe", image: ""),
                                       .init(name: "Hermione", alternate_names: [], species: "human", house: "Gryffindor", dateOfBirth: "02-04-1991", wizard: true, ancestry: "", patronus: "Otter", hogwartsStudent: true, hogwartsStaff: false, actor: "Emma Watson", image: "")]
        
        var shouldFail = false
        
        func getCharacters(_ completion: @escaping (Result<[Character], CharacterProviderError>) -> ()) {
            if shouldFail {
                completion(.failure(.badUrl))
            } else{
                completion(.success(characters))
            }
        }
        
    }
    
    class MockListInteractorOutput: ListInteractorOutputContract {
        let expectation: XCTestExpectation
        
        init(expectation: XCTestExpectation) {
            self.expectation = expectation
        }
        
        var characters = [Character]()
        var didFail = false
        
        func didFetch(characters: [Character]) {
            self.characters = characters
            expectation.fulfill()
        }
        
        func fetchDidFail() {
            didFail = true
            expectation.fulfill()
        }

    }
    
    let provider = MockCharactersProvider()
    let sut = CharactersListInteractor()

    func testShouldFetchCharacters() {
        let expectation = expectation(description: "")
        let output = MockListInteractorOutput(expectation: expectation)
        
        sut.charactersProvider = provider
        sut.output = output
        sut.fetchItems()
        
        waitForExpectations(timeout: 0.5) { [self] _ in
            XCTAssertEqual(output.characters, self.provider.characters)
        }
    
    }
    
    func testShouldNotify() {
        let expectation = expectation(description: "")
        provider.shouldFail = true
        let output = MockListInteractorOutput(expectation: expectation)
        
        sut.charactersProvider = provider
        sut.output = output
        sut.fetchItems()
        
        waitForExpectations(timeout: 0.5) { _ in
            XCTAssertTrue(output.didFail)
        }
    }


}
