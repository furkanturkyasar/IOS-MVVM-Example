//
//  UICollectionView+Ext.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 31.12.2023.
//

import UIKit

extension UICollectionView {
    
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
