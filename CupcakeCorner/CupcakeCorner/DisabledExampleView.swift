//
//  DisabledExampleView.swift
//  CupcakeCorner
//
//  Created by Chan, Teki on 27/06/2022.
//

import SwiftUI

struct DisabledExampleView: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }

    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }

            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            // .disabled(username.isEmpty || email.isEmpty)
            .disabled(disableForm)
        }
    }
}

struct DisabledExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DisabledExampleView()
    }
}
