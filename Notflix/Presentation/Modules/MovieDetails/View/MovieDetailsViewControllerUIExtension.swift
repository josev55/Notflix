//
//  MovieDetailsViewControllerUIExtension.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

import UIKit

extension MovieDetailsViewController {
    func setupPlayerContainer() {
        let playerContainer = UIView(frame: .zero)
        playerContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerContainer)
        
        NSLayoutConstraint.activate([
            playerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            playerContainer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            playerContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            playerContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
        ])
        
        self.playerContainer = playerContainer
    }
    
    func setupThumbnailImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
        playerContainer.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: playerContainer.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: playerContainer.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: playerContainer.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: playerContainer.bottomAnchor)
        ])
        
        thumbnailImageView = imageView
    }
    
    func setupPlayImageView() {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "play")
        imageView.isUserInteractionEnabled = true
        playerContainer.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: playerContainer.widthAnchor, multiplier: 0.25),
            imageView.heightAnchor.constraint(equalTo: playerContainer.heightAnchor, multiplier: 0.25),
            imageView.centerXAnchor.constraint(equalTo: playerContainer.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: playerContainer.centerYAnchor)
        ])
        
        playButton = imageView
    }
    
    func setupTitleLabel() {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "placeholder-text"
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.numberOfLines = 0
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: playerContainer.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        self.titleLabel = titleLabel
    }
    
    func setupTagLineLabel() {
        let tagLabel = UILabel()
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.text = "placeholder-text"
        tagLabel.font = .systemFont(ofSize: 16)
        tagLabel.numberOfLines = 0
        view.addSubview(tagLabel)
        
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            tagLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tagLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        self.tagLineLabel = tagLabel
    }
    
    func setupHomepageButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitle("Visit Homepage", for: .normal)
        button.setTitle("Visit Homepage", for: .highlighted)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15.0
        button.backgroundColor = UIColor(red: 0, green: 102.0/255.0, blue: 204.0/255.0, alpha: 1)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        self.homepageButton = button
    }
    
    func setupDescriptionView() {
        let descriptionView = UITextView()
        descriptionView.translatesAutoresizingMaskIntoConstraints = false
        descriptionView.isUserInteractionEnabled = false
        descriptionView.showsVerticalScrollIndicator = false
        descriptionView.showsHorizontalScrollIndicator = false
        view.addSubview(descriptionView)
        
        NSLayoutConstraint.activate([
            descriptionView.topAnchor.constraint(equalTo: tagLineLabel.bottomAnchor, constant: 16),
            descriptionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            descriptionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            descriptionView.bottomAnchor.constraint(equalTo: homepageButton.topAnchor, constant: -16)
        ])
        
        self.descriptionTextView = descriptionView
    }
}
