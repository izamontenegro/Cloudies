//
//  CardGeracaoTexto.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct CardGeracaoTexto: View {
    @State var titulo: String = "Tema do problema"
    @State var explicacao: String = "Descricao do problema descrevendo um problema que existe mais palavras pra testar coisas e tals lala joao"
    var body: some View {
        VStack {
            Text(titulo)
                .font(.headline)
                .frame(width: 361, alignment: .leading)
            Text(explicacao)
                .font(.footnote)
            .frame(width: 361, alignment: .leading)
            
        }
        .frame(height:74)
        .padding(.leading, 10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black,  lineWidth: 2)
        }
    }
        
}

#Preview {
    CardGeracaoTexto()
}
