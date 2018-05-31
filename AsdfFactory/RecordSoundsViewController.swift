//
//  RecordSoundsViewController.swift
//  AsdfFactory
//
//  Created by Ramirez Paul E on 5/24/18.
//  Copyright © 2018 Ramirez Paul E. All the rights reserved, Bro.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecorder: AVAudioRecorder!
    
    @IBOutlet weak var startAudio: UIButton!
    @IBOutlet weak var stopRecording: UIButton!
    @IBOutlet weak var audioButtonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
                stopRecording.isEnabled = false
    }

    @IBAction func startAudio(_ sender: Any) {
        startAudio.isEnabled = false
        audioButtonLabel.text = "Recording in Progress, Bro"
        stopRecording.isEnabled = true
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        startAudio.isEnabled = true
        audioButtonLabel.text = "Start Recording, Bro"
        stopRecording.isEnabled = false
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not saved")
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            _ = segue.destination as! PlaySoundsViewController
            _ = sender as! URL
//            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
}

