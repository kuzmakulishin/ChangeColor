//
//  StartViewController.swift
//  ChangeColor
//
//  Created by Kuzma Kulishin on 18.12.2020.
//

import UIKit

    // 4) подписываем Вьюконтроллер под наш протокол ChangeColorViewControllerDelegate (см. шаг 1)
class StartViewController: UIViewController, ChangeColorViewControllerDelegate {
    
    
    @IBOutlet var startColorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // 5) выполяем метод, где и передаем значение второго Вьюконтроллера первому
    func fillTheStartViewColor(color: UIColor) {
        startColorView.backgroundColor = color
        
    }
    
    // 3) записываем метод. Индетификатор должен быть тот, который мы указали в нашем сегвее
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChangeView" {
            
            // мы хотим, чтобы при переходе сохранили второй Вьюконтроллер ChangeColorViewController в нашу константу destinationVC
            let destinationVC = segue.destination as! ChangeColorViewController
            // да, я буду делегатом (говоря self) нашего destination Вьюконтроллера, в свою очередь destinationVC это и есть StartViewController
            destinationVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
    

    
    

}
