//
//  PokemonCSVParser.swift
//  Pokedex
//
//  Created by dvt on 2017/11/02.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation

class PokemonCSVParser: Parser {
    private var _pokemons = [Pokemon]()
    
    var pokemons: [Pokemon] {
        get{
            self.parse()
            return _pokemons
        }
    }
    
    func parse() {
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            rows.forEach({ row in
                let pokemonId = Int(row["id"]!)!
                let pokemonName = row["identifier"]
                let pokemon = Pokemon(name: pokemonName!, pokedexId: pokemonId)
                _pokemons.append(pokemon)
            })
        } catch let err  as NSError {
            print(err.debugDescription)
        }
    }
}
