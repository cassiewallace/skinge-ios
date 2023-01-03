//
//  HTTPClient.swift
//  skinge-ios
//
//  Created by Cassie Wallace on 10/27/22.
//

import Foundation

enum HTTPMethod: String {
    case DELETE
    case GET
    case PATCH
    case POST
    case PUT
}

class HTTPClient {
    
    // MARK: - Methods
    
    /// Makes a GET request.
    /// - Parameters:
    ///   - url: String of the endpoint.
    ///   - completionHandler: Function to run once the data has been retrieved.
    static func get<T: Decodable>(_ url: String, completionHandler: @escaping (T?) -> Void) {
        let request = URLRequest(urlString: url, httpMethod: .GET)
        perform(request: request, completionHandler: completionHandler)
    }
    
    /// Makes a POST request.
    /// - Parameters:
    ///   - url: String of the endpoint.
    ///   - body: HTTP body for the request.
    ///   - completionHandler: Function to run once the data has been retrieved.
    static func post<T: Decodable, U: Encodable>(_ url: String, data: U?, completionHandler: @escaping (T?) -> Void) {
        var request = URLRequest(urlString: url, httpMethod: .POST)
        
        do {
            if let data = data {
                let encoder = JSONEncoder()
                encoder.keyEncodingStrategy = .convertToSnakeCase
                let encodedData = try encoder.encode(data)
                request?.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request?.httpBody = encodedData
            }
        }
        catch {
            print(error)
        }
        
        perform(request: request, completionHandler: completionHandler)
    }
    
    /// Make an HTTP request and decode the result.
    /// Assumes that the response's keys are `snake_case`.
    /// - Parameters:
    ///   - request: A formatted `URLRequest`
    ///   - completionHandler: Function to run once the data has been retrieved.
    private static func perform<T: Decodable>(request: URLRequest?, completionHandler: @escaping (T?) -> Void) {
        guard let request = request else { return }
        
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
