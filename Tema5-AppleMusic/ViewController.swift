//
//  ViewController.swift
//  Tema5-AppleMusic
//
//  Created by Ana Torres Piedra on 11/01/2019.
//  Copyright © 2019 Ana Torres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainCollection: UICollectionView!
    var items: [Playlist]?
    var xibCell = "PlayListCell"
    var reuseIdentifier = "playCell" //identifier del PlayListCell

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainCollection.delegate = self
        mainCollection.dataSource = self
        
        mainCollection.backgroundColor = UIColor.white
        mainCollection.alwaysBounceVertical = true
        
        mainCollection?.register(UINib(nibName: xibCell, bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        
        initItems()

    }
    
    func initItems(){
        
        var songs1 = [Song]()
        songs1.append(Song(name: "Ibiza", artist: "Ozuna, Romeo Santos"))
        songs1.append(Song(name: "Imposible", artist: "Luis Fonsi, Ozuna"))
        songs1.append(Song(name: "Clandestino", artist: "Shakira, Maluma"))
        songs1.append(Song(name: "Solo", artist: "Clean Bandit, Demi Lovato"))
        songs1.append(Song(name: "Friends", artist: "Marshmaello, Anne-Marie"))
        songs1.append(Song(name: "IDGAF", artist: "Dua Lipa"))
        
        var songs2 = [Song]()
        songs2.append(Song(name: "Con las ganas", artist: "Zahara"))
        songs2.append(Song(name: "Sinmigo", artist: "Mr. Kilombo"))
        songs2.append(Song(name: "Un día de estos", artist: "Marwan"))
        songs2.append(Song(name: "The Scientist", artist: "Bely Basarte"))
        songs2.append(Song(name: "Vuelves", artist: "Rozalén"))
        songs2.append(Song(name: "23 de Junio", artist: "Vetusta Morla"))
        
        var songs3 = [Song]()
        songs3.append(Song(name: "Adán y Eva", artist: "Paulo Londra"))
        songs3.append(Song(name: "Ni bien ni mal", artist: "Bad Bunny"))
        songs3.append(Song(name: "MALA (feat. Anuel Aa)", artist: "6ix9ine, Anuel Aa"))
        songs3.append(Song(name: "Calma", artist: "Pedro Capó, Farruko"))
        songs3.append(Song(name: "Adictiva", artist: "Daddy Yankee, Anuel Aa"))
        songs3.append(Song(name: "Ella Quiere Beber - Remix", artist: "Anuel Aa, Romeo Santos"))
        
        items = [Playlist]()
        items?.append(Playlist(title: "Finde",image: "p0.jpeg", songs: songs1))
        items?.append(Playlist(title: "Invierno", image: "p1.jpeg", songs: songs2))
        items?.append(Playlist(title: "Top 50", image: "p2.jpeg", songs: songs3))
        items?.append(Playlist(title: "Reggaeton", image: "p3.jpeg", songs: songs1))
        items?.append(Playlist(title: "Verano", image: "p4.jpeg", songs: songs2))
        items?.append(Playlist(title: "2018", image: "p5.jpeg", songs: songs3))
        items?.append(Playlist(title: "In the car", image: "p6.jpeg", songs: songs1))
        items?.append(Playlist(title: "Acoustic", image: "p7.jpeg", songs: songs2))
        items?.append(Playlist(title: "Bonitas", image: "p8.jpeg", songs: songs3))
        items?.append(Playlist(title: "Viral", image: "p9.jpeg", songs: songs1))
        
        mainCollection.reloadData()
        mainCollection.collectionViewLayout.invalidateLayout()
        
    }

}



extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PlayListCell
        
        cell.setUpViews()
        
        cell.title.text = self.items?[indexPath.row].title
        cell.img.image = UIImage(named: self.items?[indexPath.row].image ?? "")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            performSegue(withIdentifier: "SongList", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SongList"{
            
            let destViewController = segue.destination as! SongsTableViewController
           
            if let itemIndex = mainCollection.indexPathsForSelectedItems?.first?.item {
                let selectedItem = self.items?[itemIndex]
                destViewController.songs =  selectedItem!.songs
            }
        
        }
    }
    
    func collectionView(_ c0ollectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width, height: width)
    }
    
    // Realizo un calculo para saber que dimensiones tienen que tener las celdas
    func calculateWith() -> CGFloat {
        let estimateWidth = 160.0
        let cellMarginSize = 15.0
        
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize - 9) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
    
}

