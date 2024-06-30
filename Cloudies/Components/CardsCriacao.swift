//
//  CardsCriacao.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 16/06/24.
//

import SwiftUI

struct CardsCriacao: View {
    @State var cor: String = ""
    @State var texto: String = ""
    @State var titulo: String = ""
    @State var espaco: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(titulo)
                    .font(.title2)
                    .padding(.top, 15)
                Spacer()
                Image("seta")
                    .padding(.top)
                    .padding(.trailing)
            }
            Text(texto)
                .font(.subheadline)
                .multilineTextAlignment(.leading)
        }
            .padding(.leading, 16)
            .padding(.trailing, 10)
            .frame(width: 358.23)
            .padding(.bottom, espaco)
            .background(Color(cor))
            .cornerRadius(20)
            .shadow(radius: 2)

    }
  
}

#Preview {
    CardsCriacao(
        cor: "AZUL",
        texto: """
        Permite que você estabeleça conexões com outros assuntos. Ferramenta importante no pensamento divergente e expansão de possibilidades.
        """,
    titulo: "Brainstorm",
    espaco: 30
    )
}
