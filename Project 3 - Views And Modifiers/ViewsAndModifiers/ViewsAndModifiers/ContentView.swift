//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Matias Palmieri on 27/06/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Hello, world!") {
                print(type(of: self.body))
            }
            .frame(width: 200, height: 200)
            .background(.red)
            Text("Hello, world!")
                .padding()
                .background(.red)
                .padding()
                .background(.blue)
                .padding()
                .background(.green)
                .padding()
                .background(.yellow)
            VStack {
                Text("Gryffindor")
                Text("Hufflepuff")
                    .font(.largeTitle.bold())
                Text("Ravenclaw")
                    .blur(radius: 0)
                Text("Slytherin")
            }
            .font(.title)
            .blur(radius: 2)
            VStack(spacing: 10) {
                Text("First")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
                
                Text("Second")
                    .font(.largeTitle)
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .clipShape(Capsule())
                
                CapsuleText(text: "First")
                    .background(.white)
                CapsuleText(text: "Second")
                    .background(.yellow)
            }
        }
    }
}

struct CapsuleText: View {
    var text: String

    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .foregroundColor(.white)
            .background(.blue)
            .clipShape(Capsule())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
