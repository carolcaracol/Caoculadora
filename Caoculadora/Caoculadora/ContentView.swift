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
    @State var failiedInput = false
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 20.0) {
                    Text("Qual a idade do seu cão")
                        .font(.header5)
                    VStack(alignment: .leading, spacing: 8.0) {
                        
                        
                        Text("Anos")
                            .font(.body1)
                        TextField(
                            "Digite a idade do seu cão em anos humanos",
                            value: $years,
                            format: .number)
                    }
                    
                    
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
                            .font(.body1)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        Text("\(result) anos")
                            .contentTransition(.numericText())
                            .font(.display)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        
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
                            Color.azulzinho
                            Text("Cãocular")
                                .foregroundStyle(.white)
                            
                        }
                    })
                    .cornerRadius(10)
                    .frame(height: 50)
                    
                }
                .containerRelativeFrame(.vertical)
                .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                    .fontDesign(.rounded)
                    .padding()
                    .bold()
                
                    .navigationTitle("cãoculadora")
                    .toolbarBackground(.visible, for: .navigationBar)
                    .toolbarBackground(.azulzinho, for: .navigationBar)
                    .toolbarColorScheme(.dark, for: .navigationBar)
            }
        }
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
        
        withAnimation(.easeIn.speed(0.5)){
            result = porteSelecionado.conversaoDeIdade(anos: years, meses: months)
        }
    }
}

#Preview {
    ContentView()
}
