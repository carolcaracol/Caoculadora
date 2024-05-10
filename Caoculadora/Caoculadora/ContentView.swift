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
    @State var porteSelecionado: Porte = .pequeno
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão")
                .font(.header5)
            Divider()
            
            Text("Anos")
                .font(.body1)
            TextField(
                "Digite a idade do seu cão em anos humanos",
                value: $years,
                format: .number)
            
            Text("Meses")
                .font(.body1)
            TextField("e quantos meses alem disso ele tem?",
                      value: $months,
                      format: .number)
            Text("Porte")
                .font(.body1)
            
            Picker("porte", selection: $porteSelecionado){
                ForEach(Porte.allCases, id:\.self) { porte in
                    Text(porte.rawValue)
                        .tag(porte)
                }
        
            }
            .pickerStyle(.segmented)
            Divider()
                .background(.black)
            
            Spacer()
            if let result {
                Text("Seu cachorro tem em idade humana:")
                Text("\(result) anos")
                    .font(.display)
                
            } else {
                Image(ImageResource.clarinha)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight:150)
                    .frame(maxWidth: .infinity)
                    .shadow(radius: 20)
            }
         
                Spacer()
            Button(action: {processYears()}, label: {
                ZStack{
                    Color.purple
                    Text("Cãocular")
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
    
    func processYears() {
        guard
            let years,
            let months
        else{
            print("Preencha o campo de entrada")
            return
        }
        
        guard years > 0 || months > 0 else {
            print("algum campo tem que ser maior que 0")
            return
        }
        

        result = porteSelecionado.conversaoDeIdade(anos: years, meses: months)
        
    }
}

#Preview {
    ContentView()
}
