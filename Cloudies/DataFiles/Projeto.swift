//
//  Projeto.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 18/06/24.
//
import SwiftData
import Foundation

@Model
class Projeto {
    var palavraChave: String
    var gerados: [String]
    var favoritos: [String]
    
    init(palavraChave: String, gerados: [String], favoritos: [String]) {
        self.palavraChave = palavraChave
        self.gerados = gerados
        self.favoritos = favoritos
    }
}
