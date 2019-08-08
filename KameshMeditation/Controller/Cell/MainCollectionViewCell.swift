//
//  MainCollectionViewCell.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    
    func updateView(category: Category) {
        backgroundColor = category.color
        layer.cornerRadius = 8
        categoryLabel.text = category.title
    }
}
