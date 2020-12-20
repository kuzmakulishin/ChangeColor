//
//  ViewController.swift
//  ChangeColor
//
//  Created by Kuzma Kulishin on 04.12.2020.
//

import UIKit


protocol ChangeColorViewControllerDelegate {
    func fillTheStartViewColor(color: UIColor)
}



class ChangeColorViewController: UIViewController {
    
    // мы говорим, что нашим делегатом будет тот, к гого тип ChangeColorViewControllerDelegate
    var delegate: ChangeColorViewControllerDelegate?
    
   
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redCountLabel: UILabel!
    @IBOutlet var greenCountLabel: UILabel!
    @IBOutlet var blueCountLabel: UILabel!
    
    @IBOutlet var redIndicateLabel: UIView!
    @IBOutlet var greenIndicateLabel: UIView!
    @IBOutlet var blueIndicateLabel: UIView!
    
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        colorView.layer.cornerRadius = 15
        
        resetButton.layer.cornerRadius = 8
        doneButton.layer.cornerRadius = 8
        
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
        redSlider.maximumValue = 255
        redSlider.value = redSlider.maximumValue
        
        greenSlider.minimumTrackTintColor = greenLabel.textColor
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 255
        greenSlider.value = greenSlider.maximumValue
        
        blueSlider.minimumTrackTintColor = .blue
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 255
        blueSlider.value = blueSlider.maximumValue
        
        redCountLabel.text = String(Int(redSlider.value))
        greenCountLabel.text = String(Int(greenSlider.value))
        blueCountLabel.text = String(Int(blueSlider.value))
        
        redIndicateLabel.layer.cornerRadius = redIndicateLabel.frame.height / 2
        redIndicateLabel.backgroundColor = UIColor(red: CGFloat(255 / 255), green: CGFloat(0 / 255), blue: CGFloat(0 / 255), alpha: 1)
        greenIndicateLabel.layer.cornerRadius = greenIndicateLabel.frame.height / 2
        greenIndicateLabel.backgroundColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(255 / 255), blue: CGFloat(0 / 255), alpha: 1)
        blueIndicateLabel.layer.cornerRadius = blueIndicateLabel.frame.height / 2
        blueIndicateLabel.backgroundColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(0 / 255), blue: CGFloat(255 / 255), alpha: 1)
        
        
    }
    
    @IBAction func redSliderAction(_ sender: UISlider) {
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(blueSlider.value / 255), alpha: 1)
        
        redCountLabel.text = String(Int(redSlider.value))
        
        redIndicateLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value / 255), green: CGFloat(0 / 255), blue: CGFloat(0 / 255), alpha: 1)
    
        
    }
    
    
    @IBAction func greenSliderAction(_ sender: Any) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(blueSlider.value / 255), alpha: 1)
        
        greenCountLabel.text = String(Int(greenSlider.value))
        
        greenIndicateLabel.backgroundColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(0 / 255), alpha: 1)
    }
    
    
    @IBAction func blueSlidrAction(_ sender: UISlider) {
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value / 255), green: CGFloat(greenSlider.value / 255), blue: CGFloat(blueSlider.value / 255), alpha: 1)
        blueCountLabel.text = String(Int(blueSlider.value))
        
        blueIndicateLabel.backgroundColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(0 / 255), blue: CGFloat(blueSlider.value / 255), alpha: 1)
    }
    
    
    @IBAction func resetButtonAction(_ sender: UIButton) {
        
        colorView.backgroundColor = .white
        
        redCountLabel.text = String(Int(redSlider.maximumValue))
        greenCountLabel.text = String(Int(greenSlider.maximumValue))
        blueCountLabel.text = String(Int(blueSlider.maximumValue))
        
        redSlider.value = blueSlider.maximumValue
        greenSlider.value = blueSlider.maximumValue
        blueSlider.value = blueSlider.maximumValue
        
        redIndicateLabel.backgroundColor = UIColor(red: CGFloat(255 / 255), green: CGFloat(0 / 255), blue: CGFloat(0 / 255), alpha: 1)
        greenIndicateLabel.backgroundColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(255 / 255), blue: CGFloat(0 / 255), alpha: 1)
        blueIndicateLabel.backgroundColor = UIColor(red: CGFloat(0 / 255), green: CGFloat(0 / 255), blue: CGFloat(255 / 255), alpha: 1)
    }
    
    @IBAction func doneButtonAction(sender: UIButton) {
        
        let color = colorView.backgroundColor
        
        delegate?.fillTheStartViewColor(color: color!)
        navigationController?.popViewController(animated: true)
        
    }
}
