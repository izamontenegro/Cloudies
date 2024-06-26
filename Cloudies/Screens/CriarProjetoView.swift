//
//  CriarProjetoView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 24/06/24.
//

import SwiftUI

struct CriarProjetoView: View {
    @State var ferramenta: String = "Brainstorm"
    @State var cor: String = "AZUL"
    @State var nomeDoProjeto: String = ""
    @State var temaPrincipal: String = ""
    @State var recorteTematico: String = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 357, height: 222.76)
                .foregroundStyle(.gray)
                .padding(.bottom, 32)
            
            VStack(spacing: 12) {
                VStack {
                    Text("Nome do projeto")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.leading, -178)
                    TextField("", text: $nomeDoProjeto)
                        .padding()
                        .frame(width: 357, height: 39)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 357, height: 39)
                        )
                        .onChange(of: nomeDoProjeto) { newValue, _ in
                            if newValue.count > 25 {
                                nomeDoProjeto = String(newValue.prefix(25))
                            }
                        }
                    
                    Text("Nome do projeto. Ex.: Projeto de Arquitetura.")
                    
                        .padding(.leading, -81)
                        .font(.footnote)
                        .foregroundStyle(.cinzaCriacao)
                }
                
                VStack {
                    Text("Tema Principal")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.leading, -178)

                    TextField("", text: $temaPrincipal)

                        .padding()
                        .frame(width: 357, height: 39)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 357, height: 39)
                        )
                        .onChange(of: temaPrincipal) { newValue, _ in
                            if newValue.count > 15 {
                                temaPrincipal = String(newValue.prefix(15))
                            }
                        }
                    
                    Text("Tema em que haverá exploração de conteúdo. Ex: Jardim.")
                    
                        .padding(.leading, -8)
                        .font(.footnote)
                        .foregroundStyle(.cinzaCriacao)
                }
                
                VStack {
                    Text("Recorte Temático")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .padding(.leading, -177)

                    TextField("", text: $recorteTematico)

                        .padding()
                        .frame(width: 357, height: 39)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .frame(width: 357, height: 39)
                        )
                        .onChange(of: recorteTematico) { newValue, _ in
                            if newValue.count > 15 {
                                recorteTematico = String(newValue.prefix(15))
                            }
                        }
                    
                    Text("Contexto do tema. Ex: Paisagismo, irrigação, praticidade.")
                    
                        .padding(.leading, -8)
                        .font(.footnote)
                        .foregroundStyle(.cinzaCriacao)
                }
                .padding(.bottom, 22)
                
                NavigationLink {
                    switch ferramenta {
                    case "BrainStorm":
                        TelaBrainStorm(titulo: nomeDoProjeto, palavraEntrada: temaPrincipal, recorteTematico: recorteTematico)
                    case "Problemáticas":
                        ProblemasView(tipo: "Problemas", titulo: "animais", textoEntrada: "como passear", recorteTematico: "cachorro")
                    default:
                        ProblemasView(tipo: "Conexoes", titulo: "animais", textoEntrada: "como passear", recorteTematico: "cachorro")
                    }
                } label: {

                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 357, height: 63)
                            .foregroundStyle(Color(cor))
                            .shadow(radius: 4)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: 357, height: 63)
                            )
                        
                        Text("Vamos lá!")
                            .font(.title2)
                    }
                }
                .disabled(nomeDoProjeto.isEmpty || temaPrincipal.isEmpty)
                .buttonStyle(PlainButtonStyle())
            }
            
        }
        .navigationTitle(ferramenta)
    }
}

#Preview {
    CriarProjetoView()
}
