//
//  PruebaDeImagen.swift
//  GuessTheFlag
//
//  Created by Matias Palmieri on 02/07/2023.
//

import SwiftUI
import UIKit

//class ImageLoader: ObservableObject {
//    @Published var image: UIImage?
//
//    func loadImageFromEndpoint() {
//        // Simulación de una solicitud a un endpoint que tarda unos segundos
//        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
//            // Genera la imagen a partir del endpoint
//            let generatedImage = self.generateImage()
//
//            DispatchQueue.main.async {
//                // Actualiza la propiedad image en el hilo principal
//                self.image = generatedImage
//            }
//        }
//    }
//
//    private func generateImage() -> UIImage {
//        // Lógica para generar la imagen
//        // ...
//        return UIImage(named: "exampleImage")!
////        return UIImage(systemName: "star")!
//    }
//}
//
//struct PruebaDeImagen: View {
//    @ObservedObject var imageLoader = ImageLoader() // Utiliza @ObservedObject
//
//    var body: some View {
//        VStack {
//            if let image = imageLoader.image {
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//            } else {
//                Text("Cargando imagen...")
//            }
//        }
//        .onAppear {
//            imageLoader.loadImageFromEndpoint()
//        }
//    }
//}
//
//struct PruebaDeImagen_Previews: PreviewProvider {
//    static var previews: some View {
//        PruebaDeImagen()
//    }
//}

struct asss: View {
    
    let myCustomColor = Color(
            red: Double(0x02) / 255,
            green: Double(0x2A) / 255,
            blue: Double(0x9A) / 255
        )
    
    let myCustomColorTwo = Color(
            red: Double(0xFA) / 255,
            green: Double(0xFA) / 255,
            blue: Double(0xFA) / 255
        )
    
    
    
    public var body: some View {
        
        ZStack(alignment: .top) {
            HeaderCurveRepresentable(offsetOval: 0.6, fillColor: .blue)
                .frame(height: UIScreen.main.bounds.height * 0.29)
                .edgesIgnoringSafeArea(.all)
                
                
            
            VStack {
                Spacer()
                VStack {
                    Spacer()
                    VStack {
                        //TODO: ACA VA LA IMAGEN CON EL RECUADRO CON SOMBRA
                        
                    }
                    .frame(width: 300, height: 300)
                    .background(Color(.white))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 2)
                    
                    VStack {
                        Text("HOLA")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                        Text("HOLA")
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 10)
                    }
                    .padding(30)
                    Spacer()
                    VStack {
                        Button(action: {
                                    // Acción que se ejecutará al presionar el botón
                                    print("¡Botón presionado!")
                                }) {
                                    Text("Presionar")
                                        .font(.title)
                                        .foregroundColor(.white)
                                        .padding()
                                }
                                .background(Color.blue) // Establecer el fondo azul
                                .cornerRadius(10)
                    }
                }
            }
        }
    }
}


struct HeaderCurveRepresentable: UIViewRepresentable {
    var offsetOval: Double = 0.6
    var fillColor: UIColor = .blue
    
    func makeUIView(context: Context) -> HeaderCurveF {
        let headerCurve = HeaderCurveF()
        headerCurve.offsetOval = offsetOval
        headerCurve.fillColor = fillColor
        return headerCurve
    }
    
    func updateUIView(_ uiView: HeaderCurveF, context: Context) {
        // No se necesita ninguna implementación adicional para este ejemplo
        uiView.offsetOval = offsetOval
        uiView.fillColor = fillColor
        uiView.setNeedsDisplay()
    }
}

struct asss_Previews: PreviewProvider {
    static var previews: some View {
        asss()
    }
}


@IBDesignable class HeaderCurveF: UIView {
    
    @IBInspectable var offsetOval: Double = 0.6
    @IBInspectable var fillColor: UIColor = .blue
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        drawOval()
    }
    
    override func draw(_ rect: CGRect) {
        drawOval()
        fillColor.setFill()
        UIRectFill(rect)
    }
    
    private func drawOval() {
        let screenWidth: CGFloat = frame.width
        let offset: CGFloat = screenWidth * CGFloat(offsetOval)
        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: screenWidth, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2,
                                        y: bounds.origin.y, width: screenWidth + offset,
                                        height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        
        layer.mask = maskLayer
    }
}
