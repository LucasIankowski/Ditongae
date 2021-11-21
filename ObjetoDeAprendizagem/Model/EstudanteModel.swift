//
//  EstudanteModel.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 18/11/21.
//

import Foundation

class Estudante: Codable{
    var nome: String
    var respostaAudioUm: Bool
    var respostaAudioDois: Bool
    var respostaAudioTres: Bool
    var respostaAudioQuatro: Bool
    var respostaUm: String
    var respostaDois: String
    var respostaTres: String
    var respostaQuatro: String
    var respostaCinco: String
    var respostaSeis: String
    var respostaSete: String
    
    init(nome: String, respostaAudioUm: Bool, respostaAudioDois: Bool, respostaAudioTres: Bool, respostaAudioQuatro: Bool, respostaUm: String, respostaDois: String, respostaTres: String, respostaQuatro: String, respostaCinco: String, respostaSeis: String, respostaSete: String) {
        self.nome = nome
        self.respostaAudioUm = respostaAudioUm
        self.respostaAudioDois = respostaAudioDois
        self.respostaAudioTres = respostaAudioTres
        self.respostaAudioQuatro = respostaAudioQuatro
        self.respostaUm = respostaUm
        self.respostaDois = respostaDois
        self.respostaTres = respostaTres
        self.respostaQuatro = respostaQuatro
        self.respostaCinco = respostaCinco
        self.respostaSeis = respostaSeis
        self.respostaSete = respostaSete
   }
}
