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

    var contactName: String
    var position: String
    var phoneNumber: String
    
    
    init(contactName: String, position: String, phoneNumber: String) {
        self.contactName = contactName
        self.position = position
        self.phoneNumber = phoneNumber
    }
}
