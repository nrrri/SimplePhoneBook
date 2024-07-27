//
//  Item.swift
//  SimplePhoneBook
//
//  Created by Narissorn Chowarun on 2024-07-27.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
