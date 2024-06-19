//
//  Historico.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 14/06/24.
//
import SwiftData
import SwiftUI

struct HistoricoView: View {
    @Environment(\.modelContext) var modelContext
    @Query var projetos: [Projeto]
    
    var body: some View {
        VStack {
            Button("add", action: addPalavras)
            List {
                ForEach(projetos) { projeto in
                    VStack {
                        Text(projeto.palavraChave)
                    }
                    
                }
                .onDelete(perform: deleteProject)

            }
        }
    }
    
    func addPalavras() {
        let palavraUm = Projeto(palavraChave: "cat", gerados: ["uma", "dois"], favoritos: ["uma", "dois"])
        let palavradois = Projeto(palavraChave: "cat", gerados: ["uma", "dois"], favoritos: ["uma", "dois"])
        
        modelContext.insert(palavraUm)
        modelContext.insert(palavradois)
    }
    
    func deleteProject( _ indexSet: IndexSet) {
        for index in indexSet {
            let projeto = projetos[index]
            modelContext.delete(projeto)
        }
    }
}

#Preview {
    HistoricoView()
}
