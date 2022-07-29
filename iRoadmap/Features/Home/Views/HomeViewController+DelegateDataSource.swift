//
//  HomeViewController+DelegateDataSource.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let content = contents[section]
        
        if content.isOpened {
            return content.subContent.count + 1
        }
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCollectionViewCell.identifier, for: indexPath) as! ContentCollectionViewCell
            delegate = cell
            delegate?.expandableItemChanges(isExpanded: contents[indexPath.section].isOpened)
            cell.config(data: self.contents[indexPath.section])
            
            return cell
        } else {
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: SubContentCollectionViewCell.identifier, for: indexPath) as! SubContentCollectionViewCell
            
            cell2.config(data: self.contents[indexPath.section].subContent[indexPath.row-1])
            selectedSection = indexPath.section
            cell2.bgCard.index = indexPath.row-1
            cell2.bgCard.isUserInteractionEnabled = true
            cell2.bgCard.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goDetail(_ :))))
            
            return cell2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: view.frame.size.width, height: 65)
        } else {
            return CGSize(width: view.frame.size.width, height: 75)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        contents[indexPath.section].isOpened = !contents[indexPath.section].isOpened
        collectionView.reloadSections([indexPath.section])
    }
    
}
