//
//  DetailInteractor.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 1/2/22.
//

import Foundation


class DetailInteractor: DetailInteractorContract {
    
    private let viewModel: DetailViewModel
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
    }
    
    func fetch(_ completion: @escaping (Result<DetailViewModel, Error>) -> ()) {
        completion(.success(viewModel as DetailViewModel))
    }
    
}
