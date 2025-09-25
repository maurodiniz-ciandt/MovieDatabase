//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import SwiftUI

struct MovieDetailView: View {
    
    // MARK: - Properities
    let movie: Movie
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            MDRemoteImage(urlString: movie.posterPath)
                .aspectRatio(contentMode: .fit)
                .frame(width: 320, height: 225)
                .padding(.top, 8)
            
            VStack {
                Text(movie.title)
                    .multilineTextAlignment(.center)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.top, 8)
                    .accessibilityIdentifier("Title")
                
                Text("Overview: \(movie.overview)")
                    .multilineTextAlignment(.leading)
                    .font(.body)
                    .padding()
                    .padding(.bottom, 24)
                    .accessibilityIdentifier("Overview")
            }
        }
        .frame(width: 300)
        .background(Color(.systemBackground))
        .clipShape(.rect(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            DismissButtonView()
        }, alignment: .topTrailing)
        .accessibilityIdentifier("Main Content")
    }
}

#Preview {
    MovieDetailView(movie: MockData.sampleMovie,
                    isShowingDetail: .constant(true))
}
