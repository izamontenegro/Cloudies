//
//  CardGeracaoTexto.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct CardGeracaoTexto: View {
    @State var titulo: String = "Tema do problema"
    @State var explicacao: String = "Descricao do problema descrevendo um problema que existe mais palavras pra testar coisas tals"
    var body: some View {
        VStack {
            Text(titulo)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .frame(width: 350, alignment: .leading)
            Text(explicacao)
            .font(.system(size: 15))
            .frame(width: 350, alignment: .leading)
            
        }
        .frame(width: 350, height: 74)
        .padding(.leading, 10)
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.black, lineWidth: 1.5)
        }
    }
        
}

#Preview {
    CardGeracaoTexto()
}