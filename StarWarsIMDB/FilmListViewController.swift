//
//  ViewController.swift
//  StarWarsIMDB
//
//  Created by Daniel Leivers on 05/08/2018.
//  Copyright © 2018 Otaku. All rights reserved.
//

import UIKit

class FilmListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    fileprivate var selectedIndexPath: IndexPath?
    
    fileprivate var allFilms: [AllFilmTitlesQuery.Data.AllFilm.Film?]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apollo.fetch(query: AllFilmTitlesQuery()) { [weak self] result, error in
            self?.allFilms = result?.data?.allFilms?.films?.filter({ film -> Bool in
                guard let filmId = film?.id.graphQLIdentifier() else { return false }
                return Int(filmId)! < 4
            })
            self?.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? FilmDetailViewController,
            let row = selectedIndexPath?.row,
            let filmId = allFilms?[row]?.id.graphQLIdentifier() {
            destination.filmId = filmId
        }
    }
}

extension FilmListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allFilms?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmTableViewCell", for: indexPath) as! FilmTableViewCell
        cell.titleLabel.text = allFilms?[indexPath.row]?.title
        return cell
    }
}

extension FilmListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: "showFilmDetail", sender: self)
    }
}

