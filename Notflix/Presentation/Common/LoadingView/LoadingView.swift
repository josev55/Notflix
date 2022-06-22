//
//  LoadingView.swift
//  Notflix
//
//  Created by Jose Vildosola on 20-06-22.
//

import UIKit

class LoadingView {
    private weak var loadingView: UIView!
    private weak var activityIndicator: UIActivityIndicatorView!
    private weak var loadingLabel: UILabel!
    
    static var shared: LoadingView = {
        return LoadingView()
    }()
    
    private init() {}
    
    func showLoadingIn(_ containerView: UIView, text: String = "Cargando...") {
        let view = UIView(frame: .zero)
        let indicator = UIActivityIndicatorView()
        let label = UILabel()
        label.text = text
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(view)
        view.addSubview(indicator)
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 16),
            view.topAnchor.constraint(equalTo: containerView.topAnchor),
            view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        indicator.startAnimating()
        
        loadingView = view
        activityIndicator = indicator
        loadingLabel = label
    }
    
    func removeLoadingView() {
        loadingView.removeFromSuperview()
    }
}
