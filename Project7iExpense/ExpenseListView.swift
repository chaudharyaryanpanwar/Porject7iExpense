//
//  ExpenseListView.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 12/06/24.
//

import SwiftData
import SwiftUI

struct ExpenseListView: View {
    
    @Query var expenses : [Expense]
    @Environment(\.modelContext) var modelContext
    
    let expensesType : String
    
    var body: some View {
        
        if expenses.isEmpty {
            NavigationLink {
                AddExpenseView()
            } label: {
                Text("Add Expenses")
                    .padding()
                    .background(Color.accentColor)
                    .foregroundStyle(.white)
                    .clipShape(.rect(cornerRadius: 10))
            }

        } else {
            ScrollView {
                ForEach( expenses ){ item in
                    if item.type == expensesType || expensesType == "" {
                        SwipeAction(cornerRadius: 20){
                            ExpenseView(item : item )
                        } actions: {
                            Action(tint : .red , icon : "trash.fill") {
                                removeItems(id : item.id)
                            }
                        }
                        
                    }
                }
                //            .onDelete(perform : removeItems)
            }
        }
    }
    
    init(expensesType : String ,sortOrder : [SortDescriptor<Expense>]){
        _expenses = Query(sort: sortOrder)
        self.expensesType = expensesType
    }

    func removeItems(id : UUID){
        for expense in expenses {
            if expense.id == id {
                modelContext.delete(expense)
            }
        }
    }
}

//#Preview {
////    ExpenseListView()
//}
