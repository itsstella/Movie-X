//
//  MovieDetailProtocol.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailPresenterProtocol: class{
    var view: MovieDetailViewProtocol? { get set }
    var interactor: MovieDetailInteractorInputProtocol? { get set }
    var router: MovieDetailRouterProtocol? { get set }
    func fetchMovieDetail(id: String)

}

protocol MovieDetailViewProtocol: class {
    func getData(data: MovieDetailModel)
    func getError()
}

protocol MovieDetailInteractorOutputProtocol: class {
    func requestSuccess(data: MovieDetailModel?)
    func requestFailed()
}

protocol MovieDetailInteractorInputProtocol: class {
    var presenter: MovieDetailInteractorOutputProtocol? { get set }
    func callRequest(id: String)
}

protocol MovieDetailRouterProtocol: class {
    static func initPresenter(vc: MovieDetailViewController) -> MovieDetailPresenterProtocol
}
