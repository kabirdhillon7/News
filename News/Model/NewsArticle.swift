//
//  NewsArticle.swift
//  News
//
//  Created by Kabir Dhillon on 2/13/23.
//

import Foundation

struct NewsArticle: Decodable {
    
    struct Source: Decodable {
        var id: String?
        var name: String
    }
    
    var author: String?
    var title: String
    var description: String?
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String?
    
}

struct NewsArticlesResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [NewsArticle]
}
