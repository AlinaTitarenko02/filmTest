//
//  Film.swift
//  filmTest
//
//  Created by Alina Titarenko on 13.11.2023.
//

import Foundation
import SwiftyJSON

struct FilmModel: Identifiable, Decodable {
    var idS = UUID()
    var id: Int
    var abult: Bool
    var genre_ids: [Int]
    var original_language: String
    var backdrop_path: String
    var original_title: String
    var overview: String
    var popularity: Double
    var poster_path: String
    var release_date: String
    var title: String
    var video: Bool
    var vote_average: Double
    var vote_count: Int

    init(json: JSON) {
        self.id = json["id"].intValue
        self.abult = json["adult"].boolValue
        self.genre_ids = json["genre_ids"].arrayObject as? [Int] ?? []
        self.original_language = json["original_language"].stringValue
        self.backdrop_path = json["backdrop_path"].stringValue
        self.original_title = json["original_title"].stringValue
        self.overview = json["overview"].stringValue
        self.popularity = json["popularity"].doubleValue
        self.poster_path = json["poster_path"].stringValue
        self.release_date = json["release_date"].stringValue
        self.title = json["title"].stringValue
        self.video = json["video"].boolValue
        self.vote_average = json["vote_average"].doubleValue
        self.vote_count = json["vote_count"].intValue
    }
}
