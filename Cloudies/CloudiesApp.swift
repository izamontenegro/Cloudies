//
//  CloudiesApp.swift
//  Cloudies
//
//  Created by Izadora de Oliveira Albuquerque Montenegro on 11/06/24.
//

import SwiftData
import SwiftUI
import GoogleGenerativeAI

@main
struct CloudiesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Projeto.self)
    }
}
