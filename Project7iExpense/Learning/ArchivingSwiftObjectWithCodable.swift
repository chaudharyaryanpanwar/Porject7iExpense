//
//  ArchivingSwiftObjectWithCodable.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftUI

struct ArchivingSwiftObjectWithCodable: View {
    
    @State private var user = User1(firstName: "Diljit", lastName: "Dosanj")
    @State private var isSheetPresented = false
    
    var body: some View {
        Button("Save User") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user){
                UserDefaults.standard.set(data , forKey: "UserData")
            }
            
            isSheetPresented.toggle()
        }
    }
}
//struct ConfirmJSON : View {
//    let decoder = JSONDecoder()
//    
//    if let data = try? decoder.decode(Data , from: .)
//    var body: some View {
//        Text("hello ")
//    }
//}

struct User1 : Codable  {
    let firstName : String
    let lastName : String
}


#Preview {
    ArchivingSwiftObjectWithCodable()
}
