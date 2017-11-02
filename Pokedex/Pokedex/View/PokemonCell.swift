//
//  PokemonCell.swift
//  Pokedex
//
//  Created by dvt on 2017/11/02.
//  Copyright © 2017 dvt. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    var pokemon: Pokemon!
    
    func configurCell(with pokemon: Pokemon){
        self.pokemon = pokemon
        self.thumbnailImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        self.nameLabel.text = self.pokemon.name
    }
}
