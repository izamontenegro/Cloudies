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
    @State private var geradas: String = ""
    
    var body: some View {
        VStack{
            HStack {
                TextField("Digite palavras-chave", text: $palavraChave)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    Task {
                        geradas = await gerarPalavras(palavraChave: palavraChave)
                        palavraChave = " "
                        
                    }
                }, label: {
                    Image(systemName: "plus.circle.fill")
                })
            }
            
            Text(geradas)
        }
    }
    
    func gerarPalavras(palavraChave: String) async -> String {
        
            do {
                let prompt = "Diga 5 palavras relacionadas à palavra \(palavraChave). Se a palavra for algo inapropriada (sexual ou violento) responda com 'false'. Se for algo como 'racismo', 'machismo' e etc, forneça palavras que incentivem o combate dessas praticas"
                
                let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")
    
                let response = try await model.generateContent(prompt)
                if let text = response.text {
                    return text
                }
                else {
                    return "kkk"
                }
            } catch {
                print("Erro ao gerar conteúdo: \(error)")
                return "kkk"
            }
            
            
        
    }
}

#Preview {
    ContentView()
}
