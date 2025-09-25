//
//  MovieListViewModel.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 23/09/25.
//

import Foundation

public final class MovieListViewModel: MovieListViewModelProtocol {
    
    // MARK: - Properties
    
    @Published public var isLoading: Bool = false
    @Published public var movieList: [Movie] = []
    @Published public var alertItem: AlertItem?
    @Published public var isShowingDetail: Bool = false
    @Published public var selectedMovie: Movie?
    
    // MARK: - Public Methods
    
    public func getMovieList() {
        isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [self] in
            Task {
                do {
                    movieList = try await NetworkManager.shared.getMovieList()
                    isLoading = false
                } catch {
                    alertItem = AlertContext.genericAlert
                    isLoading = false
                }
            }
        }
    }
}
