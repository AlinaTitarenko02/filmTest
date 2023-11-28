//
//  FilmListView.swift
//  filmTest
//
//  Created by Alina Titarenko on 13.11.2023.
//

import SwiftUI

struct FilmListView: View {
    
    // MARK: - Public properties
    
    @StateObject private var viewModel = FilmListViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List(viewModel.films) { film in
                NavigationLink(destination: FilmDetailView(film: film)) {
                    CellFilm(film: film)
                        .cornerRadius(6)
                }
            }
            .navigationTitle("Фільми")
        }
        .onAppear() {
            viewModel.fetchMovies()
        }
    }
}

#Preview {
    FilmListView()
}

