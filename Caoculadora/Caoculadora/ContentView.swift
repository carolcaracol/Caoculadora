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
    @State var result: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão")
                .font(.system(size: 24))
            
            Text("Anos")
            TextField(
                "Digite a idade do seu cão em anos humanos",
                value: $years,
                format: .number)
           
            Text("Meses")
            TextField("e quantos meses alem disso ele tem?",
                      value: $months,
                      format: .number)
            Text("porte")
            // aq vai ficar o segmented control

                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight:150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 20)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                ZStack{
                    Color.purple
                    /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        .foregroundStyle(.white)
                        
                }
            })
            .cornerRadius(10)
            .frame(height: 50)
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
