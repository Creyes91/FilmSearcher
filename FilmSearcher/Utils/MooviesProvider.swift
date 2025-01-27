//
//  MooviesProvider.swift
//  FilmSearcher
//
//  Created by Tardes on 27/1/25.
//

import Foundation

class MooviesProvider {
    
    
    static func SearchMooviesBy (name: String) async throws -> [Moovies]
    {
        let url = URL(string: "https://www.omdbapi.com/?s=\(name)&apikey=4f835f7f")!
        
        let session = URLSession.shared
        
        let (data,_) = try await session.data(from: url)
        
        let Moovies = try JSONDecoder().decode(MooviesResponse.self, from: data)
        
        return Moovies.Search
        
    }
    
    static func SearchmoovieById (id: String) async throws -> 
}
