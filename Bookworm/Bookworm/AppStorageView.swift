//
//  AppStorageView.swift
//  Bookworm
//
//  Created by Chan, Teki on 01/07/2022.
//

import SwiftUI

struct AppStorageView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationView {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

struct AppStorageView_Previews: PreviewProvider {
    static var previews: some View {
        AppStorageView()
    }
}
