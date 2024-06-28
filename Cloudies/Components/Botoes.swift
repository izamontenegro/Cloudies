//
//  Botoes.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct Botoes: View {
    @State var simbolo: String = "cloud.drizzle"
    @State var texto: String = "Gerar"

    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 170.33, height: 76.45)
            .foregroundStyle(.BRANCO)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
                VStack {
                    Image(systemName: simbolo)
                        .font(.system(size: 31))
                        .foregroundStyle(.black)
                    Text(texto)
                        .font(.callout)
                }
            }
    }
}

#Preview {
    Botoes()
}
