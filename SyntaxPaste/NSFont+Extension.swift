//
//  NSFont+Extension.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/18.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa

extension NSFont {
    static func loadFromUserDefaults(forKey key: String) -> NSFont {
        let nameKey = "\(key)_name"
        let sizeKey = "\(key)_size"
        
        guard let name = UserDefaults.standard.string(forKey: nameKey) else {
            return Preferences.defaultValues.font
        }
        let size = CGFloat(UserDefaults.standard.float(forKey: sizeKey))
        guard size != 0 else {
            return Preferences.defaultValues.font
        }
        
        return NSFont(name: name, size: size)!
    }
    
    func saveToUserDefaults(forKey key: String) {
        let nameKey = "\(key)_name"
        let sizeKey = "\(key)_size"
        
        UserDefaults.standard.set(self.fontName, forKey: nameKey)
        UserDefaults.standard.set(self.pointSize, forKey: sizeKey)
    }
}
