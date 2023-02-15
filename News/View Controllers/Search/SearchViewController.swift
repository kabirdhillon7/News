//
//  SearchViewController.swift
//  News
//
//  Created by Kabir Dhillon on 2/14/23.
//

import UIKit
import Combine
import AlamofireImage

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var searchVM = SearchViewModel()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Model View
        //cancellable = searchViewModel.$filteredResults.sink { [weak self] _ in
            //self?.tableView.reloadData()
        //}
        
        // Search Bar
        searchBar.delegate = self
        
        // Table View
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the index path from the cell that was tapped
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let article = searchVM.searchResults[indexPath.row]
        
        let detailViewController = segue.destination as! SearchWebViewController
        detailViewController.selectedNews = article
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if let search = searchBar.text {
            searchVM.fetchSearchResults(search: search)
            
        }
        
        tableView.reloadData()
    }
    
    // Show Cancel button when typing
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.showsCancelButton = true
    }
    
    // Logic for searchBar cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false // remove cancel button
        searchBar.text = "" // reset search text
        searchBar.resignFirstResponder() // remove keyboard
        //searchViewModel.filteredResults = searchViewModel.searchResults // reset results to display
        tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchVM.filteredResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResults") as! SearchNewsCell
        
        let article = searchVM.filteredResults[indexPath.row]
        
        if let imageUrlString = article.urlToImage, let imageUrl = URL(string: imageUrlString) {
            cell.newsImageView.af.setImage(withURL: imageUrl)
        }
        
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        
        return cell
    }
}
