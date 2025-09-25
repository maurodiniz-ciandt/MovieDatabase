//
//  MovieListViewModelProtocol.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 23/09/25.
//

import Foundation

@MainActor
public protocol MovieListViewModelProtocol: ObservableObject {
    
    // MARK: - Properties
    
    var isLoading: Bool { get set }
    var movieList: [Movie] { get }
    var alertItem: AlertItem? { get set }
    var isShowingDetail: Bool { get set }
    var selectedMovie: Movie? { get set }
    
    // MARK: - Methods
    
    func getMovieList()
}
