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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        presenter?.viewCollection = self
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
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 20, right: 10)
        if UIDevice.current.orientation.isLandscape {
            let width = (collectionView.frame.width / 4) - (layout.minimumInteritemSpacing/4) - layout.sectionInset.left
            layout.itemSize = CGSize(width: width, height: width)
        } else {
            let width = (collectionView.frame.width / 3) - (layout.minimumInteritemSpacing/3) - layout.sectionInset.left
            layout.itemSize = CGSize(width: width, height: width*2-(width/4))
        }
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



