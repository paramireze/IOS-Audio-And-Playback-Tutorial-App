//
//  ViewController.swift
//  AsdfFactory
//
//  Created by Ramirez Paul E on 5/24/18.
//  Copyright © 2018 Ramirez Paul E. All the rights reserved, Bro.
//

import UIKit

class ViewController: UIViewController {

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startAudio(_ sender: Any) {
        startAudio.isEnabled = false
        audioButtonLabel.text = "Recording in Progress, Bro"
        stopRecording.isEnabled = true
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        startAudio.isEnabled = true
        audioButtonLabel.text = "Start Recording, Bro"
        stopRecording.isEnabled = false
    }
    
}

