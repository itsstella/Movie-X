//
//  MoviesListProtocol.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import UIKit

protocol MoviesListPresenterProtocol: class{
    var view: MoviesListViewProtocol? { get set }
    var interactor: MoviesListInteractorInputProtocol? { get set }
    var router: MoviesListRouterProtocol? { get set }
    func fetchMoviesList(filter: String)

}

protocol MoviesListViewProtocol: class {
    func getData(data: MoviesListModel)
    func getError()
}

protocol MoviesListInteractorOutputProtocol: class {
    func requestSuccess(data: MoviesListModel?)
    func requestFailed()
}

protocol MoviesListInteractorInputProtocol: class {
    var presenter: MoviesListInteractorOutputProtocol? { get set }
    func callRequest(filter: String)
}

protocol MoviesListRouterProtocol: class {
    static func initPresenter(vc: ViewController) -> MoviesListPresenterProtocol
}
