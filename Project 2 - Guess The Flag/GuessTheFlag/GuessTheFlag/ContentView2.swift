//
//  ContentView2.swift
//  GuessTheFlag
//
//  Created by Matias Palmieri on 21/06/2023.
//

import SwiftUI

struct ContentView2: View {
    @State private var showingAlert = false
    
    func executeDelete() {
        print("Now deleting…")
    }
    
    var body: some View {
        //Messages Alert
        
        VStack {
            Button("Show Alert") {
                showingAlert = true
            }
            .alert("Important message", isPresented: $showingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
            } message: {
                Text("Please read this.")
            }
            
            
            //        Buttons
            
            VStack {
                Button("Button 1") { }
                    .buttonStyle(.bordered)
                Button("Button 2", role: .destructive) { }
                    .buttonStyle(.bordered)
                Button("Button 3") { }
                    .buttonStyle(.borderedProminent)
                    .tint(.mint)
                Button("Button 4", role: .destructive) { }
                    .buttonStyle(.borderedProminent)
                Button {
                    print("Edit button was tapped")
                } label: {
                    Image(systemName: "pencil")
                }
                Button {
                    print("Edit button was tapped")
                } label: {
                    Label("Edit", systemImage: "pencil")
                }
            }
            
            
            //        Gradients
//                    LinearGradient(gradient: Gradient(colors: [.red, .black]), startPoint: .top, endPoint: .bottom)
//
//                    LinearGradient(gradient: Gradient(stops: [
//                            Gradient.Stop(color: .white, location: 0.35),
//                            Gradient.Stop(color: .black, location: 0.85),
//                        ]), startPoint: .top, endPoint: .bottom)
            
                    RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 80, endRadius: 200)
            
                    AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .topTrailing)
            
            //        Colors
            
            ZStack {
                VStack(spacing: 0) {
                    Color.red
                    Color.blue
                }
                
                Text("Your content")
                    .foregroundColor(.secondary)
                    .padding(50)
                    .background(.ultraThinMaterial)
            }
            .ignoresSafeArea()
            
            
            //        Intenta colocar varias pilas horizontales dentro de una sola pila vertical. ¿Puedes hacer una cuadrícula de 3x3?
            
            HStack {
                VStack {
                    HStack(spacing: 20) {
                        Text("1.1")
                    }
                    HStack(spacing: 20) {
                        Text("2.1")
                    }
                    HStack(spacing: 20) {
                        Text("3.1")
                        
                    }
                }
                VStack {
                    HStack(spacing: 20) {
                        Text("1.2")
                    }
                    HStack(spacing: 20) {
                        Text("2.2")
                    }
                    HStack(spacing: 20) {
                        Text("3.2")
                        
                    }
                }
                VStack {
                    HStack(spacing: 20) {
                        Text("1.3")
                    }
                    HStack(spacing: 20) {
                        Text("2.3")
                    }
                    HStack(spacing: 20) {
                        Text("3.3")
                        
                    }
                }
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
