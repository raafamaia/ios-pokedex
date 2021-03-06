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
    @IBOutlet weak var musicBtn: UIButton!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var pokeIdLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!

    //#MARK: Properties
    var pokemon: Pokemon!
    
    //#MARK: Events
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        
        pokemon.downloadPokemonDetails {
            //this will be called after downloading a pokemon
            self.updateUI()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setMusicBtn()
    }
    
    //#MARK: Functions
    func updateUI(){
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.height
        attackLbl.text = pokemon.attack
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        evoLbl.text = "\(pokemon.nextEvolutionName)"
        pokeIdLbl.text = " \(pokemon.pokedexId)"
        
        if pokemon.nextEvolutionId == "?" {
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLvl)"
        }
        
        
        
        
    }
    
    func setMusicBtn() {
        if AudioService.Instance.isPlaying {
            musicBtn.alpha = 1.0
        } else {
            musicBtn.alpha = 0.2
        }
    }
    
    //#MARK: @IBActions
    @IBAction func musicBtnPressed(_ sender: AnyObject) {
        if AudioService.Instance.isPlaying {
            AudioService.Instance.stop()
        }else {
            AudioService.Instance.play()
        }
        
        setMusicBtn()
    }
    
    @IBAction func backBtnPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
}
