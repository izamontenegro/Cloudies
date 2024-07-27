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
        SplashScreen()
    }
}

struct OnBoardinggComeco: View {
    var body: some View {
        TabView {
            OnBoardingg0()
            OnBoardingg()
            OnBoardingg2()
            OnBoardingg3()
        }
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}
struct OnBoardingg0: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 40) {
                Text("Boas Vindas ao Cloudies! ")
                    .font(.largeTitle)
                    .padding(30)
                    .multilineTextAlignment(.center)
                
                Image("primeiroOn")
                    .ignoresSafeArea()
                   
                Text("Aqui você vai encontrar inspirações  para seus projetos a partir das suas próprias ideias! Basta digitar palavras-chave e receber sugestões que vão turbinar sua criatividade.")
                    .font(.body)
                    .padding(30)
                    .multilineTextAlignment(.center)
                
            }
            
        }
            .navigationBarBackButtonHidden(true)
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
                    .padding(.top, 35)
                
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
                .padding(.top, 35)
            
        }
        .padding(30)
        .navigationBarBackButtonHidden(true)
    }
}

struct OnBoardingg3: View {
    @AppStorage("isOnboardingComplete") private var isOnboardingComplete: Bool = false
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 80) {
            Text("Crie conexões temáticas")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .fontWeight(.bold)
            
            Image("nuvemOnBoardingMultiplas")
                .ignoresSafeArea()
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: -30))
            
            Text("Receba associações inesperadas e divertidas como as brisas soprando no verão")
                .font(.body)
                .multilineTextAlignment(.center)
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
