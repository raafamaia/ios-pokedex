//
//  DetailViewController.swift
//  pokedex
//
//  Created by R. Maia on 9/18/16.
//  Copyright © 2016 RM. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //#MARK: @IBOutlets
    @IBOutlet weak var nameLbl: UILabel!
    
    //#MARK: Properties
    var pokemon: Pokemon!
    
    //#MARK: Events
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
    }
}
