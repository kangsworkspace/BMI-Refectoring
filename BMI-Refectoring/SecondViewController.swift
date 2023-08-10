//
//  SecondViewController.swift
//  BMI
//
//  Created by Kang on 2023/08/08.
//


import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var bmiValueLabel: UILabel!
    @IBOutlet weak var bmiCommentLabel: UILabel!
    
    var bmiValue: Double?
    var bmiComment: String?
    var bmiColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUP()
    }
    
    func setUP() {
        
        // UI에 BMI 결과값 표시
        guard let bmi = bmiValue else { return }
        bmiValueLabel.text = String(bmi)
        
        // UI에 BMI 결과값 색깔 표시
        guard let bmiColor = bmiColor else { return }
        bmiValueLabel.backgroundColor = bmiColor
        
        // UI에 BMI 결과 코멘트 표시
        guard let bmiComment = bmiComment else { return }
        bmiCommentLabel.text = bmiComment
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
