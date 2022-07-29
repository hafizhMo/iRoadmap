//
//  ProfileViewController+DelegateDataSource.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

extension ProfileViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionStats {
            return 3
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionStats {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatsCollectionViewCell.identifier, for: indexPath) as! StatsCollectionViewCell
            cell.config(value: self.stats[indexPath.row].value,
                        name: self.stats[indexPath.row].name)
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyBadgesCollectionViewCell.identifier, for: indexPath) as! MyBadgesCollectionViewCell
            cell.config(name: "The Beginner", image: UIImage(named: "badges1")!, color: .systemTeal)
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionStats {
            return CGSize(width: view.frame.size.width/3.55, height: 80)
        }
        
        return CGSize(width: 150, height: 145)
    }
}

struct Stats {
    let value: Int
    let name: String
}
