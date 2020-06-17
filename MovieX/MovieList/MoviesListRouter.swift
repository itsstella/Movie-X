//
//  MoviesListRouter.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation

class MoviesListRouter: MoviesListRouterProtocol {
    static func initPresenter(vc: ViewController) -> MoviesListPresenterProtocol {
        let presenter: MoviesListPresenterProtocol & MoviesListInteractorOutputProtocol = MoviesListPresenter()
        let interactor: MoviesListInteractorInputProtocol = MoviesListInteractor()
        let router: MoviesListRouterProtocol = MoviesListRouter()
        
        presenter.view = vc
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        return presenter
    }
}
