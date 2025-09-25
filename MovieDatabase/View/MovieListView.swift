//
//  MovieListView.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 23/09/25.
//

import SwiftUI

struct MovieListView<VM: MovieListViewModelProtocol>: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: VM
    
    // MARK: - Init
    
    public init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.movieList) { movie in
                    MovieListCellView(movie: movie)
                        .listRowSeparator(shouldShowRowSeparator(movie.id),
                                          edges: .top)
                        .onTapGesture {
                            viewModel.isShowingDetail = true
                            viewModel.selectedMovie = movie
                        }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Trending Movies")
                .disabled(viewModel.isShowingDetail)
                .refreshable {
                    viewModel.getMovieList()
                }
                
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail,
               let selectedMovie = viewModel.selectedMovie {
                MovieDetailView(movie: selectedMovie,
                                isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView(isShowing: $viewModel.isLoading)
            }
        }
        .task {
            self.viewModel.getMovieList()
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title,
                  message: alert.message,
                  dismissButton: alert.dismissButton)
        }
    }
    
    private func shouldShowRowSeparator(_ id: Int) -> Visibility {
        guard let firstMovie = viewModel.movieList.first else { return .visible }
        return id == firstMovie.id ? .hidden : .visible
    }
}
