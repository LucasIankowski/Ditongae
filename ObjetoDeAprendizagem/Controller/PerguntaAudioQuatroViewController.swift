//
//  PerguntaAudioQuatroViewController.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 20/11/21.
//

import Foundation
import UIKit
import AVFoundation

class PerguntaAudioQuatroViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var startRecording: UIButton!
    @IBOutlet weak var listenButton: UIButton!
    
    @IBOutlet weak var correctImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    var numberOfRecords = 0
    
    var nomeDoArquivo = "quartoAudio"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordingSession = AVAudioSession.sharedInstance()
        
        //Se existir audio persistido no sistema entao deixa passar
        //senão o aluno é obrigado a gravar um áudio para liberar
        if let number:Int = UserDefaults.standard.object(forKey: nomeDoArquivo) as? Int{
            if number == 0{
                listenButton.isEnabled = true
                continueButton.isEnabled = true
                correctImage.isHidden = false
            }
        }else{
            listenButton.isEnabled = false
            correctImage.isHidden = true
            continueButton.isEnabled = false
        }
        
        //solicita a permissão de áudio pro aluno
        AVAudioSession.sharedInstance().requestRecordPermission{ (hasPermission) in
            if hasPermission{
                print("Microfone permitido pelo usuário")
            }else{
                print("Microfone não permitido pelo usuário")
            }
        }
    }
    
    @IBAction func record(_ sender: Any) {
        //Começa a gravar o áudio
        if audioRecorder == nil{
            let filename = getDirectory().appendingPathComponent("\(nomeDoArquivo).m4a")
            let settings = [AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVSampleRateKey: 12000, AVNumberOfChannelsKey: 1, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
            do{
                audioRecorder = try AVAudioRecorder(url: filename, settings: settings)
                audioRecorder.delegate = self
                audioRecorder.record()
                
                startRecording.setImage(UIImage(systemName: "stop.fill"), for: .normal)
            }catch{
                displayAlert(title: "Erro", message: "Não foi possível gravar o seu áudio")
            }
        //para de gravar o áudio
        }else{
            audioRecorder.stop()
            audioRecorder = nil
            //aqui era numberOfRecords
            UserDefaults.standard.set(0, forKey: nomeDoArquivo)
            startRecording.setImage(UIImage(systemName: "mic.fill"), for: .normal)
            listenButton.isEnabled = true
            correctImage.isHidden = false
            continueButton.isEnabled = true
        }
    }
    
    @IBAction func listenAudio(_ sender: Any) {
        let path = getDirectory().appendingPathComponent("\(nomeDoArquivo).m4a")
        
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: path)
            audioPlayer.play()
        }catch{
            displayAlert(title: "Atenção", message: "Primeiro grave a sua resposta em áudio no botão da direita para depois escutá-la.")
        }
    }
    
    
    func getDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        return documentDirectory
    }
    
    func displayAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
