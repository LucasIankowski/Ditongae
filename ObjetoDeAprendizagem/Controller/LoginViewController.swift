//
//  LoginViewController.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 18/11/21.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var nomeAluno: UITextField!
    @IBOutlet weak var turma: UITextField!
    @IBOutlet weak var senha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loginExists() -> Bool{
        var turmas = loadTurmas()
        
        //turma de debug
        turmas.append(Turma(nome: "232", senha: "abc123", numeroDeAlunos: 0, estudantes: []))
        
        for turmaL in turmas{
            if turmaL.nome == turma.text! && turmaL.senha == senha.text!{
                return true
            }
        }
        return false
        
    }
    
    @IBAction func loginProcess(_ sender: Any) {
        if loginExists() && nomeAluno.hasText{
            performSegue(withIdentifier: "loginToPerguntas", sender: sender)
        }
        else if !nomeAluno.hasText{
            let alert = UIAlertController(title: "Erro", message: "Por favor, preencha o campo com o seu nome corretamente.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        else if !loginExists(){
            let alert = UIAlertController(title: "Erro", message: "A turma não existe, revise as informações junto ao seu professor.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
    }
    
    func loadTurmas() -> [Turma] {
        if let data = UserDefaults.standard.data(forKey: "turmas") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()

                // Decode Note
                let turmas = try decoder.decode([Turma].self, from: data)
                return turmas
            } catch {
                print("Unable to Decode Turmas (\(error))")
            }
        }
        return []
    }
}
