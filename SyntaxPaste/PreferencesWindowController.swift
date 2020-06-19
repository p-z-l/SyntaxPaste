//
//  PreferencesWindowController.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/17.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa

fileprivate let prefsWindowController = NSStoryboard(name: "Main", bundle: nil)
    .instantiateController(withIdentifier: "PreferencesWindowController") as! PreferencesWindowController

class PreferencesWindowController: NSWindowController {
    
    static var shared: PreferencesWindowController {
        return prefsWindowController
    }
}
