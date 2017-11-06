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
        print(_pokemon.name)
        print(_pokemon.pokedexId)
    }
}
