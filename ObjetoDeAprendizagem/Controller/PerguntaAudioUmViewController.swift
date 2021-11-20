//
//  PerguntaAudioUmViewController.swift
//  ObjetoDeAprendizagem
//
//  Created by Lucas Iankowski Corrêa da Silva on 20/11/21.
//

import Foundation
import UIKit
import AVFoundation

class PerguntaAudioUmViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var startRecording: UIButton!
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    var audioPlayer: AVAudioPlayer!
    
    var numberOfRecords = 0
    
    var nomeDoArquivo = "primeiroAudio"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        recordingSession = AVAudioSession.sharedInstance()
        
        if let number:Int = UserDefaults.standard.object(forKey: nomeDoArquivo) as? Int{
            
        }
            
        AVAudioSession.sharedInstance().requestRecordPermission{ (hasPermission) in
            if hasPermission{
                print("Microfone permitido pelo usuário")
            }else{
                print("Microfone não permitido pelo usuário")
            }
        }
    }
    
    @IBAction func record(_ sender: Any) {
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
        }else{
            audioRecorder.stop()
            audioRecorder = nil
            //aqui era numberOfRecords
            UserDefaults.standard.set(0, forKey: nomeDoArquivo)
            startRecording.setImage(UIImage(systemName: "play.fill"), for: .normal)
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
