//
//  LearnSelfView.swift
//  CoreDataProject
//
//  Created by Chan, Teki on 05/07/2022.
//

import SwiftUI

struct Student: Hashable {
    let name: String
}

struct LearnSelfView: View {
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]

    var body: some View {
        VStack {
            List(students, id: \.self) { student in
                Text(student.name)
            }
            
            List {
                ForEach([2, 4, 6, 8, 10], id: \.self) {
                    Text("\($0) is even")
                }
            }
        }
    }
}

struct LearnSelfView_Previews: PreviewProvider {
    static var previews: some View {
        LearnSelfView()
    }
}
