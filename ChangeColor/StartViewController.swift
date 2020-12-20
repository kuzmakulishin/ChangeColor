//
//  StartViewController.swift
//  ChangeColor
//
//  Created by Kuzma Kulishin on 18.12.2020.
//

import UIKit

class StartViewController: UIViewController, ChangeColorViewControllerDelegate {
    
    
    @IBOutlet var startColorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func fillTheStartViewColor(color: UIColor) {
        startColorView.backgroundColor = color
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showChangeView" {
            
            let destinationVC = segue.destination as! ChangeColorViewController
            destinationVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func editStartButton(_ sender: UIBarButtonItem) {
    }
    
    

}
