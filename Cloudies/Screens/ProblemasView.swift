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
        VStack {
            ZStack {
                Image("NuvemTituloRosa")
                Text("Palavra")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top)
            }
            .padding(.bottom, 28)
            
            ForEach(gerados, id: \.self) { problema in
                CardGeracaoTexto(titulo: problema, explicacao: "descricao do problema descrevendo um problema que existe")
            }
            
            HStack(spacing: 13.51) {
                Botoes()
                Botoes()
            }
            .padding(.top, 50)
        }
        .navigationBarTitle("Problemáticas", displayMode: .inline)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {
                    print("")
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                        .imageScale(.large)
                        .scaleEffect(1.1)
                })
                
                Button(action: {
                    print("")
                }, label: {
                    Image(systemName: "pencil.circle")
                        .imageScale(.large)
                        .scaleEffect(1.1)
                })
            }
            
        }
    }
}

#Preview {
    ProblemasView()
}
