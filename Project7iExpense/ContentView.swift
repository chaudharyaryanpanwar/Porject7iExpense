//
//  ContentView.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    
    
    
    @Query var expenses : [Expense]
    
    @State private var showingAddExpense = false
    @State private var expenseType = "Personal"
    
    @State private var sortOrder = [
        SortDescriptor(\Expense.name) ,
        SortDescriptor(\Expense.amount) ,
    ]
    
    
    var body: some View {
        NavigationStack {
            TabView {
                Group {
                    ExpenseListView(expensesType: "" , sortOrder: sortOrder)
                        .padding(.horizontal)
                        .tabItem {
                            Label("All", systemImage: "list.bullet")
                        }
                    ExpenseListView(expensesType: "Personal" , sortOrder: sortOrder)
                        .padding(.horizontal)
                        .tabItem {
                            Label("Personal", systemImage: "person.crop.circle")
                        }
                    
                    ExpenseListView(expensesType: "Business" , sortOrder: sortOrder)
                        .tabItem {
                            Label("Business" , systemImage: "briefcase")
                        }
                        .padding(.horizontal)
                }
                
                
                .sheet(isPresented : $showingAddExpense ){
                    AddExpenseView()
                }
                
            }
            .toolbar {
                ToolbarItem {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\Expense.name),
                                    SortDescriptor(\Expense.date)
                                ])
                            Text("Sort by Amount")
                                .tag([
                                    SortDescriptor(\Expense.amount , order : .reverse) ,
                                    SortDescriptor(\Expense.date)   
                                ])
                            Text("Sort by Date")
                                .tag([
                                    SortDescriptor(\Expense.date , order : .reverse)  ,
                                    SortDescriptor(\Expense.amount)
                                ])
                        }
                    }
                }

                ToolbarItem {
                    NavigationLink {
                        AddExpenseView()
                    } label: {
                        Label("Add expense" , systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        VStack {
                            Circle().fill(.green)
                            Text("₹<100")
                                .font(.caption)
                        }
                        VStack {
                            Circle().fill(.blue)
                            Text("₹<1000")
                                .font(.caption2)
                        }
                        VStack {
                            Circle().fill(.orange)
                            Text("₹>1000 ")
                                .font(.caption2)
                        }
                    }
                }

            }
            .navigationTitle("iExpense")
        }
        
    }
}

#Preview {
    ContentView()
}
