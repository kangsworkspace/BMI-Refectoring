# BMI

## 🖥️ 프로젝트 소개

- 기존에 진행하였던 BMI 계산기를 클론 코딩한 내용을 MVC 패턴을 적용해서 리팩토링 하였습니다.
[기존에 진행한 내용](https://github.com/kangsworkspace/BMI)
- 강의를 따라가며 앱을 한번 제작했고 현재의 프로젝트는 동일한 앱을 처음부터 가급적 혼자서 내용을 되새기며 구현해봤습니다.
<br>

## 👀 파일 구성
![파일 정리](https://github.com/kangsworkspace/BMI-Refectoring/assets/141600830/a980c39d-1370-4f0e-a9ba-57fb533e0470)

-  파일의 구성을 크게 "Models", "Views", "Controllers"로 하였습니다.
- "Models" 에서는 BMI 계산과 관련된 로직을, "Views"에서는 스토리 보드를, "Controllers"에는 값을 받아오고 뷰로 보내는 등의 처리하였습니다.
<br>

## 📌 학습한 주요 내용
#### MVC 패턴 처음 적용해보기

아래와 같이 기초적인 단계의 MVC 패턴을 적용해보았습니다.
![ㅇㅇ](https://github.com/kangsworkspace/BMI-Refectoring/assets/141600830/6edee125-0f6c-4956-b427-1473819b93b6)

#### 파일 분산에 따른 변수 처리

Models 그룹에 있는 BMICalculatorManager파일에서 로직을 처리하였기 때문에 다른 파일간의 데이터가 서로 상호작용 할 수 있도록 코드를 짰습니다.



## 🎬 완성된 모습 (기존의 프로젝트와 동일합니다)

![GIFMaker_me](https://github.com/kangsworkspace/BMI/assets/141600830/0f298d1d-f275-4bce-95bd-949973f6d400)


## 🙉 문제점 및 해결

BMICalculatorManager파일에서 로직을 처리하려고 하면서부터 변수가 많아지고 옵셔널 값이 많아지면서 코드가 복잡해지기 시작했습니다.
이전에 학습했던 코드는 더 간결했던거 같은데 무엇이 다른지 생각하며 새로 변수를 선언하는 것을 최대한 줄여서 코드가 간결해졌습니다.
그래서 참고한 강의에서는 리턴값을 활용해서 bmi값을 리턴하는 함수를 따로 선언하였지만 저는 값 자체를 그냥 사용한 차이점이 있습니다.
더 많은 경험을 하면 상황마다 어떻게 변수를 선언하고 복잡하지 않게 로직을 짤 지 배울 수 있을 것 같습니다.
   
   

