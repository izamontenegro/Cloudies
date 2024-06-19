//
//  ProblemasView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct ProblemasView: View {
    @State var numeroDePalavrasGeradas: Int = 4
    @State var gerados: [String] = ["Texto de teste", "Texto de teste", "Texto de teste", "Texto de teste"]
    var body: some View {
        VStack (){
            ZStack {
                Image("NuvemTituloRosa")
                Text("Palavra")
                    .font(.largeTitle)
                    .padding(.top)
            }
            .padding(.bottom, 28)
            
            ForEach(gerados, id: \.self) { problema in
                CardGeracaoTexto(titulo: problema, explicacao: "descricao do problema descrevendo um problema que existe")
            }
            
            HStack(spacing: 13.51) {
                Botoes()
                Botoes()
                Botoes()
            }
            .padding(.top, 50)
        }
        
    }
}

#Preview {
    ProblemasView()
}
