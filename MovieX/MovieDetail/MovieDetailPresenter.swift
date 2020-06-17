//
//  MovieDetailPresenter.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
    var view: MovieDetailViewProtocol?
    
    var interactor: MovieDetailInteractorInputProtocol?
    
    var router: MovieDetailRouterProtocol?
    
    func fetchMovieDetail(id: String) {
        interactor?.callRequest(id: id)
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    func requestSuccess(data: MovieDetailModel?) {
        if let data = data {
            view?.getData(data: data)
        }
    }
    
    func requestFailed() {
        view?.getError()
    }
}
