//
//  PerguntaDoisViewController.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 20/11/21.
//

import UIKit

class PerguntaDoisViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func respostaSim(_ sender: Any) {
        var estudante: Estudante?
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "novoEstudante") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let notes = try decoder.decode(Estudante.self, from: data)
                estudante = notes
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        let novoEstudante = Estudante(nome: estudante!.nome, respostaAudioUm: true, respostaAudioDois: true, respostaAudioTres: true, respostaAudioQuatro: true, respostaUm: estudante!.respostaUm, respostaDois: "S", respostaTres: estudante!.respostaTres, respostaQuatro: estudante!.respostaQuatro, respostaCinco: estudante!.respostaCinco, respostaSeis: estudante!.respostaSeis, respostaSete: estudante!.respostaSete)
        
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(novoEstudante)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "notes")

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
        
    }
    
    @IBAction func respostaNao(_ sender: Any) {
        var estudante: Estudante?
        // Read/Get Data
        if let data = UserDefaults.standard.data(forKey: "novoEstudante") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let notes = try decoder.decode(Estudante.self, from: data)
                estudante = notes
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        
        let novoEstudante = Estudante(nome: estudante!.nome, respostaAudioUm: true, respostaAudioDois: true, respostaAudioTres: true, respostaAudioQuatro: true, respostaUm: estudante!.respostaUm, respostaDois: "N", respostaTres: estudante!.respostaTres, respostaQuatro: estudante!.respostaQuatro, respostaCinco: estudante!.respostaCinco, respostaSeis: estudante!.respostaSeis, respostaSete: estudante!.respostaSete)
        
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()

            // Encode Note
            let data = try encoder.encode(novoEstudante)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "notes")

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    
    
    }
}
