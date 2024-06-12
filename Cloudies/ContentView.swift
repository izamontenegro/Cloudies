//
//  ContentView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//
import GoogleGenerativeAI
import SwiftUI
import UIKit

struct ContentView: View {
    var body: some View {
        Text("Gerar Conteúdo")
            .padding()
            .onAppear {
                generateContent()
            }
    }
    
    func generateContent() {
        Task {
            do {
                let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")

                // Carregando a imagem do bundle usando UIImage de UIKit
                guard let cookieImage = UIImage(named: "cookies") else {
                    fatalError("Imagem não encontrada.")
                }

                let prompt = "Diga 3 palavras relacionadas a natureza"
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    print(text)
                }
//                let response = try await model.generateContent(prompt)
//                // Use a resposta conforme necessário
//                print("Resposta: \(response)")
                
            } catch {
                print("Erro ao gerar conteúdo: \(error)")
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
