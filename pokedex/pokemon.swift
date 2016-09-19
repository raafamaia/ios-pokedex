//
//  pokemon.swift
//  pokedex
//
//  Created by R. Maia on 9/11/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    //#MARK: Private Atributes
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _defense: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionTxt: String!
    fileprivate var _pokemonUrl: String!
    
    //#MARK: Getters/Setters
    var name: String {
        get {
            return _name
        }
    }
    
    var pokedexId: Int {
        get {
            return _pokedexId
        }
    }
    
    //#MARK: Constructors
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    func downloadPokemonDetails(completed: DownloadComplete) {
        
        Alamofire.request(self._pokemonUrl).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>], types.count > 0 {
                    self._type = ""
                    
                    for (index, type) in types.enumerated() {
                        if let name = type["name"] {
                            if index == 0 {
                                self._type = name.capitalized
                            } else {
                                self._type.append("/\(name.capitalized)")
                            }
                        }
                    }
                } else {
                    self._type = "?"
                }

            }
            
        }
    }

}
