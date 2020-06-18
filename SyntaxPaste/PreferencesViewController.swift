//
//  PreferencesViewController.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/17.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa
import Highlightr

class PreferencesViewController: NSViewController, NSFontChanging {
    
    @IBOutlet weak var themePopUpBt: NSPopUpButton!
    
    @IBOutlet weak var fontField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupThemePopUp()
        setupFontField()
    }
    
    @IBAction func themeSelected(_ sender: NSPopUpButton) {
        Preferences.themeName = sender.selectedItem!.title
    }
    
    @IBAction func chooseFont(_ sender: NSButton) {
        let fontPanel = NSFontPanel.shared
        fontPanel.orderFront(self)
    }
    
    func changeFont(_ sender: NSFontManager?) {
        
        guard sender != nil else { return }
        
        let font = fontField.font!
        let newFont = sender!.convert(font)
        fontField.font = newFont
        fontField.stringValue = "\(newFont.displayName!) : \(newFont.pointSize)pt"
        
        Preferences.font = font
    }
    
    private func setupThemePopUp() {
        themePopUpBt.removeAllItems()
        themePopUpBt.addItems(withTitles: Highlightr()!.availableThemes())
        themePopUpBt.selectItem(withTitle: Preferences.themeName)
    }
    
    private func setupFontField() {
        let font = Preferences.font
        fontField.font = font
        fontField.stringValue = "\(font.displayName!) : \(font.pointSize)pt"
    }
}
