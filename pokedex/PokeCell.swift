//
//  PokeCell.swift
//  pokedex
//
//  Created by R. Maia on 9/11/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    //#MARK: IBOutlets
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    //#MARK: Private Attributes
    private var pokemon: Pokemon!
    
    //#MARK: Public Functions
    func configureCell(pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
