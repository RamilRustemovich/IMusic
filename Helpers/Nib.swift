//
//  Nib.swift
//  IMusic
//
//  Created by Ramil Davletshin on 06.09.2020.
//  Copyright © 2020 Ramil Davletshin. All rights reserved.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
