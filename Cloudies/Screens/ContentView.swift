//
//  ContentView.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        if isOnboardingComplete {
            MainView()
        } else {
            OnBoardingg()
        }
    }
}

struct OnBoardingg: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 368, height: 351)
                        .foregroundStyle(.AZUL)
                    
                    Image("ilustracaoOnboarding")
                }
                .padding()
                
                HStack {
                    Image("tijolo")
                    VStack { Text("Boas vindas ao Cloudies!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.trailing, 54)
                        Text("Aqui você vai encontrar ideias incríveis para os seus projetos a partir das suas próprias ideias! Basta digitar palavras-chave e receber sugestões que vão turbinar sua criatividade.")
                            .font(.callout)
                            .frame(width: 257, alignment: .leading)
                    }
                }
                
                NavigationLink(destination: OnBoardingg2()) {
                    Text("Próximo")
                        .font(.footnote)
                    
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .frame(width: 171, height: 28)
                        .background(.white)
                        .cornerRadius(7)
                        .shadow(radius: 5)
                }
                .padding(.top, 36)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.cinzaControl)
                        .frame(width: 48, height: 24)
                    HStack {
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                    }
                }
                .padding(.top, 35)
                
            }
        }
    }
}

struct OnBoardingg2: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false

    var body: some View {
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 400, height: 403)
                        .foregroundStyle(.AZUL)
                    Text("Texto que vai ter")
                }
                
                .padding(.top, -47)
                
                VStack {
                    Text("Faça uma chuva de ideias!")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ")
                        .padding(.top, -25)
                        .frame(width: 339, height: 66)
                        .font(.footnote)
                }
                .padding(.top, 10)
                HStack(spacing: 23) {
                    VStack(spacing: 31) {
                        Image("gerarNuvem")
                        Image("conexoesNuvem")
                        Image("problemasNuvem")
                    }
                    
                    VStack(spacing: 31) {
                        Text("Gere novas ideias")
                            .font(.subheadline)
                            .padding(.trailing, 64)
                        Text("Faça conexões entre ideias")
                            .font(.subheadline)
                        Text("Encontre Problemas")
                            .font(.subheadline)
                            .padding(.trailing, 47)
                    }
                }
                .padding(.top, 5)
            
                Button {
                    isOnboardingComplete = true
                } label: {
                    Text("Vamos lá!")
                        .font(.footnote)
                        .foregroundStyle(Color.black)
                        .frame(width: 171, height: 28)
                        .background(Color.white)
                        .cornerRadius(7)
                        .shadow(radius: 10)
                }
                
                .padding(.top, 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.cinzaControl)
                        .frame(width: 48, height: 24)
                    HStack {
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.top, 40)
                .padding(.bottom, 15)
            }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ContentView()
}
