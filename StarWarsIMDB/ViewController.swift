//
//  ViewController.swift
//  StarWarsIMDB
//
//  Created by Daniel Leivers on 05/08/2018.
//  Copyright © 2018 Otaku. All rights reserved.
//

import UIKit

class FilmListViewController: UIViewController {
    
    fileprivate var allFilms: [AllFilmTitlesQuery.Data.AllFilm.Film?]?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        apollo.fetch(query: AllFilmTitlesQuery()) { [weak self] result, error in
            self?.allFilms = result?.data?.allFilms?.films
        }
    }
}


