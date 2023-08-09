# BMI

## 🖥️ 프로젝트 소개

- 인프런-강의(앨런 Swift문법 마스터 스쿨 (15개의 앱을 만들면서 근본원리부터 배우는 UIKit) 중 BMI 계산기를 클론 코딩한 내용입니다.
- 강의를 따라가며 앱을 한번 제작했고 현재의 프로젝트는 동일한 앱을 처음부터 가급적 혼자서 내용을 되새기며 구현해봤습니다.
<br>

## 👀 UI 구성
![기본 UI뷰 구성](https://github.com/kangsworkspace/BMI/assets/141600830/aaefad48-8d65-4d84-b964-f2011e2f6feb)

- 두개의 ViewController로 구성되어 있습니다.
- 화면의 전환은 버튼을 통해 직접 세그웨이로 구현했습니다.
<br>

## 📌 학습한 주요 내용
#### 텍스트 필드에 정수만 받기

확장을 통해 델리게이트 패턴을 사용하였습니다.
그리고 아래의 코드를 통해 텍스트 필드의 입력을 매번 감지해 Int로 변환이 되는(정수)만 입력받도록 하였습니다.
텍스트 필드의 기본 타입이 String이기 때문에 Int 타입으로 변환이 가능한지의 유무로 정수를 구별하였습니다.

```swift
extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if Int(string) != nil || string == "" {
                return true // 글자 입력을 허용
            }
            return false
        }
}
```

#### 다른 View 사이에서 데이터 전달과 처리 방식

- 기본적인 데이터 전달은 아래의 코드로 하였습니다. (prepare() 함수를 사용)

```swift
override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    if segue.identifier == "toSecondVC" {
    let secondVC = segue.destination as! SecondViewController

    // 데이터 전달
    secondVC.bmiValue = self.bmiValue
    secondVC.bmiComment = getBMIAdviceString()
    secondVC.bmiColor = getBackgroundColor()
    }
}
```

- 데이터의 처리는 SecondViewController에서 하지않고 기본 ViewController에서 BMI 계산하기 버튼을 누르면 다음과 같이 처리했습니다.
1) 텍스트 필드의 값을 읽어와서 BMI 값 계산하기
2) prepare 함수에서 데이터를 전달하기
   ( bmi값 전달 + bmiComment, bmiColor를 계산하는 함수를 실행해서 전달)
![dosik](https://github.com/kangsworkspace/BMI/assets/141600830/142c65b9-a122-4884-979a-2fbb39354b31)

## 🎬 완성된 모습

![GIFMaker_me](https://github.com/kangsworkspace/BMI/assets/141600830/0f298d1d-f275-4bce-95bd-949973f6d400)


## 🙉 문제점 및 해결
shouldPerformSegue() 함수가 동작하지 않아 텍스트 필드에 값이 없으면 다음 창으로 넘어가지는 기능이 실행되지 않았습니다.
-> shouldPerformSegue() 함수를 선언한 위치가 버튼이 눌리면 동작하는 calculateButtonTapped()함수 안에 선언되어 있었습니다.
   버튼이 눌렸을 때 동작해야한다고 생각해서 함수 안에 함수를 넣었는데 
   shouldPerformSegue()는 버튼의 동작과 별개로 세그웨이와 관련되어 동작하였습니다.
   그리고 문법적으로도 함수 내부에서 override를 사용하는 것은 잘못되었음을 뒤늦게 인지했습니다.
   

