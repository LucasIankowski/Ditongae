//
//  BackendData.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 20/11/21.
//

import Foundation

class Backend: Codable {
    var professores: [Professor]
    init(professores: [Professor]) {
        self.professores = professores
   }
}
