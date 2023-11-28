//
//  FilmDetailView.swift
//  filmTest
//
//  Created by Alina Titarenko on 13.11.2023.
//

import SwiftUI

struct FilmDetailView: View {

    // MARK: - Public properties
    
    var film: FilmModel
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/" + film.poster_path)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 150, height: 300) 
            .cornerRadius(10)
            Text(film.overview)
                .multilineTextAlignment(.center)
        }
        .padding(20)
        .navigationTitle(film.title)
    }
}

#Preview {
    FilmDetailView(film: FilmModel(json: ""))
}
