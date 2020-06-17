//
//  Preferences.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/17.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa

class Preferences: NSObject {
    
    override private init() {}
    
    struct Keys {
        static let themeName = "SyntaxPaste_themeName"
    }
    
    static var themeName: String {
        get {
            UserDefaults.standard.string(forKey: Preferences.Keys.themeName) ?? "atom-one-dark"
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Preferences.Keys.themeName)
        }
    }
}
