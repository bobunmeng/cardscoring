//
//  PlayersViewModel.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import Foundation

class PlayersViewModel {
    
    var players: [Player] = [
        Player(id: 0, name: "Techhong", amount: 100),
        Player(id: 1, name: "Bunthorn", amount: -20),
        Player(id: 2, name: "Khouch", amount: 50),
        Player(id: 3, name: "Saven", amount: 30),
        Player(id: 4, name: "Runy", amount: -50),
        Player(id: 5, name: "Net", amount: -20)
    ]
    
    public func addPlayer(_ player: Player) {
        self.players.append(player)
    }
    
    public func updatePlayer(_ player: Player) {
        let index = self.players.firstIndex { $0.id == player.id }!
        self.players.remove(at: index)
        self.players.insert(player, at: index)
    }
    
    public func removePlayer(_ player: Player) {
        self.players.removeAll { $0.id == player.id }
    }
    
}
