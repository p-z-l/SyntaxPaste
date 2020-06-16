//
//  AppDelegate.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/16.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa
import SwiftUI
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
        guard let attributed = highlightr?.highlight(code) else { return }
        pasteboard.clearContents()
        pasteboard.copyAttributedString(attributed)
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
        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
}

