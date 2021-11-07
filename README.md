# HowToPassDataBetweenViewController
ViewController 간 데이터를 전달하는 방법에 대해 정리해봅니다. 

### 프로퍼티에 직접 접근
일단 스토리보드에 View Controller 2개를 생성해주고 각각 본인의 ViewController 소스파일에 연결해주었습니다. 

첫번째 뷰(초록색)의 텍스트 필드에 데이터를 입력하고, 데이터 전달 버튼을 누르면 두번째 뷰(주황색)의 Label에 전달되는 방식으로 구현했습니다.

```swift
import UIKit

class MainViewController: UIViewController {
    var text: String = ""

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textField.text = text
    }
    
    @IBAction func touchUpDataTransmissionButton(_ sender: UIButton) {
        if let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController {
            secondVC.text = textField.text ?? "없습니다"
            
            self.present(secondVC, animated: true)
        }
    }
}
```

먼저 첫번째 View에서 `textField`를 `@IBOutlet`을 통해 연결해주고 `viewDidLoad`에서 텍스트 필드를 비어있는 상태로 로드할 수 있도록 빈 문자열을 넣어줬습니다. 

그리고 버튼을 누르면 다음 화면으로 넘어가면서 데이터가 전송될 수 있도록 `touchUpDataTransmissionButton(_ sender: UIButton)` 함수를 구현했습니다. 

여기서 직접 두번째 View에 있는 text라는 변수에 직접 `textField`의 텍스트 값을 넣어주고 화면이 모달로 보여지도록 `present` 메서드를 사용했습니다. 

두번째 View는 더 간단합니다. 

```swift
import UIKit

class SecondViewController: UIViewController {
    var text = ""
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textLabel.text = text
    }
}
```

첫번째 ViewController에서 호출했던 text가 바로 저 빈 문자열인 `text` 변수입니다. 

첫번째 ViewController에서 직접 두번째 ViewController 프로퍼티인 text에 직접 접근하여 값을 넣어주는 방식인거죠!!

다시 정리해보면 다음과 같습니다. 

1. 데이터를 받고 싶은 ViewController에 데이터를 받을 프로퍼티를 생성해준다. (위 예시에선 text입니다)
2. 받은 데이터를 어떻게 할 지 정해준다. (위 예시에선 viewDidLoad에서 textLabel에 프로퍼티 값을 넣어줬습니다)
3. 데이터를 보내고 싶은 ViewController에서 직접 데이터를 받을 ViewController의 인스턴스를 생성해서 값을 넣어줍니다.
