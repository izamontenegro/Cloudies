import GoogleGenerativeAI
import Foundation
import SwiftUI

func gerarRespostaIgnorandoCasos(gerarParaTela tipoGeracao: String, palavraChave: Palavra, recorteTematico: String, ignorando palavrasUsadas: [Palavra]) async -> String {
    
    var palavrasUsadasPrompt = ""
    var titulosPrompt: String = ""
    var textosPrompt: String = ""
    var prompt = ""
    for palavra in palavrasUsadas {
        palavrasUsadasPrompt += ", \(palavra.texto)"
    }
    
    //Transforma as palavras usadas em uma string para passar para a ia
    
    do {
        
        switch tipoGeracao {
        case "BrainStorm":
            prompt =
                """
                - Gere 2 objetos físicos relacionados à palavra "\(palavraChave.texto)".
                - Gere 3 conceitos abstratos relacionados à palavra "\(palavraChave.texto)".
                - Seguindo esse recorte temático: \(recorteTematico)
                - Gere-as uma seguida da outra, todas diferentes, separadas apenas por vírgula, não use quebra de linha
                - Gere apenas palavras, nada de frases
                - Gere, no total, APENAS 5 palavras, nada mais, e só use vírgula se for para separar uma palavra de outra
                - Não inclua, sob quaisquer circunstancias as seguintes palavras, em especiais as últimas: [ \(palavrasUsadasPrompt) ]
                - Se for impossível gerar ignorandos as acima, fuja do tema
                - Se a palavra \(palavraChave.texto) não for gerável, retorne "Erro: impossivel de gerar"
                """
        case "Problemas":
            for i in 0..<palavrasUsadas.count {
                if i%2 == 0 {
                    titulosPrompt += "\(palavrasUsadas[i].texto), \n"
                } else {
                    textosPrompt += "\(palavrasUsadas[i].texto), \n"
                }
            }
            prompt =
            """
            
            - Gere uma, apenas uma problemática especifica a cerca do problema \(palavraChave.texto)
            - Seguindo esse recorte temático: \(recorteTematico)
            - Gere o titulo, seguido de uma barra |, e então o texto ex: 'Titulo|Texto', e não formate o texto, apenas deixe-o limpo
            - Gere o títulos com, no máximo, 20 caracteres
            - Gere o texto com no máximo 50 caracteres
            - Não inclua, sob quaisquer circunstancias os seguintes titulos, em especiais os últimos: [ \(titulosPrompt) ]
            - Não inclua, sob quaisquer circunstancias as seguintes soluções, em especiais as últimas: [ \(textosPrompt) ]
            - Se for impossível gerar ignorandos as acima, fuja do tema
            - Se a palavra \(palavraChave.texto) não for gerável, retorne "Erro: impossivel de gerar"
            
            """//Prompt de problematica aqui
            
        case "Conexoes":
            for i in 0..<palavrasUsadas.count {
                if i%2 == 0 {
                    titulosPrompt += "\(palavrasUsadas[i].texto), \n"
                } else {
                    textosPrompt += "\(palavrasUsadas[i].texto), \n"
                }
            }
            prompt =
            """
            
            - Gere uma, apenas uma solução para o problema \(palavraChave.texto)
            - Seguindo esse recorte temático: \(recorteTematico)
            - Gere o titulo, seguido de uma barra |, e então o texto ex: 'Titulo|Texto', e não formate o texto, apenas deixe-o limpo
            - Gere o títulos com, no máximo, 20 caracteres
            - Gere o texto com no máximo 50 caracteres
            - Não inclua, sob quaisquer circunstancias os seguintes titulos, em especiais os últimos: [ \(titulosPrompt) ]
            - Não inclua, sob quaisquer circunstancias as seguintes soluções, em especiais as últimas: [ \(textosPrompt) ]
            - Se for impossível gerar ignorandos as acima, fuja do tema
            - Se a palavra \(palavraChave.texto) não for gerável, retorne "Erro: impossivel de gerar"
            
            """//Prompt de problematica aqui
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

/*
 
 
 ANIMAIS DOIDOS, MATAR ELES, TITULO, TEXTO
 [ANIMAIS DOIDOS, MATAR ELES, TITULO, TEXTO]
 ANIMAIS DOIDOS:
 MATAR ELES
 
 TITULO:
 TEXTO
 
 
 
 */
