//
//  String+Extension.swift
//  SyntaxPaste
//
//  Created by Peter Luo on 2020/6/19.
//  Copyright © 2020 Peter Luo. All rights reserved.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
