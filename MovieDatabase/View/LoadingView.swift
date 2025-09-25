//
//  LoadingView.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import SwiftUI

struct LoadingView: View {
    
    @Binding var isShowing: Bool
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            ProgressView("Loading...")
                .scaleEffect(1.5)
        }
        .opacity(isShowing ? 1 : 0)
    }
}

#Preview {
    LoadingView(isShowing: .constant(true))
}
