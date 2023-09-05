//
//  ContentView.swift
//  Challenge 1 - piedra papel o tijera
//
//  Created by Matias Palmieri on 01/09/2023.
//

import SwiftUI

enum GameResult {
    case win, lose, draw
}

enum Option: String, CaseIterable {
    case rock, paper, scissors
    
    static func random() -> Option {
        return Option.allCases.randomElement() ?? .rock
    }
    
    func emoji() -> String {
        switch self {
        case .rock:
            return "🪨"
        case .paper:
            return "📃"
        case .scissors:
            return "✂️"
        }
    }
}

struct ContentView: View {
    
    private let numberOfTurn = 3
    @State private var myGameResults: [GameResult] = []
    @State private var startWeapon: String = "🤔"
    @State private var startWeaponSystem: String = "❓"
    @State private var selectedOption: Option? = nil
    @State private var currentTurn = 0
    @State private var points = 0
    @State private var showingSelectWeapon = false
    @State private var showingEndGame = false
    @State private var textButton = "Jugar"
    @State private var evaluateTurn = true
    @State private var resumeGame = ""
    
    func playNextTurn() {
        textButton = "Jugar"
        startWeapon = "🤔"
        startWeaponSystem = "❓"
        selectedOption = nil
    }
    
    func play() {
        guard let theOption = selectedOption else {
            showingSelectWeapon = true
            return
        }
        if evaluateTurn {
            if currentTurn < numberOfTurn {
                currentTurn += 1
                let appChoise = Option.random()
                startWeaponSystem = appChoise.emoji()
                let result = determineGameResult(userChoice: theOption, appChoice: appChoise)
                switch result {
                case .win:
                    print("¡Ganaste!")
                    myGameResults.append(.win)
                    points += 1
                case .lose:
                    print("Perdiste.")
                    myGameResults.append(.lose)
                    points -= 1
                case .draw:
                    print("Empate.")
                    myGameResults.append(.draw)
                }
                if currentTurn == numberOfTurn {
                    showingEndGame = true
                    let timesWin = myGameResults.filter{$0 == .win}.count
                    let timesLose = myGameResults.filter{$0 == .lose}.count
                    let timesDraw = myGameResults.filter{$0 == .draw}.count
                    resumeGame = "Ganaste \(timesWin) veces\nPerdiste \(timesLose) veces\nEmpataste \(timesDraw) veces\n"
                    myGameResults.removeAll()
                    
                } else {
                    textButton = "Proximo Turno"
                    evaluateTurn = false
                }
            }
        } else {
            playNextTurn()
            evaluateTurn = true
        }
    }
    
    func determineGameResult(userChoice: Option, appChoice: Option) -> GameResult {
        switch (userChoice, appChoice) {
        case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
            return .win
        case (.rock, .paper), (.paper, .scissors), (.scissors, .rock):
            return .lose
        default:
            return .draw
        }
    }
    
    func selectOption(_ option: Option) {
        if selectedOption == option {
            selectedOption = nil
        } else {
            selectedOption = option
        }
    }
    
    func continuePlaying() {
        showingSelectWeapon = false
        showingEndGame = false
    }
    
    func newGame() {
        continuePlaying()
        showingEndGame = false
        currentTurn = 0
        points = 0
        selectedOption = nil
        startWeapon = "🤔"
        startWeaponSystem = "❓"
    }
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack(alignment: .top){
                    Text("Mis puntos: \(points)").foregroundColor(Color.white)
                    Spacer()
                    Text("Turno \(currentTurn) / \(numberOfTurn)").foregroundColor(Color.white)
                }.padding(25)
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Vos").foregroundColor(Color.white)
                            .font(.system(size: 32))
                        Text("\(startWeapon)")
                            .font(.system(size: 84))
                    }
                    Spacer()
                    VStack{
                        Text("VS").foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        Text("APP").foregroundColor(Color.white)
                            .font(.system(size: 32))
                        Text("\(startWeaponSystem)")
                            .font(.system(size: 84))
                    }
                    Spacer()
                }
                Spacer()
                VStack{
                    HStack{
                        Spacer()
                        VStack{
                            Text("Seleccione su arma:")
                                .font(.system(size: 32))
                            HStack{
                                Button(action: {
                                    selectOption(.rock)
                                    startWeapon = "🪨"
                                }){
                                    Text("🪨")
                                        .font(.system(size: 64))
                                        .padding(15)
                                }
                                .border(selectedOption == .rock ? Color.blue : Color.clear, width: 4)
                                Button(action: {
                                    selectOption(.paper)
                                    startWeapon = "📃"
                                }){
                                    Text("📃")
                                        .font(.system(size: 64))
                                        .padding(15)
                                }
                                .border(selectedOption == .paper ? Color.yellow : Color.clear, width: 4)
                                Button(action: {
                                    selectOption(.scissors)
                                    startWeapon = "✂️"
                                }){
                                    Text("✂️")
                                        .font(.system(size: 64))
                                        .padding(15)
                                }.border(selectedOption == .scissors ? Color.red : Color.clear, width: 4)
                            }.padding([.bottom, .top], 15)
                        }
                        Spacer()
                    }
                    HStack{
                        Button(action: {
                            play()
                        })
                        {
                            Text(textButton)
                                .frame(maxWidth: .infinity)
                                .font(.system(size: 32))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(20)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding([.leading, .trailing], 30)
                        
                    }
                }.background(Color.gray)
            }
            .alert("Seleccione su arma", isPresented: $showingSelectWeapon) {
                Button("Continuar", action: continuePlaying)
            } message: {
                Text("La temida Piedra\nLa feroz Tijera\nO el simple pero astuto Papel")
            }
            .alert("Terminaste el Juego", isPresented: $showingEndGame) {
                Button("Nuevo juego", action: newGame)
            } message: {
                Text(resumeGame)
            }
            Image("backgroundImage2")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .zIndex(-1)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
