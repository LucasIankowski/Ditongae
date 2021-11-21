//
//  TurmaModel.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 18/11/21.
//

import Foundation

class Turma: Codable{
    var nome: String
    var senha: String
    var numeroDeAlunos: Int
    var estudantes: [Estudante]
    init(nome: String, senha: String, numeroDeAlunos: Int, estudantes: [Estudante]) {
        self.nome = nome
        self.senha = senha
        self.numeroDeAlunos = numeroDeAlunos
        self.estudantes = estudantes
   }
}

