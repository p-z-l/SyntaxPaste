//
//  AppDelegate.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/16.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa
import Highlightr

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow!
    
    var popover: NSPopover!
    
    var statusItem: NSStatusItem!
    
    private let highlightr = Highlightr()
    
    private let pasteboard = NSPasteboard.general
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        setupStatusItem()
        setupMenu()
    }
    
    @objc private func highlight() {
        let code = pasteboard.text
        print(Preferences.themeName)
        highlightr?.setTheme(to: Preferences.themeName)
        guard let attributed = highlightr?.highlight(code) else { return }
        pasteboard.clearContents()
        pasteboard.copyAttributedString(attributed)
    }
    
    @objc private func showPrefs() {
        PreferencesWindowController.shared.window?.makeKeyAndOrderFront(self)
        NSApp.activate(ignoringOtherApps: true)
    }
    
    private func setupStatusItem() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusIcon")
        }
    }
    
    private func setupMenu() {
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "Highlight clipboard", action: #selector(highlight), keyEquivalent: ""))
        menu.addItem(NSMenuItem(title: "Preferences...", action: #selector(showPrefs), keyEquivalent: ","))
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
}

