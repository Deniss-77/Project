//
//  MainVC.swift
//  Project
//
//  Created by Denis Kravets on 13.06.2021.
//

import UIKit

class MainVC: UIViewController {
 
    // MARK: Properties
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.identifier)
        tableView.allowsSelection = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var viewModel: TBViewModelType?
    
    // MARK: Life cycle viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupConstraints()
        tableViewDelegate()
        activityIndicator.startAnimating()
        
        viewModel?.arrayOfPlayers.bind({ _ in
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true
                self.tableView.reloadData()
            }
        })
        
        viewModel?.updateData()
    }
    
}

// MARK: TableViewDataSource and TAbleViewDelegate

extension MainVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as! MainViewCell
        let cellViewModel = viewModel?.cellViewModel(for: indexPath)
        cell.configure(viewModel: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
