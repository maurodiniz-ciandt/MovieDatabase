//
//  NetworkManagerProtocol.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 23/09/25.
//

import SwiftUI

public protocol NetworkManagerProtocol {
    
    // MARK: - Methods
    
    func getMovieList() async throws -> [Movie]
    func downloadImage(fromUrlString urlString: String, completed: @escaping (UIImage?) -> Void)
}
