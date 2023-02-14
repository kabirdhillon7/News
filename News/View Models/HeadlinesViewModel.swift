//
//  HeadlinesViewModel.swift
//  News
//
//  Created by Kabir Dhillon on 2/13/23.
//

import Foundation
import Combine

class HeadlinesViewModel {
    
    @Published private(set) var articles = [NewsArticle]()
    
    private var observer: AnyCancellable?
    private let apiService: APICaller!
    
    init(apiService: APICaller) {
        self.apiService = apiService
        fetchHeadlines()
    }
    
    deinit {
        observer?.cancel()
    }
    
    // get articles
    func fetchHeadlines() {
        observer = apiService.getTopHeadline()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished getting news articles")
                case .failure(let error):
                    print("Error getting news articles: \(error)")
                }
            }, receiveValue: { [weak self] value in
                self?.articles = value
            })
    }
}
