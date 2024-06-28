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
    @Binding var isFavorite: Bool
    @Binding var isFromUser: Bool
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 366, height: 74)
                    .foregroundStyle(.white)
                VStack {
                    Text(titulo)
                        .font(.system(size: 18))
                        .fontWeight(.medium)
                        .frame(width: 350, alignment: .leading)
                    Text(explicacao)
                        .font(.system(size: 15))
                        .frame(width: 350, alignment: .leading)
                    
                }
                .frame(width: 353, height: 74)
                .padding(.horizontal, 10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1.5)
                }
            }
            
            if isFavorite {
                Image("favRosa")
                    .frame(maxWidth: 26, maxHeight: 29)
                    .offset(x: 10, y: -10)
            }
            
            if isFromUser {
                Image("inputRoxo")
                    .frame(maxWidth: 28, maxHeight: 25)
                    .offset(x: 10, y: 10)
            }
        }
    }
        
}

