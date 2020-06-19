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
    
    struct keys {
        static let themeName = "SyntaxPaste_themeName"
        static let fontKey = "SyntaxPaste_fontKey"
        static let bgColorKey = "SyntaxPaste_bgColorKey"
    }
    
    struct defaultValues {
        static let themeName = "atom-one-dark"
        static let font = NSFont(name: "Menlo", size: NSFont.systemFontSize)!
        static let useBgColor = false
    }
    
    static var themeName: String {
        get {
            UserDefaults.standard.string(forKey: Preferences.keys.themeName) ?? Preferences.defaultValues.themeName
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Preferences.keys.themeName)
        }
    }
    
    static var font: NSFont {
        get {
            NSFont.loadFromUserDefaults(forKey: Preferences.keys.fontKey)
        }
        set {
            newValue.saveToUserDefaults(forKey: Preferences.keys.fontKey)
        }
    }
    
    static var useBgColor: Bool {
        get {
            UserDefaults.standard.bool(forKey: Preferences.keys.bgColorKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Preferences.keys.bgColorKey)
        }
    }
}
