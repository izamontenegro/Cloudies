//
//  Botoes.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 19/06/24.
//

import SwiftUI

struct Botoes: View {
    @State var cor: String = "ROSA"
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 170.33, height: 76.45)
            .foregroundStyle(Color(cor))
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
            }
    }
}

#Preview {
    Botoes()
}
