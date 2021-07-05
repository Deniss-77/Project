//
//  Visual.swift
//  Project
//
//  Created by Denis Kravets on 30.06.2021.
//

import UIKit

extension MainVC {
    
    func tableViewDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func addSubviews() {
        view.addSubview(tableView)
        view.addSubview(activityIndicator)
    }
    
    func setupConstraints() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewConstraint = [
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
        NSLayoutConstraint.activate(tableViewConstraint)
    
        activityIndicator.center = self.view.center
        activityIndicator.style = .large
    }
    
}
