//
//  MovieListCellView.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import SwiftUI

struct MovieListCellView: View {
    
    let movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(movie.title)
                .font(.title2)
                .fontWeight(.medium)
            
            Text("Release date: \(movie.releaseDate)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
        }
        .padding(.top)
    }
}

#Preview {
    MovieListCellView(movie: MockData.sampleMovie)
}
