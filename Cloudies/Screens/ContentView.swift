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
            OnBoardingg0()
        }
    }
}

struct OnBoardingg0: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 40) {
                Text("Boas Vindas ao Cloudies! ")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                Image("primeiroOn")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                    .scaledToFill()
                
                Text("Aqui você vai encontrar inspirações  para seus projetos a partir das suas próprias ideias! Basta digitar palavras-chave e receber sugestões que vão turbinar sua criatividade.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.cinzaControl)
                        .frame(width: 68, height: 24)
                    HStack {
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                    }
                }
                
                .padding(.top, 35)
                NavigationLink(destination: OnBoardingg()) {
                    Text("Próximo")
                        .font(.footnote)
                    
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(7)
                        .shadow(radius: 5)
                    
                }
                
            }
            .padding(30)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct OnBoardingg: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 40) {
                Text("Faça uma chuva de ideias")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .fontWeight(.bold)
                
                Image("nuvemOnBoardingAmarela")
                    .resizable()
                    .ignoresSafeArea()
                    .scaledToFit()
                
                Text("Desenvolva sugestões para impulsionar o seu projeto inundando-o de criatividade.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .foregroundStyle(.cinzaControl)
                        .frame(width: 68, height: 24)
                    HStack {
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                        Circle()
                            .frame(width: 8)
                            .foregroundStyle(.black)
                            .opacity(0.1)
                    }
                }
                
                .padding(.top, 35)
                NavigationLink(destination: OnBoardingg2()) {
                    Text("Próximo")
                        .font(.footnote)
                    
                        .fontWeight(.medium)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                        .background(.white)
                        .cornerRadius(7)
                        .shadow(radius: 5)
                    
                }
                
            }
            .padding(30)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct OnBoardingg2: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 40) {
            Text("Descubra novos problemas")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            
            Image("nuvemProblema")
                .resizable()
                .ignoresSafeArea()
                .scaledToFit()
            
            Text("Atinja a centelha que você precisa para melhorar o mundo na velocidade de um relâmpago")
                .font(.body)
                .multilineTextAlignment(.center)
            
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.cinzaControl)
                    .frame(width: 68, height: 24)
                HStack {
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.black)
                        .opacity(0.1)
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.black)
                        .opacity(0.1)
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
            NavigationLink(destination: OnBoardingg3()) {
                Text("Próximo")
                    .font(.footnote)
                
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                    .background(.white)
                    .cornerRadius(7)
                    .shadow(radius: 5)
                
            }
            
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
    }
}

struct OnBoardingg3: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false

    var body: some View {
            
        VStack(alignment: .center, spacing: 40) {
            Text("Crie conexões temáticas")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            Spacer()
            Image("nuvemOnBoardingMultiplas")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: -30))
            Spacer()
            
            Text("Receba associações inesperadas e divertidas como as brisas soprando no verão")
                .font(.body)
                .multilineTextAlignment(.center)
        
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundStyle(.cinzaControl)
                    .frame(width: 68, height: 24)
                HStack {
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.black)
                        .opacity(0.1)
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.black)
                        .opacity(0.1)
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.black)
                        .opacity(0.1)
                    Circle()
                        .frame(width: 8)
                        .foregroundStyle(.black)
                }
            }
            
            Button {
                isOnboardingComplete = true
            } label: {
                Text("Vamos lá!")
                    .font(.footnote)
                
                    .fontWeight(.medium)
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, maxHeight: 50, alignment: .center)
                    .background(.white)
                    .cornerRadius(7)
                    .shadow(radius: 5)
            }
            
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
            
        }
    
            }

#Preview {
    ContentView()
}
