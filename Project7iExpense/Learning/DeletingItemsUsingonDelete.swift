//
//  DeletingItemsUsingonDelete().swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftUI

//onDelete is exclusively used with List(in list using ForEach) and ForEach
struct DeletingItemsUsingonDelete : View {
    
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(numbers , id : \.self ){
                        Text("Row \($0) ")
                    }
                    .onDelete( perform : removeRows )
                }
                Button("Add Numbers") {
                    numbers.append(currentNumber)
                    currentNumber += 1
                }
            }
            .toolbar {
                EditButton()
            }
        }
        
    }
    func removeRows(at offsets : IndexSet ){
        numbers.remove(atOffsets: offsets)
    }
}

#Preview {
    DeletingItemsUsingonDelete()
}
