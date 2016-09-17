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
    fileprivate var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    //#MARK: Public Functions
    func configureCell(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedexId)")
    }
}
