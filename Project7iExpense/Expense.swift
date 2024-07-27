//
//  ExpenseItem.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 11/06/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id : UUID
    var name : String
    var type : String
    var amount : Double
    var date : Date
    
    init(id: UUID = UUID() , name: String, type: String, amount: Double , date : Date = Date()) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
        self.date = date
    }
    
}


