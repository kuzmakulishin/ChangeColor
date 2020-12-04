//
//  ViewController.swift
//  ChangeColor
//
//  Created by Kuzma Kulishin on 04.12.2020.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var resetButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        resetButton.layer.cornerRadius = 8
        
        
        redLabel.layer.masksToBounds = true
        redLabel.layer.cornerRadius = 5
        redLabel.textColor = .red
        redLabel.textAlignment = .center
        
        greenLabel.layer.masksToBounds = true
        greenLabel.layer.cornerRadius = 5
        greenLabel.textAlignment = .center
        
        blueLabel.layer.masksToBounds = true
        blueLabel.layer.cornerRadius = 5
        blueLabel.textColor = .blue
        blueLabel.textAlignment = .center
        
        redSlider.minimumTrackTintColor = .red
        
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.value = redSlider.maximumValue / 2
        
        greenSlider.minimumTrackTintColor = greenLabel.textColor
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.value = greenSlider.maximumValue / 2
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.value = blueSlider.maximumValue / 2
        
        
        
    }
    
    @IBAction func redSliderAction(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    
    @IBAction func greenSliderAction(_ sender: Any) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    
    @IBAction func blueSlidrAction(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        
        colorView.backgroundColor = .systemGray5
        redSlider.value = redSlider.maximumValue / 2
        greenSlider.value = greenSlider.maximumValue / 2
        blueSlider.value = blueSlider.maximumValue / 2
        
        
    }
    

    
    
}

