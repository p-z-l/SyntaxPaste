//
//  NSPasteboard+Extension.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/17.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Cocoa

extension NSPasteboard {
    var text : String {
        return self.string(forType: .string) ?? ""
    }
    func copyAttributedString(_ attributedString: NSAttributedString) {
        self.declareTypes([.string], owner: nil)
        self.writeObjects([attributedString])
    }
}
