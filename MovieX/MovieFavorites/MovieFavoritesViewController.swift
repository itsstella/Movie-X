//
//  MovieFavoritesViewController.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

class MovieFavoritesViewController: UIViewController {
    var arrayKey:[String] = []
    @IBOutlet weak var tableView: UITableView!
    var id: String?
    var movie: String?
    var flagBack = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FAVORITES"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let arrFavorite = UserDefaults.standard.dictionaryRepresentation().keys

        arrayKey = []
        for i in arrFavorite {
            if i.count == 6 {
                arrayKey.append(i)
            }
        }
        
        flagBack = false
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "toDetail") {
        let vc : MovieDetailViewController = segue.destination as! MovieDetailViewController
        vc.id = id ?? ""
        vc.movie = movie ?? ""
          }
    }
}

extension MovieFavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (!flagBack) {
            return arrayKey.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (!flagBack) {
            var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MovieCell")
            
            if (cell == nil) {
                cell = MovieListTableViewCell()
            }
            
            let data = UserDefaults.standard.stringArray(forKey: arrayKey[indexPath.row]) ?? [String]()


            let string1 = Constants.MOVIE_THUMBNAIL_BASE_URL_EXTRA_LARGE
            let string2 = data[4]
            (cell as! MovieListTableViewCell).ivPoster.kf.setImage(with: URL(string: string1+string2))

            (cell as! MovieListTableViewCell).lblTitle.text = data[1]

            (cell as! MovieListTableViewCell).lblReleaseDate.text = data[2]

            (cell as! MovieListTableViewCell).lblDescription.text = data[3]
                   
            return cell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = UserDefaults.standard.stringArray(forKey: arrayKey[indexPath.row]) ?? [String]()
        
        id = data[0]
        movie = data[1]
        self.performSegue(withIdentifier: "toDetail", sender: self)
        flagBack = true
    }
}
