//
//  AddView.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 11/06/24.
//

import SwiftData
import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State private var date  : Date = Date()
    
    @Environment(\.modelContext) var modelContext
    
    let types = ["Business" , "Personal"]
    var body: some View {
        NavigationStack {
            Form {
//
                
                Picker("Type" , selection : $type){
                    ForEach(types , id :\.self){
                        Text($0)
                    }
                }
                
                TextField("Amount" , value : $amount , format : .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                
                DatePicker("Enter date", selection: $date)
            }
            .navigationTitle("Add New Expense")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden()
            .toolbar{
                ToolbarItem(placement: .principal) {
                    
                    TextField("Name", text: $name)
                        .padding(.horizontal)
                        .font(.title)
                        .frame(maxWidth: 200)
                        .background(.gray)
                        .foregroundStyle(.white)
                        .clipShape(.rect(cornerRadius: 10))
                                
                }
                ToolbarItem(placement : .topBarTrailing){
                    Button("Save"){
                        let item  = Expense(name : name , type : type , amount : amount  , date : date)
                        modelContext.insert(item)
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarLeading){
                    Button("Cancel" , role: .destructive){
                        dismiss()
                    }
                }
                
            }
        }
    }
}

//#Preview {
//    do {
//            let config = ModelConfiguration(isStoredInMemoryOnly: true)
//            let container = try ModelContainer(for: Expense.self, configurations: config)
////            let user = User(name : "Taylor Swift" , city : "Nashville" , joinDate: .now)
//            return AddView()
//                .modelContainer(container)
//        } catch {
//            return Text("Failed to create container : \(error.localizedDescription)")
//        }
//}
