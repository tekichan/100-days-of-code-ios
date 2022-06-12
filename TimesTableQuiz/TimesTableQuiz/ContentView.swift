//
//  ContentView.swift
//  TimesTableQuiz
//
//  Created by Chan, Teki on 10/06/2022.
//

import SwiftUI

struct ContentView: View {
    let gameTitle = "Times Table Quiz"
    let alertTitle = "The answer is ..."
    let resultTitle = "Finish..."
    
    @State private var tableNumber = 2
    @State private var numOfQuestions = 5
    @State private var isPlayingGame = false
    @State private var currentQuestion = 0
    @State private var secondNumber = 0
    @State private var currentAnswer = 0
    @State private var isAnswerPresent = false
    @State private var isCorrect = false
    @State private var isWrong = false
    @State private var score = 0
    @State private var isResultPresent = false
    @State private var keyString = "0"
    
    @State private var animationAmount = 0.0
    @State private var dragAmount = CGSize.zero
    @State private var enableRotation = true
    @State private var opacityValues = [1.0, 0.5, 0.5]
    
    func startGame() {
        isPlayingGame = true
        currentQuestion = 0
        nextQuestion()
    }
    
    func resetGame() {
        isPlayingGame = false
        currentQuestion = 0
        isAnswerPresent = false
        isResultPresent = false
        isCorrect = false
        isWrong = false
        score = 0
    }
    
    func nextQuestion() {
        if currentQuestion >= numOfQuestions {
            isResultPresent = true
        } else {
            isAnswerPresent = false
            currentQuestion += 1
            currentAnswer = 0
            keyString = "0"
            secondNumber = Int.random(in: 2...12)
            isCorrect = false
            isWrong = false
        }
    }
    
    func answerIt() {
        isAnswerPresent = true
        if currentAnswer == tableNumber * secondNumber {
            isCorrect = true
            score += 1
        } else {
            isWrong = true
        }
    }
    
    func selectQuestion(num: Int) {
        numOfQuestions = (num + 1) * 5
        for i in 0..<opacityValues.count {
            if i == num {
                opacityValues[i] = 1.0
            } else {
                opacityValues[i] = 0.5
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack(spacing: 0) {
                    LinearGradient(gradient: Gradient(colors: [.blue, Color(red: 0.4627, green: 0.8392, blue: 1.0)]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    LinearGradient(gradient: Gradient(colors: [Color(red: 0.4627, green: 0.8392, blue: 1.0), .green]), startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                }
                
                VStack(spacing: 5) {
                    if !isPlayingGame {
                        Section {
                            Text("\(tableNumber)")
                                .padding(50)
                                .background(.red)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .clipShape(Circle())
                                .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
                                .gesture(
                                    DragGesture()
                                        .onChanged {
                                            dragAmount = $0.translation

                                            if (tableNumber > 2 && tableNumber < 12) || (tableNumber == 2 && dragAmount.width > 0) || (tableNumber == 12 && dragAmount.width < 0){
                                            
                                            if enableRotation {
                                                if dragAmount.width > 0 {
                                                    tableNumber += 1
                                                } else {
                                                    tableNumber -= 1
                                                }
                                                enableRotation = false
                                            }
                                            
                                            withAnimation(.interpolatingSpring(stiffness: 5, damping: 2)) {
                                                if dragAmount.width > 0 {
                                                    animationAmount += 360
                                                } else {
                                                    animationAmount -= 360
                                                }
                                            }
                                            }
                                        }
                                        .onEnded { _ in
                                            dragAmount = .zero
                                            enableRotation = true
                                        }
                                )
                        } header: {
                            Text("Which number of Times Table?")
                        }
                        .padding()
                        
                        Section {
                            VStack {
                                HStack {
                                    Button {
                                        selectQuestion(num: 0)
                                    } label: {
                                        VStack {
                                            Image("chick")
                                            Text("5 Questions")
                                        }
                                    }
                                    .opacity(opacityValues[0])
                                    Button {
                                        selectQuestion(num: 1)
                                    } label: {
                                        VStack {
                                            Image("parrot")
                                            Text("10 Questions")
                                        }
                                    }
                                    .opacity(opacityValues[1])
                                }
                                Button {
                                    selectQuestion(num: 2)
                                } label: {
                                    VStack {
                                        Image("owl")
                                        Text("15 Questions")
                                    }
                                }
                                .opacity(opacityValues[2])
                            }
                        } header: {
                            Text("How many questions?")
                        }
                        
                        Spacer()
                    } else {
                        Text("Question \(currentQuestion)")
                            .font(.title)
                        
                        HStack {
                            Text("\(tableNumber)")
                            Text("✕")
                            Text("\(secondNumber)")
                            Text("=")
                        }
                        .font(.title)
                        
                        Text(keyString)
                            .font(.largeTitle)
                            .background(.yellow)
                            .padding()
                        
                        KeyPad(string: $keyString) {
                            currentAnswer = Int(keyString) ?? 0
                            answerIt()
                        }
                    }
                }
                .navigationTitle(gameTitle)
                .toolbar {
                    if !isPlayingGame {
                        Button("Let's play 🧮", action: startGame)
                            .padding(5)
                            .background(.primary)
                            .cornerRadius(15)
                    } else {
                        Button("Restart ⏪", action: resetGame)
                            .padding(5)
                            .background(.primary)
                            .cornerRadius(15)
                    }
                }
            }
        }
        .alert(alertTitle, isPresented: $isAnswerPresent) {
            Button("Continue", action: nextQuestion)
        } message: {
            if isCorrect {
                Text("Well done!")
            }
            if isWrong {
                Text("\(tableNumber) ✕ \(secondNumber) = \(tableNumber * secondNumber)")
            }
        }
        .alert(resultTitle, isPresented: $isResultPresent) {
            HStack {
                Button("Again", action: startGame)
                Button("Finish", action: resetGame)
            }
        } message: {
            Text("You got \(score) out of \(numOfQuestions)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
