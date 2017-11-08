//
//  Pokemon.swift
//  Pokedex
//
//  Created by dvt on 2017/10/31.
//  Copyright © 2017 dvt. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _height: String!
    private var _weight: String!
    private var _experience: String!
    private var _nextEvolution: String!
    private var _pokemonURL: String!
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var experience: String {
        if _experience == nil {
            _experience = ""
        }
        return _experience
    }
    
    var nextEvolution: String {
        if _nextEvolution == nil {
            _nextEvolution = ""
        }
        return _nextEvolution
    }
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func pokemonDownloadCompleted(_ completed: @escaping DownloadComplete){
        Alamofire.request(self._pokemonURL).responseJSON(completionHandler: {
            (_ response: DataResponse?) in
            if let response = response {
                if let dict = response.result.value as? Dictionary<String,Any> {
                    if let height = dict["height"] as? Int {
                        self._height = "\(height)"
                    }
                    
                    if let weight = dict["weight"] as? Int {
                        self._weight = "\(weight)"
                    }
                    
                    if let baseExperience = dict["base_experience"] as? Int {
                        self._experience = "\(baseExperience)"
                    }
                    
                    if let types = dict["types"] as? Array<Dictionary<String,Any>?> {
                        if let firstType = types[0] {
                            if let type = firstType["type"] as? Dictionary<String,Any> {
                                if let typeName = type["name"] as? String {
                                    self._type = typeName
                                }
                            }
                        }
                    }
                    completed()
                }
            }else{
                // Do something to handle this
            }
        })
    }
}
