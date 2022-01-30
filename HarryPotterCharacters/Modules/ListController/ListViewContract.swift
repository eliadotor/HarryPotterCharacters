//
//  ListContract.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 28/1/22.
//

import Foundation
import UIKit

protocol ListViewContract: UIViewController {
    var presenter: ListPresenterContract? {set get}
    func reloadData()
}

protocol ListPresenterContract: AnyObject {
    var viewList: ListViewController? {set get}
    var viewCollection: CollectionViewController? {set get}
    var interactor: ListInteractorContract? {set get}
    var numItems: Int {get}
    
    func viewDidLoad()
    func cellViewModel(at indexPath: IndexPath) -> ListTableCellViewModel
    func cellCollectionViewModel(at indexPath: IndexPath) -> CollectionCellViewModel
    func didSelectItem(at indexPath: IndexPath)

}

protocol ListInteractorContract {
    var charactersProvider: CharacterProviderContract? {get set}
    var output: ListInteractorOutputContract? {get set}
    func fetchItems()
}

protocol ListInteractorOutputContract: AnyObject {
    func didFetch(characters: [Character])
    func fetchDidFail()

}

protocol CharacterProviderContract {
    func getCharacters(_ completion: @escaping (Result<[Character], CharacterProviderError>) -> ())
}

protocol CharactersListWireframeContract {
    var view: UIViewController? {get set}
    func navigate(to character: Character)
}
