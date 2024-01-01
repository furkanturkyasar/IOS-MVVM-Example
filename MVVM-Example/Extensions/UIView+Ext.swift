//
//  UIView+Ext.swift
//  MVVM-Example
//
//  Created by Furkan Türkyaşar on 30.12.2023.
//

import UIKit


extension UIView {
    func pinToEdgeOf(view: UIView) {
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
