//
//  SongsTableViewController.swift
//  Tema5-AppleMusic
//
//  Created by Ana Torres Piedra on 14/01/2019.
//  Copyright © 2019 Ana Torres. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {

    let idCell = "Song cell"
    let xibCell = "SongCell"
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: xibCell, bundle: nil), forCellReuseIdentifier: idCell)
    
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! SongCell

        cell.id.text = "\(indexPath.row + 1)"
        cell.song.text = songs[indexPath.row].name
        cell.artist.text = songs[indexPath.row].artist
        
        return cell
    }

}
