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
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var pokedexIdLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var bonusAttackLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    @IBOutlet weak var evoLabel: UIView!
    
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
    }
    
    @IBAction func onBackButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
