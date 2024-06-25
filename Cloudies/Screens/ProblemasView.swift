//
//  ProblemasView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct ProblemasView: View {
    @State var gerados: [String] = ["Texto de teste", "Texto de teste", "Texto de teste", "Texto de teste", "Texto de teste"]
    @State var nomeProjeto: String = "Projeto arquitetura"
    var body: some View {
        NavigationView {
            ZStack {
                Color.ROSA
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(height: 200)
                            .foregroundStyle(.white)
                            .padding(.top, -250)
                        Image("nuvemTopo")
                            .padding(.leading, 110)
                            .padding(.top, -60)
                        Text("palavra palavrinha")
                            .font(.title3)
                            .padding(.trailing, 200)
                            .padding(.bottom, 90)
                    }
                    .padding(.bottom)
                    
                    ScrollView {
                        ForEach(gerados, id: \.self) { problema in
                            CardGeracaoTexto(titulo: problema, explicacao: "descricao do problema descrevendo um problema que existe")
                        }
                    }
                    
                    HStack(spacing: 13.51) {
                        Button {
                            //
                        } label: {
                            Botoes(cor: "BRANCO")
                        }
                        
                        Button {
                            //
                        } label: {
                            Botoes(cor: "BRANCO", simbolo: "plus.bubble")
                        }
                    }
                    .padding(.top, 44)
                    
                }
                
            }
        }
        .toolbar {
            
            Button(action: {
                print("")
            }, label: {
                Image(systemName: "pencil.circle")
                    .imageScale(.medium)
                    .scaleEffect(1.1)
            })
        }
        .navigationTitle(nomeProjeto)
        .navigationBarTitleDisplayMode(.large)
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    ProblemasView()
}
