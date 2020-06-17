//
//  MovieDetailRouter.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation

class MovieDetailRouter: MovieDetailRouterProtocol {
    static func initPresenter(vc: MovieDetailViewController) -> MovieDetailPresenterProtocol {
        let presenter: MovieDetailPresenterProtocol & MovieDetailInteractorOutputProtocol = MovieDetailPresenter()
        let interactor: MovieDetailInteractorInputProtocol = MovieDetailInteractor()
        let router: MovieDetailRouterProtocol = MovieDetailRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return presenter
    }
}
