//
//  ViewController.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - UIElements
    public lazy var voiceSelectionLabel: UILabel = {
        let label = UILabel.createLabel(text: "#1 - Select Voice")
        return label
    }()
    
    public lazy var femaleVoiceButton: UIButton = {
        let button = UIButton.createButton(title: "Female Voice", bgColor: UIColor.purple)
        button.addTarget(self, action: #selector(femaleVoiceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    public lazy var maleVoiceButton: UIButton = {
        let button = UIButton.createButton(title: "Male Voice", bgColor: UIColor.systemTeal)
        button.addTarget(self, action: #selector(maleVoiceButtonTapped), for: .touchUpInside)
        return button
    }()
    
    public lazy var enterPitchLabel: UILabel = {
        let label = UILabel.createLabel(text: "#2 - Enter Pitch")
        return label
    }()
    
    public lazy var pitchTextField: UITextField = {
        let textField = UITextField.createTextField(delegate: self, placeholderText: " Enter Pitch otherwise Pitch is 0")
        textField.addNumericAccessory(addPlusMinus: true, useNumberPad: true)
        return textField
    }()
    
    public lazy var enterShiftLabel: UILabel = {
        let label = UILabel.createLabel(text: "#3 - Enter Shift")
        return label
    }()
    
    public lazy var shiftTextField: UITextField = {
        let textField = UITextField.createTextField(delegate: self, placeholderText: " Enter Shift otherwise Shift is 0")
        textField.addNumericAccessory(addPlusMinus: true, useNumberPad: true)
        return textField
    }()
    
    public lazy var playAndStopLabel: UILabel = {
        let label = UILabel.createLabel(text: "#4 - Press Play or Stop")
        return label
    }()
    
    public lazy var playButton: UIButton = {
        let button = UIButton.createButton(title: "Play", bgColor: UIColor.blue)
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        return button
    }()
    
    public lazy var stopButton: UIButton = {
        let button = UIButton.createButton(title: "Stop", bgColor: UIColor.red)
        button.addTarget(self, action: #selector(stopButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Ivars
    public var voiceFileName: String?
    
    private var isPlayerPlaying = false
    
    private var pitch: Float = 0
    private var shift: Float = 0
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        useFemaleVoice()
        
        setupUILayout()
        
        addDismissKeyboardTapGesture()
    }
}

// MARK: - Play AKAudioPlayer
extension ViewController {
    
    private func playAudioPlayer() {
        
        if isPlayerPlaying { return }
        
        guard let voiceFileName = voiceFileName else {
            print("Voice File is Nil")
            return
        }
    }
}

// MARK: - Stop AKAudioPlayer
extension ViewController {
    
    private func stopAudioPlayer() {
        
        isPlayerPlaying = false
    }
}

// MARK: - Button Target Actions
extension ViewController {
    
    @objc private func maleVoiceButtonTapped() {
        
        useFemaleVoice()
    }
    
    @objc private func femaleVoiceButtonTapped() {
        
        useMaleVoice()
    }
    
    @objc private func playButtonTapped() {
        
        playAudioPlayer()
    }
    
    @objc private func stopButtonTapped() {
        
        stopAudioPlayer()
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        if isPlayerPlaying { return false }
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == pitchTextField {
            
            if textField.text == "" {
                pitch = 0
                return
            }
            
            guard let text = textField.text, let safeText = Float(text) else { return }
            
            pitch = safeText
        }
        
        if textField == shiftTextField {
            
            if textField.text == "" {
                shift = 0
                return
            }
            
            guard let text = textField.text, let safeText = Float(text) else { return }
            
            shift = safeText
        }
    }
}
