//
//  MainViewCell.swift
//  Project
//
//  Created by Denis Kravets on 17.06.2021.
//

import UIKit

class MainViewCell: UITableViewCell {
    
    // MARK: Properties
    
    static let identifier = "tableCell"
    
    private var networkManager = NetworkManager()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    let positionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

    let viewImage: UIImageView = {
        let image = UIImageView(frame: CGRect(origin: CGPoint(), size: CGSize(width: 150, height: 150)))
        image.layer.cornerRadius = image.frame.size.height / 2
        image.clipsToBounds = true
        return image
    }()

    let levelLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    // MARK: Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(viewModel: TBCellViewModelType? ) {
        guard let viewModel = viewModel else { return }
        nameLabel.text = viewModel.name
        positionLabel.text = viewModel.type
        ratingLabel.text = "Rating: \(viewModel.rating)"
        if viewModel.url == "" {
            self.viewImage.image = UIImage(named: "DefaultImage")
        } else {
            networkManager.getPhoto(url: viewModel.url, completion: { image in
                self.viewImage.image = image
            })
        }
        let index = viewModel.rating // рейтинг
        if index != 0 {
            levelLabel.text = "\(viewModel.level[index - 1].getResult())"
        }
    }
    
    override func prepareForReuse() {
        viewImage.image = nil
        levelLabel.text = ""
    }
    
}

// MARK: Visual parameters

extension MainViewCell {
    
    func addSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(positionLabel)
        contentView.addSubview(ratingLabel)
        contentView.addSubview(viewImage)
        contentView.addSubview(levelLabel)
    }
    
    func setupLayout() {
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        let nameButtonConstraints = [
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(nameButtonConstraints)
        
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        let textBlockButtonConstraints = [
            positionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            positionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            positionLabel.rightAnchor.constraint(equalTo: viewImage.leftAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(textBlockButtonConstraints)
        
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        let selectorButtonConstraints = [
            ratingLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 20),
            ratingLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            positionLabel.rightAnchor.constraint(equalTo: viewImage.leftAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(selectorButtonConstraints)
        
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        let viewImageConstraints = [
            viewImage.heightAnchor.constraint(equalToConstant: 150),
            viewImage.widthAnchor.constraint(equalToConstant: 150),
            viewImage.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            viewImage.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -20)
        ]
        NSLayoutConstraint.activate(viewImageConstraints)
        
        levelLabel.translatesAutoresizingMaskIntoConstraints = false
        let variantsLabelConstraints = [
            levelLabel.topAnchor.constraint(equalTo: ratingLabel.bottomAnchor, constant: 20),
            levelLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            levelLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            levelLabel.rightAnchor.constraint(equalTo: viewImage.leftAnchor, constant: -15)
        ]
        NSLayoutConstraint.activate(variantsLabelConstraints)
    }
    
}
