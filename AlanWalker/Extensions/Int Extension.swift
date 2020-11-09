//
//  Int Extension.swift
//  AlanWalker
//
//  Created by Hady on 11/7/20.
//  Copyright © 2020 HadyOrg. All rights reserved.
//

import Foundation

//MARK: - Int Extension Return the time in "00:00" Format
extension Int {
    func toString() -> String {
        if (self < 10 && self >= 0) {
            return "0\(Int(self))"
        } else {
            return "\(Int(self))"
        }
    }
}
