//
//  CriarProjetoView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 24/06/24.
//

import SwiftUI
import SwiftData

struct CriarProjetoView: View {
    @Environment(\.modelContext) var modelContext
    
    @Binding var navigationPath: NavigationPath
    
    @State var ferramenta: String = "BrainStorm"
    @State var imagem: String
    @State var cor: String = "AZUL"
    @State var nomeDoProjeto: String = ""
    @State var temaPrincipal: String = ""
    @State var recorteTematico: String = ""
    @Binding var brainstorm: GeracaoData
    @State var navegar = false
    @State var limiteCaract: Int = 25
    @State var title: String
    
    var body: some View {
        ScrollView {
            VStack {
                switch imagem {
                case "BrainStorm":
                    Image("imagemBrainstorm")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 276.48)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                case "Problemas":
                    Image("imagemProblematicas")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 290.06)
                        .padding(.top, 20)
                        .padding(.bottom, 10)
                case "Conexao":
                    Image("imagemConexao")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .padding(.vertical, 60)
                default:
                    ProblemasView(modelo: $brainstorm, navigationPath: $navigationPath)
                }
                
                
                
                VStack(spacing: 12) {
                    VStack(alignment: .leading) {
                        Text("Nome do projeto")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        TextField("", text: $nomeDoProjeto)
                            .padding()
                            .frame(width: 357, height: 39)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: 350, height: 39)
                            )
                            .onChange(of: nomeDoProjeto) { newValue, _ in
                                    if newValue.count > limiteCaract {
                                        nomeDoProjeto = String(newValue.prefix(limiteCaract))
                                    }
                                
                            }
                        
                        Text("Nome do projeto. Ex.: Projeto de Arquitetura.")
                            .font(.footnote)
                            .foregroundStyle(.cinzaCriacao)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Tema Principal")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        TextField("", text: $temaPrincipal)
                        
                            .padding()
                            .frame(width: 357, height: 39)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: 350, height: 39)
                            )
                            .onChange(of: temaPrincipal) { newValue, _ in
                                if newValue.count > 35 {
                                    temaPrincipal = String(newValue.prefix(35))
                                }
                            }
                        
                        Text("Tema em que haverá exploração de conteúdo. Ex: Jardim.")
                            .font(.footnote)
                            .foregroundStyle(.cinzaCriacao)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Recorte Temático")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        TextField("", text: $recorteTematico)
                        
                            .padding()
                            .frame(width: 357, height: 39)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .frame(width: 350, height: 39)
                            )
                        
                        Text("Contexto do tema. Ex: Paisagismo, irrigação, praticidade.")
                            .font(.footnote)
                            .foregroundStyle(.cinzaCriacao)
                    }
                    .padding(.bottom, 22)
                    
                    Button(action: {
                        brainstorm.palavraEntradaData = temaPrincipal
                        brainstorm.tituloData = nomeDoProjeto
                        brainstorm.tipo = ferramenta
                        brainstorm.recorteTematicoData = recorteTematico
                        modelContext.insert(brainstorm)
                        navigationPath.append(ferramenta)
                        navegar = true
                        
                    }, label: {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .frame(width: 350, height: 63)
                                .foregroundStyle(Color(cor))
                                .shadow(radius: 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                        .frame(width: 350, height: 63)
                                )
                            
                            Text("Vamos lá!")
                                .font(.title2)
                        }
                    }) .disabled(nomeDoProjeto.isEmpty || temaPrincipal.isEmpty)
                }
            }
            
            .onAppear {
                brainstorm = GeracaoData()
            }
            .buttonStyle(PlainButtonStyle())
        }
        .defaultScrollAnchor(.bottom)
        .navigationTitle(title)
        .toolbar(.hidden, for: .tabBar)
    }
    
}

//#Preview {
//    CriarProjetoView(brainstorm: GeracaoData)
//}
