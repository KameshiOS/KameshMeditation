//
//  Category.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

// Modal
struct Category {
    var color: UIColor!
    var title: String!
    
    init(color: UIColor, title: String) {
        self.color = color
        self.title = title
    }
}

struct Music {
    var image: String!
    var audio: String!
    
    init(image: String, audio: String) {
        self.image = image
        self.audio = audio
    }
}
