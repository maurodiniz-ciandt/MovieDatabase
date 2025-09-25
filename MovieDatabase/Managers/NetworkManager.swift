//
//  NetworkManager.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 23/09/25.
//

import SwiftUI

public final class NetworkManager: NetworkManagerProtocol {
    
    static let shared = NetworkManager()
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5OGU1ODMxNGQ3NWJmNWIzYjIzZWIzZjU4ZjU3YWRlNSIsIm5iZiI6MTc1ODY0NzY0OS44OTc5OTk4LCJzdWIiOiI2OGQyZDU2MWE2YzliODgyMWM3NGE1NGEiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.kNjTUwvRuYb7vNCGU5vehVuxBrEQ6QWxeQy733M0HQU"
    private static let baseUrl = "https://api.themoviedb.org/3/movie"
    private let movieListUrl = baseUrl + "/popular"
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    // MARK: - Public Methods
    
    public func getMovieList() async throws -> [Movie] {
        guard let url = URL(string: movieListUrl) else {
            throw MDError.invalidUrl
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let queryItems = [
            URLQueryItem(name: "language", value: "en-US"),
            URLQueryItem(name: "page", value: "1")
        ]
        components?.queryItems = queryItems
        
        guard let url = components?.url else {
            throw MDError.unableToComplete
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw MDError.unableToComplete
            }
            
            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(MovieListResponse.self, from: data)
            
            return decodedResponse.results
        } catch {
            throw MDError.invalidData
        }
    }
    
    public func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void) {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
