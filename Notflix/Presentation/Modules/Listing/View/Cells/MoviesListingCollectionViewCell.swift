//
//  MoviesListingCollectionViewCell.swift
//  Notflix
//
//  Created by Jose Vildosola on 18-06-22.
//

import UIKit
import Kingfisher

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
    
    func configure(with model: MovieModel) {    
        let processor = DownsamplingImageProcessor(size: contentView.bounds.size)
        movieImageView.kf.setImage(with: model.imageUrl, placeholder: UIImage(named: "ticket-placeholder"), options: [
            .processor(processor),
            .scaleFactor(UIScreen.main.scale),
            .transition(.fade(0.5))
        ]) {
            result in
            switch result {
            case .success(let value):
                print("Task done for: \(value.source.url?.absoluteString ?? "")")
            case .failure(let error):
                print("Job failed: \(error.localizedDescription)")
            }
        }
        
        titleLabel.text = model.title
        ratingLabel.text = model.rating
    }
}

extension MoviesListingCollectionViewCell {
    private func setupLayer() {
        layer.masksToBounds = true
        layer.cornerRadius = 4.0
    }

    private func setupImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        movieImageView = imageView
    }

    private func setupDescriptionView() {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.backgroundColor = UIColor(red: 0, green: 102.0/255.0, blue: 204.0/255.0, alpha: 0.4)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        descriptionStackView = stackView
    }
    
    private func setupTitleLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 2
        label.text = "placeholder-text"
        
        titleLabel = label
        descriptionStackView.addArrangedSubview(titleLabel)
        descriptionStackView.layoutSubviews()
    }
    
    private func setupRatingLabel() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textAlignment = .right
        label.text = "placeholder-text"
        
        ratingLabel = label
        descriptionStackView.addArrangedSubview(ratingLabel)
        descriptionStackView.layoutSubviews()
    }
}
