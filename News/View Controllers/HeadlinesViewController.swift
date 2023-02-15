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
        
        if let imageUrlString = article.urlToImage, let imageUrl = URL(string: imageUrlString) {
            cell.articleImageView.af.setImage(withURL: imageUrl)
        }
        cell.titleLabel.text = article.title
        cell.descriptionLabel.text = article.description
        
        return cell
    }
}

