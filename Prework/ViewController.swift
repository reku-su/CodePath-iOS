//
//  ViewController.swift
//  Prework
//
//  Created by Admin Mac on 1/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var sliderMin: UILabel!
    @IBOutlet weak var sliderMax: UILabel!
    @IBOutlet weak var tip: UILabel!
    @IBOutlet weak var bill: UILabel!
    @IBOutlet weak var themeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        tipSlider.value = Float( tipPercentages[tipControl.selectedSegmentIndex])
        sliderValue.text = String(format: "%2d%%", Int(tipSlider.value * 100))
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func sliderCalculate(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tip = bill * Double(tipSlider.value)
        let total = bill + tip
        if tipSlider.value >= 0.20 {
            tipControl.selectedSegmentIndex = 2
        }
        if tipSlider.value >= 0.18 && tipSlider.value < 0.20{
            tipControl.selectedSegmentIndex = 1
        }
        if tipSlider.value <= 0.17{
            tipControl.selectedSegmentIndex = 0
        }
        sliderValue.text = String(format: "%2d%%", Int(tipSlider.value * 100))
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func setMode(_ sender: Any) {
        if self.view.backgroundColor != UIColor.black{
            self.view.backgroundColor = UIColor.black
            totalLabel.textColor = UIColor.white
            tipAmountLabel.textColor = UIColor.white
            sliderValue.textColor = UIColor.white
            total.textColor = UIColor.white
            tip.textColor = UIColor.white
            bill.textColor = UIColor.white
            sliderMin.textColor = UIColor.white
            sliderMax.textColor = UIColor.white
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            themeButton.setTitle("Light Mode", for: .normal)
            
        }
        else{
            self.view.backgroundColor = UIColor.white
            totalLabel.textColor = UIColor.black
            tipAmountLabel.textColor = UIColor.black
            sliderValue.textColor = UIColor.black
            total.textColor = UIColor.black
            tip.textColor = UIColor.black
            bill.textColor = UIColor.black
            sliderMin.textColor = UIColor.black
            sliderMax.textColor = UIColor.black
            navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            themeButton.setTitle("Dark Mode", for: .normal)
        }
    }
    
}
