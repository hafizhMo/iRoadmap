//
//  DetailViewController+HeaderFoo.swift
//  iRoadmap
//
//  Created by Hafizh Mo on 28/07/22.
//

import UIKit

extension DetailViewController {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        //HEADER
        case UICollectionView.elementKindSectionHeader:
            
            if indexPath.section == 0 {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderDetailCollectionReusableView.identifier, for: indexPath) as! HeaderDetailCollectionReusableView
                
                header.config(content: contentTitle!, subContent: data!.name)
                return header
            } else {
                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
                
                header.config()
                
                switch indexPath.section {
                case 1:
                    header.titleSection.text = "Learning Objective"
                case 2:
                    header.titleSection.text = "Links"
                case 3:
                    header.titleSection.text = "Additional Links"
                    header.buttonSection.isHidden = false
                default:
                    print("index out of range")
                }
                return header
            }
            
        //FOOTER
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: FooterDetailCollectionReusableView.identifier, for: indexPath) as! FooterDetailCollectionReusableView
            footer.vc = self
            footer.config()
            
            return footer
            
        default:
            print("Invalid element kind!")
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            if data!.name.count > 20 {
                return CGSize(width: view.frame.size.width, height: 185)
            }
            return CGSize(width: view.frame.size.width, height: 140)
        }
        return CGSize(width: view.frame.size.width, height: 84)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section != 3 {
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: view.frame.size.width, height: 96)
    }
}
