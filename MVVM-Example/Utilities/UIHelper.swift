//
//  UIHelper.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
//        layout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 30, right: 10)
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        return layout
    }
}
