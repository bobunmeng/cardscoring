//
//  PlayersDataSource.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

class PlayersDataSource: NSObject, UITableViewDataSource {
    
    var playersViewModel = PlayersViewModel()
    
    override init() {
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playersViewModel.players.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < self.playersViewModel.players.count {
            return cellForPlayerRow(tableView, player: self.playersViewModel.players[indexPath.row])
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerButtonCell") else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    private func cellForPlayerRow(_ tableView: UITableView, player: Player) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.cellIdentifier) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(player: player)
        return cell
    }
    
}
