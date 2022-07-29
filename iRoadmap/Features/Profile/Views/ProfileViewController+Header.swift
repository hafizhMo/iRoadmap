////
////  ProfileViewController+Header.swift
////  iRoadmap
////
////  Created by Hafizh Mo on 28/07/22.
////
//
//import UIKit
//
//extension ProfileViewController {
//
//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        
//        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
//
//        header.config()
//        header.titleSection.text = "My Badges"
//        header.buttonSection.setTitle("See All", for: .normal)
//        header.buttonSection.addTarget(self, action: #selector(goBadges), for: .touchUpInside)
//        header.buttonSection.isHidden = false
//        header.divider.isHidden = true
//        return header
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        if collectionView == self.collectionBadges{
//            return CGSize(width: view.frame.size.width, height: 84)
//
//        }
//        return CGSize(width: 0, height: 0)
//    }
//}
