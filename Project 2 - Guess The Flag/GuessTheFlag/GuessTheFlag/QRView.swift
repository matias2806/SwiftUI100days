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
        NavigationView {
            VStack{
                Text("HOLA MUNDO")
                Text("HOLA MUNDO")
                Text("HOLA MUNDO")
            }
            .navigationBarItems(
                leading:
                    Button(action: {
                        // Acción del botón izquierdo
                    }) {
                        Image(systemName: "arrow.left")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.green),
                trailing:
                    Button(action: {
                        // Acción del botón derecho
                    }) {
                        Image(systemName: "gear")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundColor(.red)
            )
        }
    }
}

struct HeaderCurve: View {
    let offsetOval: CGFloat = 0.6
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Fondo del header
                Color.blue
                
                // Curva superior
                Path { path in
                    path.move(to: CGPoint(x: 0, y: geometry.size.height))
                    path.addLine(to: CGPoint(x: geometry.size.width , y: geometry.size.height ))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height * (1 - offsetOval)))
                    path.addQuadCurve(to: CGPoint(x: 0, y: geometry.size.height * (1 - offsetOval)), control: CGPoint(x: geometry.size.width / 2, y: geometry.size.height + 100))
                }
                .fill(Color.white)
                .edgesIgnoringSafeArea(.top)
            }
        }
    }
    
    private func drawOval() {
//        let screenWidth: CGFloat = frame.width
//        let offset: CGFloat = screenWidth * CGFloat(offsetOval)
//        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: screenWidth, height: bounds.size.height / 2)
//        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
//        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2,
//                                        y: bounds.origin.y, width: screenWidth + offset,
//                                        height: bounds.size.height)
//        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
//        rectPath.append(ovalPath)
//        let maskLayer: CAShapeLayer = CAShapeLayer()
//        maskLayer.frame = bounds
//        maskLayer.path = rectPath.cgPath
//
//        layer.mask = maskLayer
    }
}





struct QRView_Previews: PreviewProvider {
    static var previews: some View {
        QRView()
    }
}
