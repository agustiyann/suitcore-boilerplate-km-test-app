//
//  StringProtocol+Ext.swift
//  SMV-iper
//
//  Created by Agus Tiyansyah Syam on 07/03/22.
//  Copyright © 2022 Rifat Firdaus. All rights reserved.
//

import Foundation

extension StringProtocol where Self: RangeReplaceableCollection {
    var letters: Self { filter(\.isLetter) }
    var isPalindrome: Bool {
        let letters = self.letters
        return String(letters.reversed()).caseInsensitiveCompare(letters) == .orderedSame
    }
}
