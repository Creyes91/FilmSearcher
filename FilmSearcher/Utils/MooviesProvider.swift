//
//  MooviesProvider.swift
//  FilmSearcher
//
//  Created by Tardes on 27/1/25.
//

import Foundation

class MooviesProvider {
    
    
    static func SearchMoviesBy (name: String) async throws -> [Moovies]
    {
        let url = URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=4f835f7f")!
        
        let session = URLSession.shared
        
        let (data,_) = try await session.data(from: url)
        
        let Movies = try JSONDecoder().decode(MooviesResponse.self, from: data)
        
        return Movies.Search
        
    }
    
    static func SearchMovieById (id: String) async throws -> Moovies
    {
        let url = URL(string: "https://www.omdbapi.com/?i=\(id)&apikey=4f835f7f")!
        
        let session = URLSession.shared
        
        let (data,_) = try await session.data(from: url)
        
        let movie = try JSONDecoder().decode(Moovies.self, from: data)
        
        return movie
        
        
    }
}
