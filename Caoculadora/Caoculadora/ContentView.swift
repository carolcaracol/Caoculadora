//
//  ContentView.swift
//  Caoculadora
//
//  Created by Ana Carolyne Alves Costa on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int? = nil
    @State var months: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão")
            
            Text("Anos")
            TextField(
                "Digite a idade do seu cão em anos humanos",
                value: $years,
                format: .number)
           
            Text("Meses")
            TextField("e quantos meses alem disso ele tem?",
                      value: $months,
                      format: .number)
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
        .fontDesign(.rounded)
        .bold()
    }
}

#Preview {
    ContentView()
}
