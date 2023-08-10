//
//  ViewController.swift
//  BMI
//
//  Created by Kang on 2023/08/08.
// 브랜치 테스트

import UIKit

class ViewController: UIViewController {
    
    // 변수 선언
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    
    var bmiValue: Double?
    
    // 뷰 디드 로드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }

    // 셋업
    func setUp() {
        
        // 델리게이트 패턴 사용
        heightTextField.delegate = self
        weightTextField.delegate = self
        
        // 버튼 UI 수정
        calculateButton.layer.cornerRadius = 8
        calculateButton.clipsToBounds = true
        
        // 플레이스 홀더 설정
        heightTextField.placeholder = "cm단위로 입력해주세요"
        weightTextField.placeholder = "kg단위로 입력해주세요"
    }
    
 
    
    // 버튼이 눌렸을 때 -> BMI 계산 함수 실행
    @IBAction func bmiCalculateButtonTapped(_ sender: UIButton) {
        
        
        guard let stringHeight = heightTextField.text else { return }
        guard let stringWeight = weightTextField.text else { return }
        
        calculateBMI(stringHeight, stringWeight)
    }
    
    // BMI 계산 함수
    func calculateBMI(_ stringHeight: String, _ stringWeight: String) {
        
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
    
    // SecondViewController로 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            // 데이터 전달
            secondVC.bmiValue = self.bmiValue
            secondVC.bmiComment = getBMIAdviceString()
            secondVC.bmiColor = getBackgroundColor()
        }
    }
    
    
    // 텍스트 필드에 값의 유무에 따른 리턴 처리
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력하셔야 합니다!!!"
            mainLabel.textColor = UIColor.red
            return false
        } else {
            // 다시 돌아왔을 때를 위한 세팅
            mainLabel.text = "키와 몸무게를 입력해 주세요"
            mainLabel.textColor = UIColor.black
            heightTextField.text = ""
            weightTextField.text = ""
            return true
        }
    }
}
    
    



// TextField 델리게이트
extension ViewController: UITextFieldDelegate {
    
    // textField 정수만 입력받기
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if Int(string) != nil || string == "" {
                return true // 글자 입력을 허용
            }
            return false
    }
    
    // 리턴 키 입력 받았을 때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 둘다 값이 있다면 두번째 텍스트 필드를 종료 (키보드 내리기)
        if heightTextField.text != "", weightTextField.text != "" {
            weightTextField.resignFirstResponder()
            return true
        } else if heightTextField.text != "" {
            // 첫번째 텍스트 필드에 값이 있다면 두번째(몸무게) 텍스트 필드로 넘어가기
            weightTextField.becomeFirstResponder()
            return true
        } else {
            return false
        }
    }
    
    // 다른 곳 터치 시 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
    }

}

