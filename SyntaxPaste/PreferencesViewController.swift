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
    
    @IBOutlet weak var bgColorCheckBox: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupThemePopUp()
        setupFontField()
        setupBgColorCheckBox()
    }
    
    @IBAction func themeSelected(_ sender: NSPopUpButton) {
        Preferences.themeName = sender.selectedItem!.title
    }
    
    @IBAction func chooseFont(_ sender: NSButton) {
        let fontPanel = NSFontPanel.shared
        fontPanel.orderFront(self)
    }
    
    @IBAction func changeUseBgColor(_ sender: NSButton) {
        if sender.state == .on {
            Preferences.useBgColor = true
        } else {
            Preferences.useBgColor = false
        }
    }
    
    func changeFont(_ sender: NSFontManager?) {
        
        guard sender != nil else { return }
        
        let font = fontField.font!
        let newFont = sender!.convert(font)
        fontField.font = newFont
        fontField.stringValue = "\(newFont.displayName!) : \(newFont.pointSize)pt"
        
        Preferences.font = newFont
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
        fontField.isEditable = false
    }
    
    private func setupBgColorCheckBox() {
        if Preferences.useBgColor {
            bgColorCheckBox.state = .on
        } else {
            bgColorCheckBox.state = .off
        }
    }
}
