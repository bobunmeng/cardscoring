//
//  PlayersViewController.swift
//  CardScore
//
//  Created by Bo Bunmeng on 13/7/20.
//  Copyright © 2020 Bo Bunmeng. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let dataSource = PlayersDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setUp()
    }
    
    private func setUp() {
        self.tableView.register(UINib(nibName: "PlayerTableViewCell", bundle: nil), forCellReuseIdentifier: PlayerTableViewCell.cellIdentifier)
        self.tableView.delegate = self
        self.tableView.dataSource = dataSource
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.reloadData()
    }

}

extension PlayersViewController: PlayerDelegate {
    func onAdd(_ player: Player) {
        self.dataSource.playersViewModel.addPlayer(player)
        self.tableView.reloadData()
    }
    
    func onUpdate(_ player: Player) {
        self.dataSource.playersViewModel.updatePlayer(player)
        self.tableView.reloadData()
    }
    
    func onDelete(_ player: Player) {
        self.dataSource.playersViewModel.removePlayer(player)
        self.tableView.reloadData()
    }
}

extension PlayersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let isLastRow = indexPath.row == tableView.numberOfRows(inSection: 0) - 1
        if isLastRow {
            self.displayAddPersonVC()
            return
        }
        
        self.displayAddPersonVC(with: self.dataSource.playersViewModel.players[indexPath.row])
    }
    
    private func displayAddPersonVC(with player: Player? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let addPlayerVC = storyboard.instantiateViewController(identifier: "AddPlayerViewController") as? AddPlayerViewController
            else { return }
        addPlayerVC.delegate = self
        addPlayerVC.player = player
        self.present(addPlayerVC, animated: true, completion: nil)
    }
    
}
