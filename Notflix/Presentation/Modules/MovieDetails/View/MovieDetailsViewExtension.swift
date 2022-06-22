//
//  MovieDetailsViewExtension.swift
//  Notflix
//
//  Created by Jose Vildosola on 21-06-22.
//

import Foundation
import AVKit
import Kingfisher

extension MovieDetailsViewController: MovieDetailsViewProtocol {
    func showLoading() {
        LoadingView.shared.showLoadingIn(self.view)
    }
    
    func hideLoading() {
        LoadingView.shared.removeLoadingView()
    }
    
    func showMovieDetails(movieDetails: MovieDetailsModel) {
        self.thumbnailImageView.kf.setImage(with: movieDetails.movieCoverImageURL)
        
        self.titleLabel.text = movieDetails.movieTitle
        self.tagLineLabel.text = movieDetails.movieTagline
        self.descriptionTextView.text = movieDetails.movieDescription
        
        
        self.playButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.playMovie)))
        
        let buttonAction = UIAction { _ in
            UIApplication.shared.open(movieDetails.movieHomepageURL, options: [:], completionHandler: nil)
        }
        self.homepageButton.addAction(buttonAction, for: .touchUpInside)
    }
    
    @objc func playMovie() {
        let player = AVPlayer(url: URL(string: "https://mdstrm.com/video/60b00165e2db445d945016b3.m3u8")!)
        let vc = AVPlayerViewController()
        vc.player = player

        present(vc, animated: true) {
            vc.player?.play()
        }
    }
    
    func getMovieDetailsFailed() {
    }
}
