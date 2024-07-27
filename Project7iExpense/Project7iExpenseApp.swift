//
//  Project7iExpenseApp.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftData
import SwiftUI

@main
struct Project7iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
