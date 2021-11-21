//
//  CriarSalaViewController.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 20/11/21.
//

import UIKit

class CriarSalaViewController: UIViewController {
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
        if !nomeAluno.hasText{
            let alert = UIAlertController(title: "Atenção", message: "Por favor, preencha o campo com o seu nome corretamente.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        else if !turma.hasText || turma.text?.count ?? 5 < 5{
            let alert = UIAlertController(title: "Atenção", message: "Por favor, coloque um nome para a turma de pelo menos 5 dígitos para os alunos acessarem a turma.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        else if !senha.hasText || senha.text?.count ?? 5 < 3{
            let alert = UIAlertController(title: "Atenção", message: "Por favor, coloque uma senha de pelo menos 3 dígitos para os alunos acessarem a turma.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        else if loginExists(){
            let alert = UIAlertController(title: "Atenção", message: "Esta turma já existe, por favor escolha outro nome.", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
        }
        else if !loginExists() && nomeAluno.hasText{
            novaTurma()
            performSegue(withIdentifier: "criarSalatoSala", sender: sender)
        }
    }
    
    func novaTurma(){
        // Access Shared Defaults Object
        let userDefaults = UserDefaults.standard

        // Read/Get Array of Strings
        let backend: Backend = (userDefaults.object(forKey: "backend") as? Backend)!
        
        var professorExists = false
        // Append String to Array of Strings
        for professor in backend.professores{
            if professor.email == nomeAluno.text{
                professorExists = true
                professor.turmas.append(Turma(nome: turma.text ?? "", senha: senha.text ?? "", numeroDeAlunos: 0, estudantes: []))
            }
        }
        if professorExists == false{
            backend.professores.append(Professor(email: nomeAluno.text ?? "", turmas: [Turma(nome: turma.text ?? "", senha: senha.text ?? "", numeroDeAlunos: 0, estudantes: [])]))
        }
        
        // Write/Set Array
        userDefaults.set(backend, forKey: "backend")
        
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
