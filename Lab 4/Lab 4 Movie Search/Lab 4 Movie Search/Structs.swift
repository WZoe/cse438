//
//  Structs.swift
//  Lab 4 Movie Search
//
//  Created by Zoe Wang on 10/20/19.
//  Copyright © 2019 Zoe Wang. All rights reserved.
//

import Foundation

struct APIResults:Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int!
    let poster_path: String?
    let title: String
    let release_date: String?
    let vote_average: Double?
    let overview: String?
    let vote_count:Int!
}

