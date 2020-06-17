//
//  MoviewReviewRouter.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation

class MovieReviewRouter: MovieReviewRouterProtocol {
    static func initPresenter(vc: MovieDetailViewController) -> MovieReviewPresenterProtocol {
        let presenter: MovieReviewPresenterProtocol & MovieReviewInteractorOutputProtocol = MovieReviewPresenter()
        let interactor: MovieReviewInteractorInputProtocol = MovieReviewInteractor()
        let router: MovieReviewRouterProtocol = MovieReviewRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return presenter
    }
}
