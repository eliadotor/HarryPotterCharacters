//
//  HousesCollectionViewController.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 30/1/22.
//

import UIKit

class HousesCollectionViewController: UIViewController {
    
    @IBOutlet weak var housesCollectionView: UICollectionView!
    
    private var houses = [String]()
    var presenter: HousesCollectionPresenterContract?
    var interactor: HousesCollectionInteractorContract?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        housesCollectionView.dataSource = self
        housesCollectionView.delegate = self
        presenter?.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        housesCollectionView.setCollectionViewLayout(layout, animated: false)

    }
        
    private var layout: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 20
        layout.minimumLineSpacing = 20
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 30, right: 20)
        let width = (housesCollectionView.frame.width / 2) - (layout.minimumInteritemSpacing/2) - layout.sectionInset.left
        layout.itemSize = CGSize(width: width, height: width)
        return layout
    }

}


extension HousesCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.numItems ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let house = presenter?.fetchSelectItem(at: indexPath), let cell =
                    collectionView.dequeueReusableCell(withReuseIdentifier: "HousesCollectionViewCell", for: indexPath) as? HousesCollectionViewCell else {
                fatalError()
            }
        cell.configure(with: house)
        return cell
    }
}

extension HousesCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    presenter?.didSelectItem(at: indexPath)
    }
}
