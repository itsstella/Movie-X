//
//  MovieDetailViewController.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var ivBanner: UIImageView!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblPopularity: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var ivHeart: UIButton!
    @IBOutlet weak var btnOverview: UIButton!
    @IBOutlet weak var btnReview: UIButton!
    
    @IBOutlet weak var viewOverview: UIView!
    @IBOutlet weak var viewReview: UIView!
    @IBOutlet weak var tableViewReview: UITableView!
    
    var presenterDetail: MovieDetailPresenterProtocol?
    var presenterReview: MovieReviewPresenterProtocol?
    
    var id = ""
    var movie = ""
    var review: MovieReviewModel?
    var detail: MovieDetailModel?
    
    override func viewDidLoad() {
        
        self.title = movie
        
        presenterDetail = MovieDetailRouter.initPresenter(vc: self)
        presenterDetail?.fetchMovieDetail(id: id )
        
        viewOverview.isHidden = false
        viewReview.isHidden = true
        
        if (UserDefaults.standard.stringArray(forKey: id) != nil) {
            ivHeart.setImage(UIImage(named: "ic_love"), for: .normal)
        }
    }
    
    @IBAction func btnOverviewClicked(_ sender: Any) {
        viewOverview.isHidden = false
        viewReview.isHidden = true
        btnOverview.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 70/255, green: 118/255, blue: 162/255, alpha: 1))
        btnReview.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func btnReviewClicked(_ sender: Any) {
        viewOverview.isHidden = true
        viewReview.isHidden = false
        btnOverview.backgroundColor = UIColor.lightGray
        btnReview.backgroundColor = UIColor(cgColor: CGColor(srgbRed: 70/255, green: 118/255, blue: 162/255, alpha: 1))
    }
    
    @IBAction func ivHeartClicked(_ sender: Any) {
        if (UserDefaults.standard.stringArray(forKey: id) == nil) {
            ivHeart.setImage(UIImage(named: "ic_love"), for: .normal)
            UserDefaults.standard.set([id, detail?.title ?? "", detail?.release_date ?? "", detail?.overview ?? "", detail?.poster_path ?? ""], forKey: id)
        } else {
            ivHeart.setImage(UIImage(named: "ic_unlove"), for: .normal)
            UserDefaults.standard.removeObject(forKey: id)

        }
    }
}

extension MovieDetailViewController: MovieDetailViewProtocol {
    func getData(data: MovieDetailModel) {
        
        detail = data
        
        let string1 = Constants.MOVIE_THUMBNAIL_BASE_URL_EXTRA_LARGE
        var string2 = data.backdrop_path ?? ""
        ivBanner.kf.setImage(with: URL(string: string1+string2))
        
        string2 = data.poster_path ?? ""
        ivPoster.kf.setImage(with: URL(string: string1+string2))
        
        lblTitle.text = data.title ?? ""
        
        lblGenre.text = data.genres?[0].name
        lblDate.text = data.release_date
        lblPopularity.text = String(format:"%.2f", data.popularity ?? 0.0)
        
        lblOverview.text = data.overview
        
        presenterReview = MovieReviewRouter.initPresenter(vc: self)
        presenterReview?.fetchMovieReview(id: id )
    }
    
    func getError() {
        
    }
}

extension MovieDetailViewController: MovieReviewViewProtocol {
    func getData(data: MovieReviewModel) {
        self.review = data
        tableViewReview.reloadData()
    }
}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        review?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "reviewCell")
        
        (cell as! MovieReviewTableViewCell).lblName.text =  review?.results?[indexPath.row].author
        (cell as! MovieReviewTableViewCell).lblComment.text =  review?.results?[indexPath.row].content
        
        
        return cell ?? UITableViewCell()
    }
    
    
}
