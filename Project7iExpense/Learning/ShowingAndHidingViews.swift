//
//  ShowingAndHidingViews.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftUI

struct SecondView : View {
    @Environment(\.dismiss) var dismiss
    let name : String
    var body : some View {
        Text("Hello \(name) ")
        Button("Dismiss") {
            dismiss()
        }
    }
}

struct ShowingAndHidingViews: View {
    
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet"){
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet, content: {
            SecondView(name : "Aryan Panwar")
        })
    }
}

#Preview {
    ShowingAndHidingViews()
}
