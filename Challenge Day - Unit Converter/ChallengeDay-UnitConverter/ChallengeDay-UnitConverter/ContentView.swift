//
//  ContentView.swift
//  ChallengeDay-UnitConverter
//
//  Created by Matias Palmieri on 13/06/2023.
//

import SwiftUI

enum ConversionCategory: String, CaseIterable {
    case temperatura = "Temperatura"
    case distancia = "Distancia"
    case tiempo = "Tiempo"
    case litros = "Litros"
}

enum TemperatureUnit: String, CaseIterable {
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    case kelvin = "Kelvin"
}

enum DistanceUnit: String, CaseIterable {
    case kilometros = "Kilómetros"
    case pies = "Pies"
    case yardas = "Yardas"
    case millas = "Millas"
}

enum TimeUnit: String, CaseIterable {
    case segundos = "Segundos"
    case minutos = "Minutos"
    case horas = "Horas"
    case dias = "Días"
}

enum LitersUnit: String, CaseIterable {
    case milimetros = "Milímetros"
    case litros = "Litros"
    case tazas = "Tazas"
    case pintas = "Pintas"
    case galones = "Galones"
}

struct ContentView: View {
    func convertToUnitTemperature(_ value: Double, from unit: String, to targetUnit: String) -> Double {
        switch (unit, targetUnit) {
        case ("Celsius", "Fahrenheit"):
            return (value * 9/5) + 32
        case ("Celsius", "Kelvin"):
            return value + 273.15
        case ("Fahrenheit", "Celsius"):
            return (value - 32) * 5/9
        case ("Fahrenheit", "Kelvin"):
            return (value + 459.67) * 5/9
        case ("Kelvin", "Celsius"):
            return value - 273.15
        case ("Kelvin", "Fahrenheit"):
            return (value * 9/5) - 459.67
        default:
            return 0
        }
    }

    func convertToUnitDistance(_ value: Double, from unit: String, to targetUnit: String) -> Double {
        switch (unit, targetUnit) {
        case ("Kilómetros", "Pies"):
            return value * 3280.84
        case ("Kilómetros", "Yardas"):
            return value * 1093.61
        case ("Kilómetros", "Millas"):
            return value * 0.621371
        case ("Pies", "Kilómetros"):
            return value / 3280.84
        case ("Pies", "Yardas"):
            return value / 3
        case ("Pies", "Millas"):
            return value / 5280
        case ("Yardas", "Kilómetros"):
            return value / 1093.61
        case ("Yardas", "Pies"):
            return value * 3
        case ("Yardas", "Millas"):
            return value / 1760
        case ("Millas", "Kilómetros"):
            return value / 0.621371
        case ("Millas", "Pies"):
            return value * 5280
        case ("Millas", "Yardas"):
            return value * 1760
        default:
            return 0
        }
    }

    
    func convertToUnit(_ value: Double, from unit: String, to targetUnit: String) -> Double {
        switch (unit, targetUnit) {
        case ("Litros", "Milímetros"):
            return value * 1000
        case ("Litros", "Tazas"):
            return value * 4.22675
        case ("Litros", "Pintas"):
            return value * 2.11338
        case ("Litros", "Galones"):
            return value * 0.264172
        case ("Milímetros", "Litros"):
            return value / 1000
        case ("Tazas", "Litros"):
            return value / 4.22675
        case ("Pintas", "Litros"):
            return value / 2.11338
        case ("Galones", "Litros"):
            return value / 0.264172
        default:
            return 0
        }
    }
    
    func convertToSeconds(_ value: Double, from unit: String) -> Double {
           switch unit {
           case "Días":
               return value * 86400
           case "Horas":
               return value * 3600
           case "Minutos":
               return value * 60
           case "Segundos":
               return value
           default:
               return 0
           }
       }
       
       func convertFromSeconds(_ value: Double, to unit: String) -> Double {
           switch unit {
           case "Días":
               return value / 86400
           case "Horas":
               return value / 3600
           case "Minutos":
               return value / 60
           case "Segundos":
               return value
           default:
               return 0
           }
       }
    
    
    @State private var unit = 0.0
    @State private var inputValue: String = ""
    
    @State private var tipPercentage = 20
    
    @State private var selectedUnitStart = "Segundos"
    @State private var selectedUnitOutput = "Minutos"
    @State private var selectedCategory = ConversionCategory.tiempo
    
    var conversion: [String] {
        switch selectedCategory {
        case .temperatura:
            return TemperatureUnit.allCases.map { $0.rawValue }
        case .distancia:
            return DistanceUnit.allCases.map { $0.rawValue }
        case .tiempo:
            return TimeUnit.allCases.map { $0.rawValue }
        case .litros:
            return LitersUnit.allCases.map { $0.rawValue }
        }
    }
    
    var calculateConversion: Double {
        guard let value = Double(inputValue) else { return 0 }
        
        switch selectedCategory {
        case .temperatura:
            return convertToUnitTemperature(value, from: selectedUnitStart, to: selectedUnitOutput)
        case .distancia:
            return convertToUnitDistance(value, from: selectedUnitStart, to: selectedUnitOutput)
        case .tiempo:
            let inputInSeconds = convertToSeconds(value, from: selectedUnitStart)
            let outputValue = convertFromSeconds(inputInSeconds, to: selectedUnitOutput)
            return outputValue
        case .litros:
            return convertToUnit(value, from: selectedUnitStart, to: selectedUnitOutput)
        }
    }
    
    private let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }()

    var calculate: Double {

        return 2.0
    }
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Conversion Rate", selection: $selectedCategory) {
                        ForEach(ConversionCategory.allCases, id: \.self) { category in
                            Text(category.rawValue)
                        }
                    }.pickerStyle(.segmented)
                    
                    Text(selectedCategory.rawValue)
                } header: {
                    Text("Elije el tipo de conversión")
                }
                
                Section {
                    Picker("Tipo de dato de entrada", selection: $selectedUnitStart) {
                        ForEach(conversion, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Elije un tipo de dato de entrada")
                }
                
                Section {
                    TextField("Ingrese un número decimal", text: $inputValue)
                }
                
                Section {
                    Picker("Tipo de dato de entrada", selection: $selectedUnitOutput) {
                        ForEach(conversion, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Elije un tipo de dato de entrada")
                }
                
                Section {
                    Text(String(calculateConversion))
                    Text(calculateConversion, format: .number)
                } header: {
                    Text("Resultado")
                }

            }
            
//            Section {
//                Text(calculate, format: .number)
//            } header: {
//                Text("Amount per person")
//            }
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
