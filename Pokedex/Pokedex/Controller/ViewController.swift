//
//  ViewController.swift
//  Pokedex
//
//  Created by dvt on 2017/10/31.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    private var pokemons = [Pokemon]()
    private var musicPlayer:AVAudioPlayer!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    private var inSearchMode = false
    private var filteredPokemons = [Pokemon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let pokemonCSVParser = PokemonCSVParser()
        pokemons = pokemonCSVParser.pokemons
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        configureAudioPlayer()
    }
    
    @IBAction func onMusicButtonPressed(_ sender: Any) {
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            (sender as! UIButton).alpha = 0.3
        } else {
            musicPlayer.play()
            (sender as! UIButton).alpha = 1.0
        }
    }
    
    func configureAudioPlayer(){
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        do{
            let url = URL(string: path)!
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonDetailVC" {
            if let pokemonDetailVC = segue.destination as? PokemonDetailVC {
                if let pokemon = sender as? Pokemon {
                    pokemonDetailVC.pokemon = pokemon
                }
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if inSearchMode {
            return filteredPokemons.count
        }
        return pokemons.count
    }
    
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCell {
            var pokemon:Pokemon!
            if inSearchMode {
                pokemon = filteredPokemons[indexPath.row]
            }else{
                pokemon = pokemons[indexPath.row]
            }
            cell.configurCell(with: pokemon)
            return cell
        }
        return UICollectionViewCell()
    }
    
}
extension ViewController: UICollectionViewDelegate{
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var pokemon: Pokemon!
        if inSearchMode {
            pokemon = filteredPokemons[indexPath.row]
        }else {
            pokemon = pokemons[indexPath.row]
        }
        performSegue(withIdentifier: "PokemonDetailVC", sender: pokemon)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 120)
    }
}

extension ViewController: UISearchBarDelegate {

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if (searchBar.text?.isEmpty)! || searchBar.text == nil {
            inSearchMode = false
            collectionView.reloadData()
        }else{
            inSearchMode = true
            let searchTextLowerCased = searchBar.text?.lowercased()
            filteredPokemons = pokemons.filter({ $0.name.range(of: searchTextLowerCased!) != nil})
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text?.isEmpty)! || searchBar.text == nil {
            inSearchMode = false
            collectionView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            let searchTextLowerCased = searchBar.text?.lowercased()
            filteredPokemons = pokemons.filter({ $0.name.range(of: searchTextLowerCased!) != nil})
            collectionView.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

