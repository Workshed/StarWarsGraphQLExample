//
//  FilmDetailViewController.swift
//  StarWarsIMDB
//
//  Created by Daniel Leivers on 28/08/2018.
//  Copyright © 2018 Otaku. All rights reserved.
//

import UIKit

class FilmDetailViewController: UIViewController {

    var filmId: String?
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var crawlLabel: UILabel!
    private var characters: [FilmDetailQuery.Data.Film.CharacterConnection.Character?]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let filmId = filmId else { return }
        apollo.fetch(query: FilmDetailQuery(filmID: filmId)) { [weak self] result, error in
            self?.titleLabel.text = result?.data?.film?.title
            self?.crawlLabel.text = result?.data?.film?.openingCrawl
            self?.characters = result?.data?.film?.characterConnection?.characters
            self?.tableView.reloadData()
        }
    }
}

extension FilmDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterTableViewCell", for: indexPath) as! CharacterTableViewCell
        cell.characterNameLabel.text = characters?[indexPath.row]?.name
        cell.homeworldNameLabel.text = characters?[indexPath.row]?.homeworld?.name
        return cell
    }
}
