//
//  CollectionViewController.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import UIKit

class CollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: ListPresenterContract?
    var interactor: ListInteractorContract?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter?.viewDidLoad()
    }
   
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20 // Espacio vertical entre celdas
        layout.minimumLineSpacing = 20 // Espacio horizontal entre celdas
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
        let width = (collectionView.frame.width / 2) - (layout.minimumInteritemSpacing/2) - layout.sectionInset.left
        layout.itemSize = CGSize(width: width, height: width)
        return layout
    }
}


extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numItems ?? 0
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = presenter?.cellCollectionViewModel(at: indexPath), let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else {
            fatalError()
        }
        cell.configure(with: viewModel)
        return cell
    }
}


extension CollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectItem(at: indexPath)
    }
}



