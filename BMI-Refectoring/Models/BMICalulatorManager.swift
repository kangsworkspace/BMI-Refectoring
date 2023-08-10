//
//  BMICalulatorManager.swift
//  BMI-Refectoring
//
//  Created by Kang on 2023/08/10.
//

import UIKit

struct BMICalculatorManager {
    
    var bmiValue: Double?
    
    // BMI 계산 함수
    mutating func calculateBMI(_ stringHeight: String, _ stringWeight: String) {
        
        guard let height = Double(stringHeight) else { return }
        guard let weight = Double(stringWeight) else { return }
        
        bmiValue = round((weight / (height * height) * 10000) * 10 / 10)
    }
    
    
    // 색깔 얻는 메서드
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmiValue else { return UIColor.black }
        switch bmi {
        case ..<18.6:
            return UIColor(displayP3Red: 22/255, green: 231/255, blue: 207/255, alpha: 1)
        case 18.6..<23.0:
            return UIColor(displayP3Red: 212/255, green: 251/255, blue: 121/255, alpha: 1)
        case 23.0..<25.0:
            return UIColor(displayP3Red: 218/255, green: 127/255, blue: 163/255, alpha: 1)
        case 25.0..<30.0:
            return UIColor(displayP3Red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        case 30.0...:
            return UIColor(displayP3Red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        default:
            return UIColor.black
        }
    }
    
    // 문자열 얻는 메서드
    func getBMIAdviceString() -> String {
        guard let bmi = bmiValue else { return "" }
        switch bmi {
        case ..<18.6:
            return "저체중"
        case 18.6..<23.0:
            return "표준"
        case 23.0..<25.0:
            return "과체중"
        case 25.0..<30.0:
            return "중도비만"
        case 30.0...:
            return "고도비만"
        default:
            return ""
        }
    }
}
