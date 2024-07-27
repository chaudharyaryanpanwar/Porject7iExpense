//
//  StoringUserSettingsWithUserDefaults.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftUI

struct StoringUserSettingsWithUserDefaults: View {
    
    @State private var tapCount = 0
    @State private var isSheet = false
    var body: some View {
        Button("Tap Count : \(tapCount)"){
            tapCount += 1
            isSheet.toggle()
            UserDefaults.standard.set(tapCount , forKey : "Tap" )
        }
        .sheet(isPresented: $isSheet, content: {
            TestingStruct()
        })
    }
}
struct AppStorageView : View {
    @AppStorage("tapCounting") private var tapCount = 0
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}
struct TestingStruct : View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    var body: some View {
        Text("You have entered the key \(tapCount)")
    }
}
#Preview {
//    StoringUserSettingsWithUserDefaults()
    AppStorageView()
}
