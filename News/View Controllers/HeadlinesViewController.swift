//
//  ViewController.swift
//  News
//
//  Created by Kabir Dhillon on 2/13/23.
//

import UIKit
import Combine
import AlamofireImage

class HeadlinesViewController: UIViewController {
    
    
    /* Requirements from API... add to NewsCell
     Source of the article (e.g. TechCrunch)
     Author of the article (e.g. Mark Johnson)
     Title of the article
     Subtitle of the article - this shouldn't exceed 2 lines and should be truncated if it does
     Published date in the format MM/DD/YYYY (e.g. 12/02/2020)
     Image for the article provided by the News API
     
     Cell Layout:
     Vert--                 Horizontal--
     Title                  Image
     Source
     Author • Published Date
     Description
     
     */
    
    @IBOutlet weak var tableView: UITableView!
    
    var headlinesVM: HeadlinesViewModel!
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind to View Model
        let apiService = APICaller()
        headlinesVM = HeadlinesViewModel(apiService: apiService)
        headlinesVM.$articles
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                self?.tableView.reloadData()
            }
            .store(in: &cancellables)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the index path from the cell that was tapped
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        
        let article = headlinesVM.articles[indexPath.row]
        
        let detailViewController = segue.destination as! NewsWebViewController
        detailViewController.newsSelected = article
        self.hidesBottomBarWhenPushed = true
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension HeadlinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlinesVM.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell") as! NewsCell
        
        let article = headlinesVM.articles[indexPath.row]
        
        if let imageUrl = URL(string: article.urlToImage) {
            cell.articleImageView.af.setImage(withURL: imageUrl)
        }
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        
        return cell
    }
}

