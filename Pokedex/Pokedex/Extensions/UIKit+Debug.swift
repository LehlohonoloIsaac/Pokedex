//
//  UIKit+Debug.swift
//  Pokedex
//
//  Created by dvt on 2017/11/08.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import UIKit

extension UIWindow {
    class var key: UIWindow {
        let selector: Selector = NSSelectorFromString("keyWindow")
        let result = UIWindow.perform(selector)
        return result?.takeUnretainedValue() as! UIWindow
    }
}

extension UIView {
    var recursiveDescription: NSString {
        let selector: Selector = NSSelectorFromString("recursiveDescription")
        let result = perform(selector)
        return result?.takeUnretainedValue() as! NSString
    }
}

extension UIViewController {
    var printHierachy: NSString {
        let selector: Selector = NSSelectorFromString("_printHierachy")
        let result = perform(selector)
        return result?.takeUnretainedValue() as! NSString
    }
}

