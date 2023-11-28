//
//  FilmListViewModel.swift
//  filmTest
//
//  Created by Alina Titarenko on 13.11.2023.
//

import Foundation
import Combine
import SwiftyJSON

class FilmListViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var films: [FilmModel] = []
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Public methods
    
    func fetchMovies() {
        FilmService.shared.fetchMovies()
            .mapError { error in
                // Handle network or decoding errors here
                return error
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] (data) in
                do {
                    let json = try JSON(data: data)
                    if let results = json["results"].arrayObject {
                        let films = results.compactMap { FilmModel(json: JSON(rawValue: $0) ?? "") }
                        self?.films = films
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            })
            .store(in: &cancellables)
    }
}
