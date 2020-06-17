//
//  MovieDetailInteractor.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class MovieDetailInteractor: MovieDetailInteractorInputProtocol {
    var presenter: MovieDetailInteractorOutputProtocol?
    
    func callRequest(id: String) {
        let url = "https://api.themoviedb.org/3/movie/"+id+"?api_key=4412c16627eca5fdd8c28ae06b776060&language=en-US"
        
        Alamofire.request(url).responseObject { (response: DataResponse<MovieDetailModel>) in
            if(response.response?.statusCode == 200){
                let newsResponse = response.result.value
                self.presenter?.requestSuccess(data: newsResponse)
            }else {
                self.presenter?.requestFailed()
            }
        }
    }
        
}
    
    
