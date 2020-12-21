//
//  ViewController.swift
//  ChangeColor
//
//  Created by Kuzma Kulishin on 04.12.2020.
//

import UIKit

    // 1) записываем протокол, который имеет один медот
protocol ChangeColorViewControllerDelegate {
    func fillTheStartViewColor(color: UIColor)
}



class ChangeColorViewController: UIViewController {
    
    // 2) теперь мы хотим указать, что будет исполнять наш протокол
    // мы хотим, чтобы Вьюконтроллер ChangeColorViewController делегировал свой метод fillTheStartViewColor в другой Вьюконтроллер, а кому он должен делегировать это должен указать сам ChangeColorViewController, это делаем через свойство delegate
    
    // мы говорим, что нашим делегатом будет тот, у кого тип ChangeColorViewControllerDelegate
    var delegate: ChangeColorViewControllerDelegate?
    
    // итог - мы говорим, что у нашего ChangeColorViewController есть свойтсво delegate, которое имеет тип нашего протокола. Соответственно тот, кто подпишется под наш протокол сможем выполнить метод fillTheStartViewColor, там самым передаст данные с этого вьюконтроллера на первый вьюконтроллер
   
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
        // скрываем верхний бар (так как он нам тут не нужен)
        self.navigationController?.isNavigationBarHidden = true
        
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
        
        // 6) добавляем данные, которые срабатывают при нажатии кнопки
        
        // создаём констанку кторая хратин значение свойства colorView.backgroundColor
        let color = colorView.backgroundColor
        
        // далее говорим, что наш делегаю будет исползовать метод
        delegate?.fillTheStartViewColor(color: color!)
        
        // после того, как мыс сохранили и передали color, мы хотим, чтобы посвился первый Вью (стартовый)
        navigationController?.popViewController(animated: true)
        
        
    }
}

