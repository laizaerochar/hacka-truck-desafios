//
//  ContentView.swift
//  aula5-laiza
//
//  Created by Turma01-11 on 23/04/26.
//
import SwiftUI

// base reutilizavel - d1 e d2 de hoje
struct ColorDetailView: View {
    // param que a view precisa receber para se construir
    var cor: Color
    var icone: String
    var texto: String
    
    var body: some View {
        ZStack {
            // preenche o fundo ignorando as áreas seguras
            cor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                // desenha o circulo preto com o ícone dentro
                ZStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 250, height: 250)
                    
                    Image(systemName: icone)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .foregroundColor(cor) // icone com a mesma cor do fundo
                }
            }
        }
    }
}

// icone d naveg
struct ListaView: View {
    var body: some View {
        NavigationStack {
            List {
                // chama a ColorDetailView passando os param
                NavigationLink(destination: ColorDetailView(cor: .pink, icone: "paintbrush.fill", texto: "Rosa")) {
                    Text("Item Rosa")
                }
                
                NavigationLink(destination: ColorDetailView(cor: .blue, icone: "paintbrush.pointed.fill", texto: "Azul")) {
                    Text("Item Azul")
                }
                
                NavigationLink(destination: ColorDetailView(cor: .gray, icone: "paintpalette.fill", texto: "Cinza")) {
                    Text("Item Cinza")
                }
            }
            .navigationTitle("Menu de Cores") // titulo acima da minha lista
        }
    }
}

// tela principal
struct ContentView: View {
    var body: some View {
        TabView {
            // renderiza a tela diretamente e inteira
            ColorDetailView(cor: .pink, icone: "paintbrush.fill", texto: "Rosa")
                .tabItem {
                    Label("Rosa", systemImage: "paintbrush.fill")
                }
            
            // igual, so q p azul
            ColorDetailView(cor: .blue, icone: "paintbrush.pointed.fill", texto: "Azul")
                .tabItem {
                    Label("Azul", systemImage: "paintbrush.pointed.fill")
                }
            
            // igual, so q cinza
            ColorDetailView(cor: .gray, icone: "paintpalette.fill", texto: "Cinza")
                .tabItem {
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
            
            // a lista d navegacao
            ListaView()
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
        }
        .tint(.blue) // deixa o icone azul
    }
}

#Preview {
    ContentView()
}
