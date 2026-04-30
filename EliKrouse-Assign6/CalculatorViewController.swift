//
//  CalculatorViewController.swift
//  EliKrouse-Assign6
//
//  Created by Krouse, William E. on 4/29/26.
//

import UIKit

class CalculatorViewController: UIViewController {

    
    @IBOutlet weak var SexSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var WeightTextField: UITextField!
    
    @IBOutlet weak var HeightTextField: UITextField!
    
    @IBOutlet weak var HideSwitch: UISwitch!
    
    @IBOutlet weak var HideLabel: UILabel!
    
    @IBOutlet weak var BMIMessageLabel: UILabel!
    
    @IBAction func CalculateTapped(_ sender: Any)
    {
        guard let height = Double(HeightTextField.text!), let weight = Double(WeightTextField.text!) else
        {
            showAlert(title: "Missing Input!", message: "Please Input a valid double for each inputs.")
            return
        }
        
        let bmi = height * weight
        var bmiText = "Your BMI is \(bmi), that means you're "
        switch(bmi)
        {
        case 0..<18.5:
            BMIMessageLabel.backgroundColor = .yellow
            bmiText += "underweight!"
        case 18.5..<25:
            BMIMessageLabel.backgroundColor = .green
            bmiText += "a healthy weight!"
        case 25..<30:
            BMIMessageLabel.backgroundColor = .yellow
            bmiText += "overweight!"
        case 30..<1000:
            BMIMessageLabel.backgroundColor = .red
            bmiText += "obese!"
        default:
          showAlert(title: "Calculation Error!", message: "There was some error in calculating your BMI. Please make sure your inputs are correct")
            return
        }
        BMIMessageLabel.text = bmiText
    }
    
    @IBAction func SexSCChanged(_ sender: Any)
    {
        
    }
    
    @IBAction func HideSwitched(_ sender: Any)
    {
        guard let hideSwitch = sender as? UISwitch else
        {
            return
        }
        
        if(hideSwitch.isOn)
        {
            HideLabel.text = "Show"
            BMIMessageLabel.isHidden = true
        } else
        {
            HideLabel.text = "Hide"
            BMIMessageLabel.isHidden = false
        }
    }
    
    func showAlert(title: String, message: String)
    {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    

}
