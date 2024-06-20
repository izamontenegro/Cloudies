import GoogleGenerativeAI
import Foundation
import SwiftUI

func gerarRespostaIgnorandoCasos(gerarParaTela tipoGeracao: String, palavraChave: Palavra, ignorando palavrasUsadas: [Palavra]) async -> String {
    
    var palavrasUsadasPrompt = ""
    var prompt = ""
    for palavra in palavrasUsadas {
        palavrasUsadasPrompt += ", \(palavra.texto)"
    } //Transforma as palavras usadas em uma string para passar para a ia
    
    do {
        
        switch tipoGeracao {
        case "BrainStorm":
            prompt =
                """
                - Gere 2 objetos físicos relacionados à palavra "\(palavraChave.texto)".
                - Gere 3 conceitos abstratos relacionados à palavra "\(palavraChave.texto)".
                - Gere-as uma seguida da outra, separadas apenas por vírgula, não use quebra de linha
                - Gere apenas palavras, nada de frases
                - Não inclua as seguintes palavras: \(palavrasUsadasPrompt)
                """
        case "Problematicas":
            prompt =
            ""//Prompt de problematica aqui
            
        case "Analogias":
            prompt =
            ""//Prompt de analogia aqui
        default:
            prompt =
            "Retorne 'Erro: tipo de geração inválido'"
        }
        
        let model = GenerativeModel(name: "gemini-1.5-flash-latest", apiKey: "AIzaSyAXRUjeuLPw_w7SvkvpkcScmF5QR29l9kU")
        
        print(prompt)
        let response = try await model.generateContent(prompt)
        if let text = response.text {
            _ = text.replacingOccurrences(of: "\n", with: "")
            return text
        } else {
            return "kkk" //Retornar o erro
        }
    } catch {
        print("Erro ao gerar conteúdo: \(error)")
        return "kkk" //Inserir mensagem de erro
    }
    }
