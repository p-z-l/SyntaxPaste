//
//  PreferencesViewController.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/17.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa
import Highlightr

class PreferencesViewController: NSViewController {
    
    @IBOutlet weak var themePopUpBt: NSPopUpButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupThemePopUp()
    }
    
    private func setupThemePopUp() {
        themePopUpBt.removeAllItems()
        themePopUpBt.addItems(withTitles: Highlightr()!.availableThemes())
        themePopUpBt.selectItem(withTitle: Preferences.themeName)
    }
    
    @IBAction func themeSelected(_ sender: NSPopUpButton) {
        Preferences.themeName = sender.selectedItem!.title
    }
}
