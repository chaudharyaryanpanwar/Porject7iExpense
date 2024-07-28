//
//  ExpenseView.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 26/07/24.
//

import SwiftUI

struct ExpenseView: View {
    
    @Bindable var item : Expense
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment : .leading){
                    Text(item.name)
                        .font(.title3.bold())
                    Text( item.type)
                    Text(item.date , format : .dateTime.day().month().year().hour())
                        .font(.caption2)
                }
                Spacer()
                Text(item.amount , format: .currency(code: Locale.current.currency?.identifier ?? "USD" ))
                    .font(.title3.bold())
                
            }
        }
        .padding()
        .background( item.amount <= 100 ? Color.green : item.amount <= 1000 ? Color.blue : Color.orange)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: 20))
        

    }
}

//#Preview {
//    ExpenseView()
//}
