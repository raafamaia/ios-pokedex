//
//  pokemon.swift
//  pokedex
//
//  Created by R. Maia on 9/11/16.
//  Copyright © 2016 RM. All rights reserved.
//

import Foundation

class Pokemon {
    
    //#MARK: Private Atributes
    fileprivate var _name: String!
    fileprivate var _pokedexId: Int!
    
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
    }

}
