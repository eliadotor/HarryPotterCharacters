//
//  DetailPresenter.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import Foundation


class DetailPresenter: DetailPresenterContract {

    private let interactor: DetailInteractor?
    
    init(interactor: DetailInteractor) {
        self.interactor = interactor
    }
    
    weak var view: DetailViewController? {
        didSet {
            fetchItem()
        }
    }
    
    private var item: DetailViewModel? {
        didSet {
            guard let item = item else {return}
            view?.configure(with: item)
        }
    }
    
    func viewDidLoad() {
        fetchItem()
    }
    
    func fetchItem() {
        interactor?.fetch { [weak self] (result) in
            switch result {
            case .success(let item): self?.item = item
            case .failure(_): break
            }
        }
    }
    
}
