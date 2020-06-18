//
//  AppDelegate.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/16.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa
import Highlightr
import HotKey

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    var popover: NSPopover!
    
    var statusItem: NSStatusItem!
    
    private let highlightr = Highlightr()
    
    private let pasteboard = NSPasteboard.general
    
    private var prefsIsOpened = false
    
    lazy var hotkey = HotKey(key: .x, modifiers: [.option,.control])
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupStatusItem()
        setupMenu()
        setupHotKey()
    }
    
    @objc private func highlight() {
        let code = pasteboard.text
        highlightr?.setTheme(to: Preferences.themeName)
        
        guard var attributed = highlightr?.highlight(code) else { return }
        
        // Apply font
        let mutableAttributed = NSMutableAttributedString(attributedString: attributed)
        mutableAttributed.addAttributes([
            NSAttributedString.Key.font : Preferences.font
        ], range: NSRange(location: 0, length: mutableAttributed.length))
        attributed = mutableAttributed
        
        pasteboard.clearContents()
        pasteboard.copyAttributedString(attributed)
    }
    
    @objc private func showPrefs() {
        guard !prefsIsOpened else {
            NSApp.activate(ignoringOtherApps: true)
            return
        }
        
        prefsIsOpened = true
        PreferencesWindowController.shared.window?.makeKeyAndOrderFront(self)
        NSApp.activate(ignoringOtherApps: true)
        
        if let prefsVC = PreferencesWindowController.shared.window?.contentViewController as? PreferencesViewController {
            prefsVC.closed {
                self.prefsIsOpened = false
            }
        }
    }
    
    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusIcon")
        }
    }
    
    private func setupMenu() {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Highlight clipboard", action: #selector(highlight), keyEquivalent: "u"))
        menu.addItem(NSMenuItem(title: "Preferences...", action: #selector(showPrefs), keyEquivalent: ","))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    private func setupHotKey() {
        hotkey.keyDownHandler = {
            self.highlight()
        }
    }
}

