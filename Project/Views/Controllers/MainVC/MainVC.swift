//
//  ViewController.swift
//  Pryaniky
//
//  Created by Denis Kravets on 13.06.2021.
//

import UIKit

class MainVC: UIViewController {
    
    // MARK: IBOutlets
 
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib(nibName: MainViewCell.nibName, bundle: nil), forCellReuseIdentifier: MainViewCell.identifier)
        }
    }
    
    // MARK: Properties
    
    private var viewModel: TBViewModelType? = ViewModel()
    
    // MARK: Life cycle viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.arrayOfData.bind({ _ in
            self.viewModel?.updateData(completion: { _ in
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        })
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
        cell.alertControllerOfName = {
            self.alertControllerOfName()
        }
        cell.alertControllerOfTextBlock = {
            self.alertControllerOfTextBlock()
        }
        cell.alertControllerOfSelected = {
            self.alertControllerOfSelected()
        }
        cell.viewModel = cellViewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
