//
//  ViewDesign.swift
//  KameshMeditation
//
//  Created by Kamesh on 07/08/19.
//  Copyright © 2019 kameshiOS. All rights reserved.
//

import UIKit

// Custome View class to set corner-radius, border-color & border-width

@IBDesignable class ViewDesign: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateViews()
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            updateViews()
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        clipsToBounds = true
    }
}
