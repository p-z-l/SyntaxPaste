//
//  PreferencesWindowController.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/17.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa

class PreferencesWindowController: NSWindowController {
    static var shared: PreferencesWindowController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let prefsWindowController = storyboard.instantiateController(withIdentifier: "PreferencesWindowController") as! PreferencesWindowController
        return prefsWindowController
    }
}
