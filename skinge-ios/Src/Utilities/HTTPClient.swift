//
//  HTTPClient.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

enum HTTPMethods: String {
    case DELETE
    case GET
    case PATCH
    case POST
    case PUT
}

class HTTPClient {
    
    // MARK: - Methods
    
    // Make a GET request from a URL and decode the result.
    static func get<T: Decodable>(url: String, completionHandler: @escaping (T?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.GET.rawValue
        request.setValue(Constants.API.apiKey, forHTTPHeaderField: "Authorization")
            
        let sharedSession = URLSession.shared
        
        let dataTask = sharedSession.dataTask(with: request) {
            (data, response, error) in
                do {
                    if let jsonData = data {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let typedObject: T? = try decoder.decode(T.self, from: jsonData)
                        completionHandler(typedObject)
                    }
                }
                catch {
                    print(error)
                }
        }
        
        dataTask.resume()
    }
}
