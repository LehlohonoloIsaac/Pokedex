//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by dvt on 2017/11/06.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    private var _pokemon: Pokemon!
    
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UIView!
    @IBOutlet weak var experienceLabel: UILabel!
    
    var pokemon: Pokemon {
        set{
            _pokemon = newValue
        }
        get{
            return _pokemon
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeUI()
        pokemon.pokemonDownloadCompleted({
                self.updateUI()
        })
    }
    
    func initializeUI() {
        pokemonNameLabel.text = pokemon.name
        mainImage.image = UIImage(named: "\(pokemon.pokedexId)")
        currentEvoImage.image = UIImage(named: "\(pokemon.pokedexId)")
    }
    
    func updateUI(){
        typeLabel.text = pokemon.type
        heightLabel.text = pokemon.height
        weightLabel.text = pokemon.weight
        experienceLabel.text = pokemon.experience
        if !pokemon.nextEvolution.isEmpty {
              nextEvoImage.image = UIImage(named: pokemon.nextEvolution)
            nextEvoImage.contentMode = .scaleAspectFit
        }else{
            nextEvoImage.isHidden = true
        }
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
