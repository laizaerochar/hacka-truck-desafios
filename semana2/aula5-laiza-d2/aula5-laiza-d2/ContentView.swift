//
//  ContentView.swift
//  aula5-laiza-d2
//
//  Created by Turma01-11 on 23/04/26.
//

import SwiftUI

// minha base ja do desafio de antes

struct ColorDetailView: View {
    var cor: Color
    var icone: String
    var texto: String
    
    var body: some View {
        ZStack {
            cor.ignoresSafeArea()
            
            VStack(spacing: 20) {
                ZStack {
                    Circle()
                        .fill(Color.black)
                        .frame(width: 250, height: 250)
                    
                    Image(systemName: icone)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .foregroundColor(cor)
                }
                
                Text(texto)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
    }
}

// desenha os quadrados coloridos da tela inicial
struct ColorSquareButton: View {
    var cor: Color
    var icone: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(cor)
                // a proporção 1:1 para ser um quadrado ne
                .aspectRatio(1.0, contentMode: .fit)
            
            Image(systemName: icone)
                .resizable()
                .scaledToFit()
                .frame(width: 60)
                .foregroundColor(.white)
        }
    }
}

// menu em grade
struct ContentView: View {
    // Define 2 colunas dividindo o espaço da tela
    let colunas = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // Pequeno texto "Cores" no topo
                Text("Cores")
                    .font(.footnote)
                    .foregroundColor(.blue)
                    .padding(.bottom, 5)
                
                // O Grid de 2x2
                LazyVGrid(columns: colunas, spacing: 20) {
                    
                    // botao1 rosa
                    NavigationLink(destination: ColorDetailView(cor: .pink, icone: "paintbrush.fill", texto: "Rosa")) {
                        ColorSquareButton(cor: .pink, icone: "paintbrush.fill")
                    }
                    
                    // botao2 azul
                    NavigationLink(destination: ColorDetailView(cor: .blue, icone: "paintbrush.pointed.fill", texto: "Azul")) {
                        ColorSquareButton(cor: .blue, icone: "paintbrush.pointed.fill")
                    }
                    
                    // botao3 cinza
                    NavigationLink(destination: ColorDetailView(cor: .gray, icone: "paintpalette.fill", texto: "Cinza")) {
                        ColorSquareButton(cor: .gray, icone: "paintpalette.fill")
                    }
                    
                    // botao4 lista
                    NavigationLink(destination: ColorDetailView(cor: .purple, icone: "list.bullet", texto: "Lista")) {
                        ColorSquareButton(cor: .purple, icone: "list.bullet")
                    }
                    
                }
                .padding() // 'espaco' nas bordas da tela
            }
            .navigationTitle("Menu de Cores")
            // titulo menor e centralizado no topo
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
