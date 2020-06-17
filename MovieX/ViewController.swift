//
//  ViewController.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 16/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MoviesListPresenterProtocol?
    var listMovies : MoviesListModel?
    var id: String?
    var movie: String?
    
    @IBOutlet weak var viewPicker: UIView!
    @IBOutlet weak var btnCategory: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        presenter = MoviesListRouter.initPresenter(vc: self)
        presenter?.fetchMoviesList(filter: "popular")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "FAVE", style: .plain, target: self, action: #selector(buttonTapped))

    }
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: CGColor(srgbRed: 70/255, green: 118/255, blue: 162/255, alpha: 1))
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.title = "MOVIE-X"
        
        btnCategory.layer.shadowColor = UIColor.gray.cgColor
        btnCategory.layer.shadowOpacity = 1
        btnCategory.layer.shadowOffset = .zero
        btnCategory.layer.shadowRadius = 5
        
        viewPicker.layer.shadowColor = UIColor.gray.cgColor
        viewPicker.layer.shadowOpacity = 1
        viewPicker.layer.shadowOffset = .zero
        viewPicker.layer.shadowRadius = 5
        
        self.viewPicker.isHidden = true
    }
    
    @objc func buttonTapped(_ sender : UIButton){
        self.performSegue(withIdentifier: "toFavorites", sender: self)
    }
    
    @IBAction func btnCategoryClicked(_ sender: Any) {
        self.viewPicker.isHidden = false
    }
    
    @IBAction func btnPopularClicked(_ sender: Any) {
        presenter?.fetchMoviesList(filter: "popular")
        self.viewPicker.isHidden = true
    }
    
    @IBAction func btnUpcomingClicked(_ sender: Any) {
        presenter?.fetchMoviesList(filter: "upcoming")
        self.viewPicker.isHidden = true
    }
    
    @IBAction func btnTopRatedClicked(_ sender: Any) {
        presenter?.fetchMoviesList(filter: "top_rated")
        self.viewPicker.isHidden = true
    }
    
    @IBAction func btnNowPlayingClicked(_ sender: Any) {
        presenter?.fetchMoviesList(filter: "now_playing")
        self.viewPicker.isHidden = true
    }
    
    @IBAction func btnCancelCategory(_ sender: Any) {
        self.viewPicker.isHidden = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "toDetail") {
        let vc : MovieDetailViewController = segue.destination as! MovieDetailViewController
        vc.id = id ?? ""
        vc.movie = movie ?? ""
          }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listMovies?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "MovieCell")

           if (cell == nil) {
               cell = MovieListTableViewCell()
           }

        let string1 = Constants.MOVIE_THUMBNAIL_BASE_URL_EXTRA_LARGE
        let string2 = listMovies?.results?[indexPath.row].posterPath ?? ""
        (cell as! MovieListTableViewCell).ivPoster.kf.setImage(with: URL(string: string1+string2))
        
        (cell as! MovieListTableViewCell).lblTitle.text = listMovies?.results?[indexPath.row].title

        (cell as! MovieListTableViewCell).lblReleaseDate.text = listMovies?.results?[indexPath.row].releaseDate
        
        (cell as! MovieListTableViewCell).lblDescription.text = listMovies?.results?[indexPath.row].overview
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        id = String(listMovies?.results?[indexPath.row].id ?? 0)
        movie = listMovies?.results?[indexPath.row].title
        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
}

extension ViewController: MoviesListViewProtocol {
    func getData(data: MoviesListModel) {
        listMovies = data
        tableView.reloadData()
    }
    
    func getError() {
        
    }
}
