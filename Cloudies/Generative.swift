////
////  Generative.swift
////  Cloudies
////
////  Created by Izadora de Oliveira Albuquerque Montenegro on 12/06/24.
////
//import GoogleGenerativeAI
//import SwiftUI
//import UIKit
//
//// Certifique-se de que a API key é correta e tenha os devidos permissões
//let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")
//
//// Carregando a imagem do bundle
//guard let cookieImage = UIImage(named: "cookies") else {
//    fatalError("Imagem não encontrada.")
//}
//
//let prompt = "Do these look store-bought or homemade?"
//
//do {
//    let response = try await model.generateContent(prompt: prompt, image: cookieImage)
//    // Use a resposta conforme necessário
//} catch {
//    print("Erro ao gerar conteúdo: \(error)")
//}
