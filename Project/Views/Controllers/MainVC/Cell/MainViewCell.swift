//
//  MainViewCell.swift
//  Pryaniky
//
//  Created by Denis Kravets on 17.06.2021.
//

import UIKit

class MainViewCell: UITableViewCell, Cellable {

    // MARK: IBOutlets
    
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var textBlockButton: UIButton!
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var variantLabel: UILabel!
    
    // MARK: Properties
    
    private var network = NetworkManager()
    
    // completions
    var alertControllerOfName: (() -> ())?
    var alertControllerOfTextBlock: (() -> ())?
    var alertControllerOfSelected: (() -> ())?

    // MARK: Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    weak var viewModel: TBCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else { return }
            nameButton.setTitle(viewModel.name, for: .normal)
            textBlockButton.setTitle(viewModel.textBlock, for: .normal)
            selectedButton.setTitle(viewModel.selector, for: .normal)
            if viewModel.url != "" {
                network.getPhoto { image in
                    DispatchQueue.main.async {
                        self.viewImage.image = image
                    }
                }
            }
            if viewModel.variant.isEmpty != true {
                let currentArray = viewModel.variant
                let variants = currentArray.map({ $0.getVariant() })
                variantLabel.text = "\(variants)"
            }
        }
    }
    
    // MARK: IBActions
    
    @IBAction func nameButton(_ sender: Any) {
        alertControllerOfName?()
    }
    
    @IBAction func textBlockButton(_ sender: Any) {
        alertControllerOfTextBlock?()
    }
    
    @IBAction func selectedButton(_ sender: Any) {
        alertControllerOfSelected?()
    }
    
}
