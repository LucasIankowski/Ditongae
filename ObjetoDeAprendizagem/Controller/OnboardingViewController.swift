//
//  ViewController.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 26/10/21.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Create Note
        if UserDefaults.standard.data(forKey: "backend") == nil{
            let backend = Backend(professores: [])
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Note
                let data = try encoder.encode(backend)
                
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "backend")
                
            } catch {
                print("Unable to Encode Note (\(error)) =========")
            }
        }
        // Create estudante
        if UserDefaults.standard.data(forKey: "novoEstudante") == nil{
            let estudante = Estudante(nome: "", respostaAudioUm: false, respostaAudioDois: false, respostaAudioTres: false, respostaAudioQuatro: false, respostaUm: "", respostaDois: "", respostaTres: "", respostaQuatro: "", respostaCinco: "", respostaSeis: "", respostaSete: "")
            
            do {
                // Create JSON Encoder
                let encoder = JSONEncoder()
                
                // Encode Note
                let data = try encoder.encode(estudante)
                
                // Write/Set Data
                UserDefaults.standard.set(data, forKey: "novoEstudante")
                
            } catch {
                print("Unable to Encode Note (\(error))")
            }
        }
    }
}

