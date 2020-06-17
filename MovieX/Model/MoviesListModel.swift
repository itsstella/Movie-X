//
//  MoviesListModel.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import ObjectMapper


class MoviesListModel: Mappable {
    var page: Int?
    var totalResults: Int?
    var totalPage: Int?
    var results: [ResultsMovie]?
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPage <- map["total_pages"]
        results <- map["results"]
    }
    
    class ResultsMovie: Mappable {
        var popularity: Float?
        var voteCount: Int?
        var video: Bool?
        var posterPath: String?
        var id: Int?
        var adult: Bool?
        var backdropPath: String?
        var originalLanguage: String?
        var originalTitle: String?
        var genre_ids: [Int]?
        var title: String?
        var voteAverage: Float?
        var overview: String?
        var releaseDate: String?

        init() {}

        required init?(map: Map) {}

        func mapping(map: Map) {
            popularity <- map["popularity"]
            voteCount <- map["vote_count"]
            video <- map["video"]
            posterPath <- map["poster_path"]
            id <- map["id"]
            adult <- map["adult"]
            backdropPath <- map["backdrop_path"]
            originalLanguage <- map["original_language"]
            originalTitle <- map["original_title"]
            genre_ids <- map["genre_ids"]
            title <- map["title"]
            voteAverage <- map["vote_average"]
            overview <- map["overview"]
            releaseDate <- map["release_date"]
        }
    }
}


