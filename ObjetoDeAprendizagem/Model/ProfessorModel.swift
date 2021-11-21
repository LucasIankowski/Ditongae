//
//  ProfessorModel.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 20/11/21.
//

import Foundation

class Professor: Codable {
    var email: String
    var turmas: [Turma]
    init(email: String, turmas: [Turma]) {
        self.email = email
        self.turmas = turmas
   }
}
