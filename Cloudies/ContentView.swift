//
//  ContentView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//

import GoogleGenerativeAI
import SwiftUI

struct ContentView: View {
    @State private var palavraChave: String = ""
    
    var body: some View {
        
        HStack {
            TextField("Digite palavras-chave", text: $palavraChave)
            Button(action: {
                gerarPalavras(palavraChave: palavraChave)
                palavraChave = " "
                
            }, label: {
                Image(systemName: "plus.circle.fill")
            })
        }
        
//        Button("Gerar Conteúdo", action: {
//                   
//        })
        
    }
    
    func gerarPalavras(palavraChave: String) {
        Task {
            do {
                let prompt = "Diga 5 palavras relacionadas à palavra \(palavraChave). Se a palavra for algo inadequado responda com 'false' "
                
                let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")
    
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    print(text)
                }
                
            } catch {
                print("Erro ao gerar conteúdo: \(error)")
            }
            
            
        }
    }
}

#Preview {
    ContentView()
}
