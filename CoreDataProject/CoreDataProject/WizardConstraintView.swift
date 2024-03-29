//
//  WizardConstraintView.swift
//  CoreDataProject
//
//  Created by Chan, Teki on 05/07/2022.
//

import SwiftUI

struct WizardConstraintView: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(sortDescriptors: []) var wizards: FetchedResults<Wizard>

    var body: some View {
        VStack {
            List(wizards, id: \.self) { wizard in
                Text(wizard.name ?? "Unknown")
            }

            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }

            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct WizardConstraintView_Previews: PreviewProvider {
    static var previews: some View {
        WizardConstraintView()
    }
}
