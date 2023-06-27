//
//  QRView.swift
//  GuessTheFlag
//
//  Created by Matias Palmieri on 27/06/2023.
//

import SwiftUI

struct QRView: View {
    
    func goToHome() {
        print("Go to the home")
    }
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.20784313725, green: 0.39215686274, blue: 0.99215686274)
, location: 0.99),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
//            Color.white.ignoresSafeArea()
            VStack{
                Spacer()
                VStack{
                    Image("qr")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 250, height: 250)
                        
                        
                }
                .frame(width: 300, height: 300)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                VStack{
                    Text("Mostrale este QR a tu cliente para que lo escanee")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .padding(30)
                    Text("Recordá verificar que ingrese el monto correcto")
                }
                Spacer()
                VStack{
                    Button("Volver al inicio", action: goToHome)
                }
                
            }
        }
    }
}

struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
