//
//  MoviesListPresenter.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation

class MoviesListPresenter: MoviesListPresenterProtocol {
    var view: MoviesListViewProtocol?
    
    var interactor: MoviesListInteractorInputProtocol?
    
    var router: MoviesListRouterProtocol?
    
    func fetchMoviesList(filter: String) {
        interactor?.callRequest(filter: filter)
    }
}

extension MoviesListPresenter: MoviesListInteractorOutputProtocol {
    func requestSuccess(data: MoviesListModel?) {
        if let data = data {
            view?.getData(data: data)
        }
    }
    
    func requestFailed() {
        view?.getError()
    }
}
