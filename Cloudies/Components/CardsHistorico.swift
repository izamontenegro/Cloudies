//
//  CardsHistorico.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct CardsHistorico: View {
    @State var cor: String = ""
    @State var texto: String = ""
    @State var titulo: String = ""
    
    var body: some View {
        VStack {
            Text(titulo)
                .font(.title2)
                .padding(.top, 15)
                .padding(.trailing, 275)
            Text(texto)
                .font(.subheadline)
                .frame(maxWidth: 370, alignment: .leading)
                .padding(.leading)
        }
        .padding(.bottom, 34.72)
        .frame(width: 358.23, height: 104)
        .background(Color(cor))
        .cornerRadius(20)
        
    }
  
}

#Preview {
    CardsHistorico(cor: "AZUL", texto: "Qualquer bosta", titulo: "Coisa")
}
