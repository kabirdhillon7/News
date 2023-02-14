//
//  ViewController.swift
//  News
//
//  Created by Kabir Dhillon on 2/13/23.
//

import UIKit

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
    var safeArea: UILayoutGuide!
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,
                       forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        safeArea = view.layoutMarginsGuide
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    
    
}

