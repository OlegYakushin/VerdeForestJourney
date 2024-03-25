//
//  FirstGameModel.swift
//  VerdeForestJourney
//
//  Created by Oleg Yakushin on 3/25/24.
//

import SwiftUI

struct CardFirst: Identifiable {
    let id: UUID = UUID()
    var iconName: String
    var isHighlighted: Bool = false
}

class GameFirstModel: ObservableObject {
    @Published var cards: [[CardFirst]] = []
    @Published var score: Int = 100000
    
    init() {
        distributeIcons()
    }
    func distributeIcons() {
        let icons = ["mug", "boot", "fishOrange", "clover", "hat", "pipe"]
        var shuffledIcons = (icons + icons).shuffled()
        
        cards = []
        for _ in 0..<4 {
            var row: [CardFirst] = []
            let matchingIcon = shuffledIcons.removeFirst()
            let otherIcon = shuffledIcons.randomElement()!
            for _ in 0..<3 {
                let iconName = Bool.random() ? matchingIcon : otherIcon
                row.append(CardFirst(iconName: iconName))
            }
            cards.append(row)
        }
    }
    
    func startNewGame() {
        let icons = ["mug", "boot", "fishOrange", "clover", "hat", "pipe"]
        var shuffledIcons = (icons + icons).shuffled()
        
        cards = []
        for _ in 0..<4 {
            var row: [CardFirst] = []
            let matchingIcon = shuffledIcons.removeFirst()
            let otherIcon = shuffledIcons.randomElement()!
            for _ in 0..<3 {
                let iconName = Bool.random() ? matchingIcon : otherIcon
                row.append(CardFirst(iconName: iconName))
            }
            cards.append(row)
        }
        spinIcons()
    }
    
    func spinIcons() {
        DispatchQueue.global().async {
            for _ in 0..<3 {
                DispatchQueue.main.async {
                    self.shuffleCards()
                }
                Thread.sleep(forTimeInterval: 0.5)
            }
            DispatchQueue.main.async {
                self.stopSpinning()
            }
            DispatchQueue.main.async {
                self.score -= 500
            }
        }
    }
    
    func shuffleCards() {
        cards = cards.map { row in
            row.shuffled()
        }
    }
    
    func stopSpinning() {
        for i in 0..<cards.count {
            let row = cards[i]
            if row[0].iconName == row[1].iconName && row[1].iconName == row[2].iconName {
                for j in 0..<row.count {
                    cards[i][j].isHighlighted = true
                }
                score += 1000
            }
        }
    }
}
