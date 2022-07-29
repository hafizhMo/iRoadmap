//
//  DetailViewController+DelegateDataSource.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section{
        case 0: return 0
        case 1: return data!.learningObj.count
        case 2: return mainLink.count
        case 3: return additionalLink.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LearningObjCollectionViewCell.identifier, for: indexPath) as! LearningObjCollectionViewCell
            cell.vc = self
            cell.config(data: data!.learningObj[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LinksCollectionViewCell.identifier, for: indexPath) as! LinksCollectionViewCell
            cell.vc = self
            if indexPath.section == 2 {
                cell.config(data: mainLink[indexPath.row])
            } else if indexPath.section == 3 {
                cell.config(data: additionalLink[indexPath.row])
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1 {
            return CGSize(width: view.frame.size.width, height: 32)
        }
        
        return CGSize(width: view.frame.size.width, height: 100)
    }
}
