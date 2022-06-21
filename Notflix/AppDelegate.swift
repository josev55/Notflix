//
//  AppDelegate.swift
//  Notflix
//
//  Created by Jose Vildosola on 18-06-22.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var container: Container = {
        let container = Container()
        container.register(ServiceClient.self) {  _ in
            DefaultServiceClient(config: ApiDataNetworkConfig(baseURL: URL(string: SharedConfig.instance.baseUrl)!))
        }
        
        container.register(MoviesRepositoryProtocol.self) { r in
            MoviesRepository(serviceClient: r.resolve(ServiceClient.self)!)
        }
        
        container.register(TrendingMoviesUseCaseProtocol.self) { r in
            TrendingMoviesUseCase(moviesRepository: r.resolve(MoviesRepositoryProtocol.self)!)
        }
        
        container.register(MoviesListingPresenterProtocol.self) { r in
            MoviesListingPresenter(trendingMoviesUseCase: r.resolve(TrendingMoviesUseCaseProtocol.self)!)
        }
        
        container.register(MoviesListingViewController.self) { r in
            let presenter = r.resolve(MoviesListingPresenterProtocol.self)
            let controller = MoviesListingViewController()
            controller.presenter = presenter
            return controller
        }
        
        return container
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

