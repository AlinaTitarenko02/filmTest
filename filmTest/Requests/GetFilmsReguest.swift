//
//  GetFilmsReguest.swift
//  filmTest
//
//  Created by Alina Titarenko on 13.11.2023.
//

import Foundation
import Combine

// test
class FilmService {
    static let shared = FilmService()
    
    private init() {}
    
    func fetchMovies() -> AnyPublisher<Data, Error> {
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = .useProtocolCachePolicy
        request.allHTTPHeaderFields = ["accept": "application/json",
                                       "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OWVmNjExYWIxMGY3N2Y1Y2Y1YjdlNTNhYzdjMWQxZCIsInN1YiI6IjY1NTIyNDAyZmQ2ZmExMDExYmM0MzAyOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.7U6LgGqE_vIuwEDZzDo1KVpdc557wffNZmssQwlIiHw"]
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .mapError { $0 as Error }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
