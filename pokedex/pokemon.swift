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
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _defense: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionTxt: String!
    
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
