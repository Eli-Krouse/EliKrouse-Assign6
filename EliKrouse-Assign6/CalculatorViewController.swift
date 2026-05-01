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
    
    @IBOutlet weak var CalculateButton: UIButton!
    
    @IBOutlet weak var BackgroundView: UIView!
    
    @IBOutlet weak var backgroundLeadingConstraint: NSLayoutConstraint!
    
    @IBAction func CalculateTapped(_ sender: Any)
    {
        guard let heightText = HeightTextField.text, let height = Double(heightText), let weightText = WeightTextField.text, let weight = Double(weightText) else
        {
            showAlert(title: "Missing Input!", message: "Please Input a valid double for each inputs.")
            return
        }
        
        let bmi = weight / (height*height*(0.0001))
        var bmiText = "Your BMI is \(String(format: "%.2f", bmi)), that means you're "
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
        guard let choice = sender as? UISegmentedControl else
        {
            return
        }
        
        switch(choice.selectedSegmentIndex)
        {
            case 0:
                HideSwitch.onTintColor = .link
                CalculateButton.tintColor = .link
                BGAnimate(x: -131)
                
            case 1:
                HideSwitch.onTintColor = .systemPink
                CalculateButton.tintColor = .systemPink
                BGAnimate(x: -405)
            default:
                return
        }
    }
    
    @IBAction func HideSwitched(_ sender: Any)
    {
        guard let hideSwitch = sender as? UISwitch else
        {
            return
        }
        
        if(!hideSwitch.isOn)
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
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func BGAnimate(x: CGFloat)
    {
        //backgroundLeadingConstraint.constant = x;
        UIView.animate(withDuration: 0.9) {
            self.backgroundLeadingConstraint.constant = x;
            self.BackgroundView.layoutIfNeeded()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarController?.tabBar.tintColor = .black
        tabBarController?.tabBar.unselectedItemTintColor = .gray
    }
}
