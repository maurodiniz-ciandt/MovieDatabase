//
//  DismissButtonView.swift
//  MovieDatabase
//
//  Created by Mauro Augusto Araujo Diniz on 24/09/25.
//

import SwiftUI

struct DismissButtonView: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark.circle")
                .imageScale(.medium)
                .frame(width: 44, height: 44)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    DismissButtonView()
}
