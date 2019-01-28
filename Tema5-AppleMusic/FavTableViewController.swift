//
//  FavTableViewController.swift
//  Tema5-AppleMusic
//
//  Created by Ana Torres Piedra on 14/01/2019.
//  Copyright © 2019 Ana Torres. All rights reserved.
//

import UIKit

class FavTableViewController: UITableViewController {
    
    let idCell = "Song cell"
    let xibCell = "SongCell"
    var favsongs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: xibCell, bundle: nil), forCellReuseIdentifier: idCell)
        favsongs = [Song]()
        favsongs.append(Song(name: "Ibiza", artist: "Ozuna, Romeo Santos"))
        favsongs.append(Song(name: "Imposible", artist: "Luis Fonsi, Ozuna"))
        favsongs.append(Song(name: "Clandestino", artist: "Shakira, Maluma"))
        favsongs.append(Song(name: "Solo", artist: "Clean Bandit, Demi Lovato"))
        favsongs.append(Song(name: "Friends", artist: "Marshmaello, Anne-Marie"))
        favsongs.append(Song(name: "IDGAF", artist: "Dua Lipa"))
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favsongs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath) as! SongCell
        
        cell.id.text = "\(indexPath.row + 1)"
        cell.song.text = favsongs[indexPath.row].name
        cell.artist.text = favsongs[indexPath.row].artist
        
        return cell
    }
 
}
