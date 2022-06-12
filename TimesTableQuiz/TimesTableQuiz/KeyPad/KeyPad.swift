//
//  KeyPad.swift
//  TimesTableQuiz
//
//  Created by Chan, Teki on 12/06/2022.
//

import SwiftUI

struct KeyPad: View {
    @Binding var string: String
    let onEnter: () -> ()

    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: ["⌫", "0", "⏎"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }

    private func keyWasPressed(_ key: String) {
        switch key {
            case "⏎": onEnter()
            case "⌫":
                string.removeLast()
                if string.isEmpty { string = "0" }
            case _ where string == "0": string = key
            default: string += key
        }
    }
}

struct KeyPad_Previews: PreviewProvider {
    @State static var string = "0"
    static var previews: some View {
        VStack {
            Text("\(string)")
            KeyPad(string: $string) {
                print(string)
            }
        }
    }
}
