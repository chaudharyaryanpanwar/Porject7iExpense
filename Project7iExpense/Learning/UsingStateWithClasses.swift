//
//  UsingStateWithClasses.swift
//  Project7iExpense
//
//  Created by Aryan Panwar on 08/06/24.
//

import SwiftUI
import Observation

struct UsingStateWithClasses: View {
    @State private var user = User()
    
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lastName).")
            
            TextField("First Name" , text : $user.firstName)
            TextField("LastName", text: $user.lastName)
        }
    }
}

@Observable
class User {
    var firstName = "Aryan"
    var lastName = "Panwar"
}

#Preview {
    UsingStateWithClasses()
}
