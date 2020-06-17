//
//  MovieReviewPresenter.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation

class MovieReviewPresenter: MovieReviewPresenterProtocol {
    var view: MovieReviewViewProtocol?
    
    var interactor: MovieReviewInteractorInputProtocol?
    
    var router: MovieReviewRouterProtocol?
    
    func fetchMovieReview(id: String) {
        interactor?.callRequest(id: id)
    }
}

extension MovieReviewPresenter: MovieReviewInteractorOutputProtocol {
    func requestSuccess(data: MovieReviewModel?) {
        if let data = data {
            view?.getData(data: data)
        }
    }
    
    func requestFailed() {
        view?.getError()
    }
}
