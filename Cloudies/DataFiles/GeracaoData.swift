//
//  GeracaoData.swift
//  Cloudies
//
//  Created by Yago Souza Ramos on 25/06/24.
//

import Foundation
import SwiftData

@Model
class GeracaoData {
    var tipo: String
    var tituloData: String
    var palavraEntradaData: String
    var palavraGerandoData: Palavra
    var recorteTematicoData: String
    var colecaoDeLinhasData: [LinhaDePalavras]
    var palavrasParaIgnorarData: [Palavra]
    
    init(tipo: String, tituloData: String, palavraEntradaData: String, palavraGerandoData: Palavra, recorteTematicoData: String, colecaoDeLinhasData: [LinhaDePalavras], palavrasParaIgnorarData: [Palavra]) {
        self.tipo = tipo
        self.tituloData = tituloData
        self.palavraEntradaData = palavraEntradaData
        self.palavraGerandoData = palavraGerandoData
        self.recorteTematicoData = recorteTematicoData
        self.colecaoDeLinhasData = colecaoDeLinhasData
        self.palavrasParaIgnorarData = palavrasParaIgnorarData
    }
    
    init() {
        self.tipo = ""
        self.tituloData = ""
        self.palavraEntradaData = ""
        self.palavraGerandoData = Palavra(texto: "")
        self.recorteTematicoData = ""
        self.colecaoDeLinhasData = []
        self.palavrasParaIgnorarData = []
    }
    
}
