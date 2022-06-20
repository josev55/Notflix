//
//  MoviesListingCollectionViewCell.swift
//  Notflix
//
//  Created by Jose Vildosola on 18-06-22.
//

import UIKit

class MoviesListingCollectionViewCell: UICollectionViewCell {
    weak var movieImageView: UIImageView!
    weak var descriptionStackView: UIStackView!
    weak var titleLabel: UILabel!
    weak var ratingLabel: UILabel!
    
    class var typeName: String {
        get { String(describing: MoviesListingCollectionViewCell.self) }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
        setupImageView()
        setupDescriptionView()
        setupTitleLabel()
        setupRatingLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayer() {
        layer.masksToBounds = true
        layer.cornerRadius = 4.0
    }

    private func setupImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .red
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.7)
        ])

        movieImageView = imageView
    }

    private func setupDescriptionView() {
        let stackView = UIStackView()
        stackView.axis = .vertical
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        descriptionStackView = stackView
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        descriptionStackView.addArrangedSubview(label)

        titleLabel = label
    }
    
    private func setupRatingLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        descriptionStackView.addArrangedSubview(label)

        ratingLabel = label
    }
}
