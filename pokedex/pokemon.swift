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
    fileprivate var _nextEvolutionId: String!
    fileprivate var _nextEvolutionTxt: String!
    fileprivate var _nextEvolutionLvl: String!
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
    
    var description: String {
        get {
            return (_description != nil) ? _description : "?"
        }
    }
    
    var type: String {
        get {
            return (_type != nil) ? _type : "?"
        }
    }
    
    var height: String {
        get {
            return (_height != nil) ? _height : "?"
        }
    }
    
    var weight: String {
        get {
            return (_weight != nil) ? _weight : "?"
        }
    }
    
    var attack: String {
        get {
            return (_attack != nil) ? _attack : "?"
        }
    }
    
    var defense: String {
        get {
            return (_defense != nil) ? _defense : "?"
        }
    }
    
    var nextEvolutionId: String {
        get {
            return (_nextEvolutionId != nil) ? _nextEvolutionId : "?"
        }
    }
    
    var nextEvolutionName: String {
        get {
            return (_nextEvolutionTxt != nil) ? _nextEvolutionTxt : "?"
        }
    }
    
    var nextEvolutionLvl: String {
        get {
            return (_nextEvolutionLvl != nil) ? _nextEvolutionLvl : "?"
        }
    }
    
    //#MARK: Constructors
    init(name: String, pokedexId: Int) {
        self._name = name.capitalized
        self._pokedexId = pokedexId
        
        self._pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)/"
    }
    
    //#MARK: Functions
    func downloadPokemonDetails(completed: @escaping DownloadComplete) {
        //Request
        Alamofire.request(self._pokemonUrl).responseJSON { response in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                //weight
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                //height
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                //attack
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                //defense
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                //type
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
                
                //description
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        //Request
                        Alamofire.request("\(URL_BASE)\(url)").responseJSON(completionHandler: { response in
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    self._description = description
                                }
                            }
                            completed()
                        })
                    }

                } else {
                  self._description = "?"
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>], evolutions.count > 0 {
                    if let to = evolutions[0]["to"] as? String {
                        
                        //Not supporting mega pokemon right now
                        if to.range(of: "mega") == nil {
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let evoId = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "").replacingOccurrences(of: "/", with: "")
                                self._nextEvolutionId = evoId
                                self._nextEvolutionTxt = to
                                
                                if let lvl = evolutions[0]["level"] as? Int {
                                    self._nextEvolutionLvl = "\(lvl)"
                                } else {
                                    self._nextEvolutionLvl = "?"
                                }
                                
                                print("level: \(self._nextEvolutionLvl)")
                                print("id: \(self._nextEvolutionId)")
                                print("Name: \(self._nextEvolutionTxt)")
                            }
                        }
                    }
                    
                }

            }
            
        }
    }

}
