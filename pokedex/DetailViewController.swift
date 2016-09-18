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

    //#MARK: Properties
    var pokemon: Pokemon!
    
    //#MARK: Events
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setMusicBtn()
    }
    
    //#MARK: Functions
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
