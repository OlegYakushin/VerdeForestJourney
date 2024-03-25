//
//  SecondGameModel.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/25/24.
//

import SwiftUI

struct Card: Identifiable {
    let id: UUID = UUID()
    var iconName: String
    var isFaceUp: Bool = false
    var isMatched: Bool = false
}

class GameModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var isGameWon: Bool = false
    @Published var elapsedTime: TimeInterval = 0
    @Published var bestTime: TimeInterval = .infinity
    var timer: Timer?
    
    func startNewGame() {
        let icons = ["mug", "fishGreen", "boot", "fishOrange", "clover", "hat", "fishPurple", "pipe"]
        let shuffledIcons = (icons + icons).shuffled()
        cards = shuffledIcons.map { Card(iconName: $0) }
        isGameWon = false
        elapsedTime = 0
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.elapsedTime += 1
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func choose(card: Card) {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
              !cards[chosenIndex].isFaceUp,
              !cards[chosenIndex].isMatched else {
            return
        }
        if let potentialMatchIndex = cards.indices.first(where: { $0 != chosenIndex && cards[$0].isFaceUp && cards[$0].iconName == cards[chosenIndex].iconName }) {
            cards[chosenIndex].isMatched = true
            cards[potentialMatchIndex].isMatched = true
        } else {
            if let indexOfTheOnlyFaceUpCard = cards.firstIndex(where: { $0.isFaceUp && !$0.isMatched }) {
                cards[indexOfTheOnlyFaceUpCard].isFaceUp = false
            }
        }
        cards[chosenIndex].isFaceUp = true
        if cards.allSatisfy({ $0.isMatched }) {
            isGameWon = true
            if elapsedTime < bestTime {
                bestTime = elapsedTime
                print(bestTime)
            }
        }
    }
}
