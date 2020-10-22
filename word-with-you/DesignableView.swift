//
//  DesignableView.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/22/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.


//IBdesignable allows us to update these in storyboard

import UIKit

@IBDesignable
class DesignableView: UIView {
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: CGFloat = 0 {
        didSet {
            layer.shadowOpacity = Float(shadowOpacity)
        }
    }
    
    @IBInspectable var shadowOffsetY: CGFloat = 0{
        didSet {
            layer.shadowOffset.height = shadowOffsetY
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
