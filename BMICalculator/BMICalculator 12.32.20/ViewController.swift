//
//  ViewController.swift
//  BMICalculator
//
//  Created by Ruilin 😈 on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weightlbs: UITextField!
    @IBOutlet weak var heightFeet: UITextField!
    @IBOutlet weak var heightInch: UITextField!
    @IBOutlet weak var bmilbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func GetBMI(_ sender: Any)
    {
        let heightfeet = (heightFeet.text! as NSString).doubleValue
        let heightinch = (heightInch.text! as NSString).doubleValue
//        let bmilbl=String(weightlbs * 0.45359237)
        let weight = (weightlbs.text! as NSString).doubleValue
        bmilbl.text=bmiCalc(weightInPounds: weight, heightInFeet: heightfeet, remainderInches: heightinch)
//        print(test)
//        bmilbl.text=test
    }
    
    
    func bmiCalc(weightInPounds : Double, heightInFeet: Double, remainderInches: Double) -> String
    {
        let weightInKg = weightInPounds * 0.45359237
        let totalInches = (heightInFeet * 12) + remainderInches
        let heightInMeters = totalInches * 0.0254
        
        let bmi = weightInKg / pow(heightInMeters, 2)
        
        let shortenedBmi = String(format: "%.2f", bmi)
        
        var interpretation = ""
        if bmi > 30{
            interpretation = "Obese"
        }else if bmi >= 25 && bmi <= 29{
            interpretation = "Overweight"
        }else if bmi >= 18.5 && bmi <= 25{
          interpretation = "Healthy weight"
        }else{
              interpretation = "Underweight"
        }
        return "Your BMI is \(shortenedBmi). \(interpretation) & BMI of a healthy guy is between 18.5 & 25"
    }
}

