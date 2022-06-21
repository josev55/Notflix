import Foundation
struct SharedConfig {
    static let instance = SharedConfig()

    private init() {
        guard let configPath = Bundle.main.path(forResource: "Configurations", ofType: "plist") else {return}
        let url = URL(fileURLWithPath: configPath)
        let data = try! Data(contentsOf: url)
        guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? Dictionary<String, Any> else {return}
        configurations = plist
    }
    
    private var configurations: Dictionary<String, Any>?
    
    var apiKey: String {
        return configurations?["APIKey"] as? String ?? ""
    }
    
    var baseUrl: String {
        return configurations?["baseURL"] as? String ?? ""
    }
    
    var tmdbImageBaseUrl: String {
        return configurations?["tmdbImageBaseURL"] as? String ?? ""
    }
}
