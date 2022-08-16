//
//  ViewController+Extensions.swift
//  AutoTuneSampler
//
//  Created by LanceMacBookPro on 8/10/22.
//

import UIKit

// MARK: - Set Voice
extension ViewController {
    
    public func useFemaleVoice() {
        
        guard let path = Bundle.main.path(forResource: "female-voice-1", ofType: "wav") else { return }
        let femaleVoiceUrl = URL(fileURLWithPath: path)
        conductor.femaleOrMaleFileUrl = femaleVoiceUrl
        
        femaleVoiceButton.layer.borderColor = UIColor.orange.cgColor
        maleVoiceButton.layer.borderColor = UIColor.clear.cgColor
    }
    
    public func useMaleVoice() {
        
        guard let path = Bundle.main.path(forResource: "male-voice-1", ofType: "wav") else { return }
        let maleVoiceUrl = URL(fileURLWithPath: path)
        conductor.femaleOrMaleFileUrl = maleVoiceUrl
        
        femaleVoiceButton.layer.borderColor = UIColor.clear.cgColor
        maleVoiceButton.layer.borderColor = UIColor.orange.cgColor
    }
}

// MARK: - Dismiss Keyboard
extension ViewController {
    
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - Gesture
extension ViewController {
    
    public func addDismissKeyboardTapGesture() {
        
        let dismissKeyboardTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(dismissKeyboardTapGesture)
    }
}

// MARK: - UILayout
extension ViewController {
    
    public func setupUILayout() {
        
        view.addSubview(voiceSelectionLabel)
        view.addSubview(maleVoiceButton)
        view.addSubview(femaleVoiceButton)
        
        view.addSubview(enterPitchLabel)
        view.addSubview(pitchTextField)
        
        view.addSubview(enterShiftLabel)
        view.addSubview(shiftTextField)
        
        view.addSubview(playAndStopLabel)
        view.addSubview(playButton)
        view.addSubview(stopButton)
        
        let padding: CGFloat = 20
        let buttonHeight: CGFloat = 50
        
        voiceSelectionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        voiceSelectionLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        voiceSelectionLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        
        femaleVoiceButton.topAnchor.constraint(equalTo: voiceSelectionLabel.bottomAnchor, constant: 2.5).isActive = true
        femaleVoiceButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        femaleVoiceButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        femaleVoiceButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        maleVoiceButton.topAnchor.constraint(equalTo: femaleVoiceButton.bottomAnchor, constant: padding).isActive = true
        maleVoiceButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        maleVoiceButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        maleVoiceButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        enterPitchLabel.topAnchor.constraint(equalTo: maleVoiceButton.bottomAnchor, constant: padding).isActive = true
        enterPitchLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        enterPitchLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        
        pitchTextField.topAnchor.constraint(equalTo: enterPitchLabel.bottomAnchor).isActive = true
        pitchTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        pitchTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        pitchTextField.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        enterShiftLabel.topAnchor.constraint(equalTo: pitchTextField.bottomAnchor, constant: padding).isActive = true
        enterShiftLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        enterShiftLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        
        shiftTextField.topAnchor.constraint(equalTo: enterShiftLabel.bottomAnchor).isActive = true
        shiftTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        shiftTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        shiftTextField.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        playAndStopLabel.bottomAnchor.constraint(equalTo: playButton.topAnchor, constant: -2.5).isActive = true
        playAndStopLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        playAndStopLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        
        playButton.bottomAnchor.constraint(equalTo: stopButton.topAnchor, constant: -padding).isActive = true
        playButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        playButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
        
        stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -padding).isActive = true
        stopButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        stopButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
        stopButton.heightAnchor.constraint(equalToConstant: buttonHeight).isActive = true
    }
}
