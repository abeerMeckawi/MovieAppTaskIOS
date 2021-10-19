//
//  CastCollectionView + DetailsVC.swift
//  MovieAppTaskIOS
//
//  Created by Abeer Meckawi on 18/10/2021.
//

import UIKit

extension DetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func configureCollectionView() {
        
        castCollectionView.delegate = self
        castCollectionView.dataSource = self
        castCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        detailsVM.movie?.cast.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        detailsVM.congigureCell(cell: cell, indexPath: indexPath, cast: detailsVM.movie!.cast)
        return cell
    }
}
