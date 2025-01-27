//
//  ApiResponse.swift
//  FilmSearcher
//
//  Created by Tardes on 27/1/25.
//

import Foundation

struct MooviesResponse : Codable
{
    let Search : [Moovies]
    
}

struct Moovies : Codable
{
    let Title: String
    let Year: String
    let imdbID: String
    let Tipe: String
    let Poster: String
    
    
    
    private enum CodingKeys : String,CodingKeys
    {
        case Tittle,Year,imdbID
        case Tipe = "Type"
    }
    
}


