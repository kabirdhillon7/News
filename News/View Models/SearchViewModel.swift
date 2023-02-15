//
//  SearchViewModel.swift
//  News
//
//  Created by Kabir Dhillon on 2/14/23.
//

import Foundation
import Combine

class SearchViewModel {
    
    private var observer: AnyCancellable?
    private let apiService = APICaller()
    
    @Published private(set) var searchResults = [NewsArticle]()
    @Published private(set) var filteredResults = [NewsArticle]()
    
    // init
    init() {
        filteredResults = searchResults
    }
    
    // deinit
    deinit {
        observer?.cancel()
    }
    
    func fetchSearchResults(search: String) {
        observer = apiService.getSearchResults(search: search)
            .sink(receiveCompletion: { completion in
                switch completion{
                case .finished:
                    print("Finished getting search results")
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }, receiveValue: { [weak self] value in
                self?.searchResults = value
                self?.filteredResults = value
            })
    }
}
