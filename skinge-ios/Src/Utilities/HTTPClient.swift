//
//  HTTPClient.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

class HTTPClient {
    
    // MARK: - Class Methods
    
    // Make a GET request from a URL.
    static func get<T: Decodable>(url: String, completionHandler: @escaping (T?) -> Void) {
        guard let url = URL(string: url) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer [REDACTED]",
            forHTTPHeaderField: "Authorization")
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
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
