//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Matias Palmieri on 21/06/2023.
//

import SwiftUI

struct ContentView: View {
    private let turnsApp = 7
    @State private var scoring = 0
    @State private var turns = 0
    @State private var showingScore = false
    @State private var showingEndGame = false
    @State private var scoreTitle = ""
    @State private var scoreMessage = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    func flagTapped(_ number: Int) {
        turns += 1
        if turns <= turnsApp {
            if number == correctAnswer {
                scoring += 1
                scoreTitle = "Correct"
                scoreMessage = "Your score is \($scoring.wrappedValue)"
            } else {
                scoreTitle = "Wrong"
                scoreMessage = "Wrong! That’s the flag of \(countries[number])"
            }
            
            if turns == turnsApp {
                showingEndGame = true
            } else {
                showingScore = true
            }
        }
    }
    
    func askQuestion() {
        shuffleCountrys()
    }
    
    func shuffleCountrys() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func playAgain() {
        scoring = 0
        turns = 0
        shuffleCountrys()
    }
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    VStack {
                        ForEach(0..<3) { number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .renderingMode(.original)
                                    .clipShape(Capsule())
                                    .shadow(radius: 5)
                            }
                        }
                    }
                }.frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(45)
                Spacer()
                Spacer()
                Text("Score: \($scoring.wrappedValue)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
            Button("Finish", action: playAgain)
        } message: {
            Text(scoreMessage)
        }
        .alert("End of the game", isPresented: $showingEndGame) {
            Button("Play Again", action: playAgain)
        } message: {
            Text("You make \($scoring.wrappedValue) points, do you want to play again?")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
