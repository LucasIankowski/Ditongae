//
//  TurmaModel.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 18/11/21.
//

import Foundation

struct Turma: Codable {
    var nome: String
    var senha: String
    var numeroDeAlunos: Int
    var estudantes: [Estudante]
}

