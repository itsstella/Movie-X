//
//  MovieReviewProtocol.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import UIKit

protocol MovieReviewPresenterProtocol: class{
    var view: MovieReviewViewProtocol? { get set }
    var interactor: MovieReviewInteractorInputProtocol? { get set }
    var router: MovieReviewRouterProtocol? { get set }
    func fetchMovieReview(id: String)

}

protocol MovieReviewViewProtocol: class {
    func getData(data: MovieReviewModel)
    func getError()
}

protocol MovieReviewInteractorOutputProtocol: class {
    func requestSuccess(data: MovieReviewModel?)
    func requestFailed()
}

protocol MovieReviewInteractorInputProtocol: class {
    var presenter: MovieReviewInteractorOutputProtocol? { get set }
    func callRequest(id: String)
}

protocol MovieReviewRouterProtocol: class {
    static func initPresenter(vc: MovieDetailViewController) -> MovieReviewPresenterProtocol
}
