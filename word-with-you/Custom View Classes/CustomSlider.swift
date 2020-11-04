//
//  CustomSlider.swift
//  word-with-you
//
//  Created by Seth Polyniak on 10/31/20.
//  Copyright © 2020 Seth Polyniak. All rights reserved.
//

import UIKit

open class CustomSlider : UISlider {
    override open func trackRect(forBounds bounds: CGRect) -> CGRect {
        var newBounds = super.trackRect(forBounds: bounds)
        newBounds.size.height = 12
        return newBounds
    }
    
    
}
