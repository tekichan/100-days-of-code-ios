//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Chan, Teki on 03/06/2022.
//

import SwiftUI

enum GameState {
    case starting, started, showed
}

struct ContentView: View {
    @State private var timeRemaining = 3
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    let cpuMoves = ["🗿", "📄", "✂️"]
    let humanMoves = ["👊", "🤚", "✌️"]
    
    @State private var gameState: GameState = .starting
    @State private var cpuMove: Int = -1
    @State private var humanMove: Int = -1
    @State private var doesHumanWin: Bool = false
    @State private var isGameTied: Bool = false
    @State private var gameMessage: String = ""
    
    func startGame() {
        cpuMove = Int.random(in: 0..<cpuMoves.count)
        humanMove = -1
        doesHumanWin = false
        isGameTied = false
        gameMessage = "What's up?"
        gameState = .started
        timeRemaining = 3
    }
    
    func selectMove(_ idx: Int) {
        humanMove = idx
        if humanMove == cpuMove {
            isGameTied = true
            gameMessage = "Draw Game."
        } else if humanMove - cpuMove == 1 || humanMove - cpuMove == -2 {
            doesHumanWin = true
            gameMessage = "You win!"
        } else {
            gameMessage = "You lose."
        }
        gameState = .showed
    }
    
    var body: some View {
        ZStack {
            AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
                .ignoresSafeArea()
            VStack {
                Text("Rock Paper Scissors")
                    .underline()
                    .font(.largeTitle.weight(.bold))
                Spacer()
                switch gameState {
                case .starting:
                    Button {
                        startGame()
                    } label: {
                        Text("Let's start!")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(.primary)
                            .cornerRadius(10)
                    }
                    Text("Are you ready?")
                        .font(.title)
                    HStack {
                        ForEach(humanMoves, id: \.self) { selectedMove in
                            Text(selectedMove)
                                .font(.system(size: 80))
                        }
                    }
                case .started:
                    Text("\(timeRemaining)")
                        .font(.system(size: 80))
                    Text("What's your move?")
                        .font(.title)
                    HStack {
                        ForEach(0..<humanMoves.count, id: \.self) { selectedMoveIdx in
                            Button {
                                selectMove(selectedMoveIdx)
                            } label: {
                                Text(humanMoves[selectedMoveIdx])
                                    .font(.system(size: 80))
                            }
                        }
                    }
                case .showed:
                    Text(cpuMoves[cpuMove])
                        .font(.system(size: 80))
                    Button {
                        startGame()
                    } label: {
                        Text(gameMessage + " Play again?")
                            .font(.title)
                            .padding()
                            .foregroundColor(.white)
                            .background(.primary)
                            .cornerRadius(10)
                    }
                    if humanMove >= 0 {
                        Text(humanMoves[humanMove])
                            .font(.system(size: 80))
                    } else {
                        Text("⁉️")
                            .font(.system(size: 80))
                    }
                }
                Spacer()
            }
        }
        .onReceive(timer) { time in
            if timeRemaining > 0 {
                timeRemaining -= 1
            } else if timeRemaining == 0 && gameState == .started {
                gameState = .showed
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
