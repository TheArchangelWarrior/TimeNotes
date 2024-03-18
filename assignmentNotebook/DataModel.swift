//
//  DataModel.swift
//  assignmentNotebook
//
//  Created by Angel Bitsov on 3/15/24.
//

import Foundation
import SwiftData


@Model
class DataModel: Identifiable{
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
