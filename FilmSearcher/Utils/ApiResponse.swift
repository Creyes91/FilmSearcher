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
    let Plot: String?
    let RunTime: String?
    let Director: String?
    let Genre: String?
    let Country: String?
    
    
    
    
   private enum CodingKeys : String, CodingKey
    {
        case Title,Year,imdbID,Poster,Plot,RunTime,Director,Genre,Country
        case Tipe = "Type"
    }
    
}


