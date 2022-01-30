//
//  CharactersPresenter.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation


class CharactersListPresenter: ListPresenterContract {
    
    
    weak var viewList: ListViewController?
    weak var viewCollection: CollectionViewController?
    var interactor: ListInteractorContract?
    var wireframe: CharactersListWireframeContract?

    private var characters = [Character]() {
        didSet {
            viewList?.reloadData()
            viewCollection?.reloadData()
        }
    }

    var numItems: Int {
        return characters.count
    }
    
    func viewDidLoad() {
        interactor?.output = self
        fetchData()
    }
    
    func cellViewModel(at indexPath: IndexPath) -> ListTableCellViewModel {
        let item = characters[indexPath.row]
        return item.toListCellViewModel
    }
    
    func cellCollectionViewModel(at indexPath: IndexPath) -> CollectionCellViewModel {
        let item = characters[indexPath.row]
        return item.toCollectionCellViewModel
    }
    
    func didSelectItem(at indexPath: IndexPath) {
        let character = characters[indexPath.row]
        wireframe?.navigate(to: character)

    }
    
    private func fetchData(){
        interactor?.fetchItems()
    }
    
}


extension CharactersListPresenter: ListInteractorOutputContract {
    func didFetch(characters: [Character]) {
        self.characters = characters
    }
    
    func fetchDidFail() {
        print("Error")
    }

}
