//
//  porte.swift
//  Caoculadora
//
//  Created by Ana Carolyne Alves Costa on 10/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno
    case medio
    case grande
    
    func conversaoDeIdade(anos: Int, meses: Int) -> Int{
        let result: Int
        let multiplicador: Int
        
        switch self {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8

        }
            result = anos * multiplicador + meses/12*7
            return result
    }

}

