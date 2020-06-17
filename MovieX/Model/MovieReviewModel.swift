
//
//  File.swift
//  MovieX
//
//  Created by Stella Patricia (ID) on 17/06/20.
//  Copyright © 2020 Stella. All rights reserved.
//

import Foundation
import ObjectMapper


class MovieReviewModel: Mappable {
    var id: Int?
    var page: Int?
    var results: [ReviewList]?
    var total_pages: Int?
    var total_results: Int?
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        page <- map["page"]
        results <- map["results"]
        total_pages <- map["total_pages"]
        total_results <- map["total_results"]
    }
    
    class ReviewList: Mappable {
        var author: String?
        var content: String?
        var id: String?
        var url: String?

        init() {}

        required init?(map: Map) {}

        func mapping(map: Map) {
            author <- map["author"]
            content <- map["content"]
            id <- map["id"]
            url <- map["url"]
        }
    }
}
