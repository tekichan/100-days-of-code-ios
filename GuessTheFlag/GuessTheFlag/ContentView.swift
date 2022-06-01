//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Chan, Teki on 01/06/2022.
//

import SwiftUI

struct ContentView: View {
    let maxRound: Int = 8
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var totalScore = 0
    @State private var alertMessage = ""
    @State private var currentRound = 0
    @State private var showingReset = false

    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            totalScore += 1
            alertMessage = ""
        } else {
            scoreTitle = "Wrong"
            alertMessage = "Wrong! That’s the flag of \(countries[correctAnswer])"
        }
        showingScore = true
    }
    
    func askQuestion() {
        if currentRound >= maxRound - 1 {
            showingReset = true
        } else {
            currentRound += 1
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
    }
    
    func reset() {
        showingScore = false
        scoreTitle = ""
        totalScore = 0
        alertMessage = ""
        currentRound = 0
        showingReset = false
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("\(currentRound + 1). Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)

                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .renderingMode(.original)
                                .resizable()
                                .scaledToFit()
                                .clipShape(Capsule())
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Spacer()
            if !alertMessage.isEmpty {
                Text(alertMessage)
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
            Text("Your score is \(totalScore)")
                .foregroundColor(.white)
                .font(.title.bold())
            Spacer()
        }
        .alert(scoreTitle, isPresented: $showingReset) {
            Button("Reset", action: reset)
        } message: {
            Text("Brilliant! You've got \(totalScore) out of \(maxRound).")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
