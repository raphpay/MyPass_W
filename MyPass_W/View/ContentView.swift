//
//  ContentView.swift
//  MyPass_W
//
//  Created by Raphaël Payet on 17/05/2022.
//

import SwiftUI

enum ValueType {
    case characters, separators
}

struct ContentView: View {
    // TODO: Create a ViewModel
    @State private var generatedPassword: String = ""
    @State private var charactersValue: Double = 3
    @State private var charactersRange: ClosedRange<Double> = 1...40
    @State private var separatorValue: Double = 6
    @State private var separatorRange: ClosedRange<Double> = 1...10
    
    func decreaseValue(_ valueType: ValueType) {
        switch valueType {
        case .characters:
            charactersValue -= 1
        case .separators:
            separatorValue -= 1
        }
    }
    
    func increaseValue(_ valueType: ValueType) {
        switch valueType {
        case .characters:
            charactersValue += 1
        case .separators:
            separatorValue += 1
        }
    }
    
    func generatePassword() {
        print("generatePassword")
    }
    
    func copyPassword() {
        print("copyPassword")
    }
    
    // TODO: Create components
    var body: some View {
        VStack {
            AppLogo()
            
            PasswordTextField(generatedPassword: $generatedPassword)
            
            // Sliders
            VStack {
                Text("\(Int(charactersValue)) characters")
                    .font(.system(size: 26))
                HStack {
                    Button {
                        decreaseValue(.characters)
                    } label: {
                        Image(systemName: "minus")
                    }
                    Slider(value: $charactersValue, in: charactersRange)
                    Button {
                        increaseValue(.characters)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }.padding(.horizontal, 16)
            
            
            Spacer()
                .frame(height: 100)
            
            VStack {
                Text("Separator every \(Int(separatorValue)) characters")
                    .font(.system(size: 26))
                    .lineLimit(1)
                HStack {
                    Button {
                        decreaseValue(.separators)
                    } label: {
                        Image(systemName: "minus")
                    }
                    Slider(value: $separatorValue, in: separatorRange)
                    Button {
                        increaseValue(.separators)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }.padding(.horizontal, 16)
            
            
            Spacer()
                .frame(height: 100)
            
            // Buttons
            Button {
                generatePassword()
            } label: {
                Text("Generate")
                    .font(.system(size: 25))
                    .frame(width: 225, height: 55)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }
            
            Button {
                copyPassword()
            } label: {
                Text("Copy")
                    .font(.system(size: 25))
                    .frame(width: 225, height: 55)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
            }

            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
