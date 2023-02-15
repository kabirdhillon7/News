//
//  APICaller.swift
//  News
//
//  Created by Kabir Dhillon on 2/13/23.
//

import Foundation
import Combine

enum API: String {
    case key = "bdbf20fb6b914a6ca553b79c45c5226a"
}

class APICaller {
    
    // Top Headline
    func getTopHeadline() -> AnyPublisher<[NewsArticle], Error> {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(API.key.rawValue)") else {
            return Fail(error: NSError(domain: "Invalid url", code: 0)).eraseToAnyPublisher()
        }
        
        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: NewsArticlesResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .eraseToAnyPublisher()
    }
    
    // Search
    func getSearchResults(search: String) -> AnyPublisher<[NewsArticle], Error> {
        guard let encodedSearch = search.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL(string: "https://newsapi.org/v2/everything?q=\(encodedSearch)&apiKey=\(API.key.rawValue)")
        else {
            return Fail(error: NSError(domain: "Invalid url", code: 0)).eraseToAnyPublisher()
        }
        
        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map { $0.data }
            .decode(type: NewsArticlesResponse.self, decoder: JSONDecoder())
            .map { $0.articles }
            .eraseToAnyPublisher()
    }
}
