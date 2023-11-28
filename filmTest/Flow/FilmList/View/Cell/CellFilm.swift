//
//  CellFilm.swift
//  filmTest
//
//  Created by Alina Titarenko on 13.11.2023.
//

import SwiftUI

struct CellFilm: View {
    
    // MARK: - Public properties
    
    let film: FilmModel
    
    // MARK: - Body
    
    var body: some View {
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
        .frame(width: 80, height: 80)
        .cornerRadius(10)
        VStack(alignment: .leading) {
            Text(film.original_title)
        }
        
    }
}

#Preview {
    CellFilm(film: FilmModel(json: ""))
}
