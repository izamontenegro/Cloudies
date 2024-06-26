//
//  CardsHistorico.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct CardsHistorico: View {
    @State var cor: String = ""
    @State var ferramenta: String = ""
    @State var texto: String = ""
    @State var titulo: String = ""
    
    var body: some View {
        VStack {
            Text(titulo)
                .font(.title2)
                .frame(maxWidth: 370, alignment: .leading)
                .padding(.top, 15)
                .padding(.leading)
            Text(texto)
                .font(.subheadline)
                .frame(maxWidth: 370, alignment: .leading)
                .padding(.leading)
        }
        .padding(.bottom, 34.72)
        .frame(width: 358.23, height: 104)
        .background(Color(cor))
        .cornerRadius(20)
        .shadow(radius: 4)

        .onAppear {
                    decidircor()
                }
    }
    
    private func decidircor() {
            switch ferramenta {
            case "Brainstorm":
                cor = "AZUL"
            case "Problematicas":
                cor = "AMARELO"
            case "Conexoes":
                cor = "ROSA"
            default:
                cor = "AZUL"
            }
        }
}

#Preview {
    CardsHistorico(ferramenta: "Conexoes", texto: "Qualquer bosta", titulo: "Coisa")
}
