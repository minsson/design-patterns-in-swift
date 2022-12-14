# 221026 디자인 패턴 2주차 
## Factory Method 패턴

### 의도
- 상위 클래스에서 객체들을 생성할 수 있는 인터페이스를 제공하지만, 하위 클래스들이 생성될 객체들의 유형을 변경할 수 있도록 하는 생성 패턴

### 사용법

![](https://i.imgur.com/wy2tmPu.png)

- Product
    - Creator와 하위 클래스가 생성할 수 있는 모든 객체에 동일한 인터페이스를 선언한다.

- Concreate Product
    - Product가 선언한 인터페이스로 만든 실제 객체이다.

- Creator
    - 새로운 객체를 반환하는 팩토리 메서드를 선언한다.
    - 여기서 반환하는 객체는 Product인터페이스를 준수한다.

- Concreate Creator
    - 기본 팩토리 메서드를 오버라이딩 하여 서로 다른 Product객체를 만든다.

### 언제 사용하나
- 팩토리 메서드 패턴의 이름 처럼 어떤 공장에서 제품을 만들어내는데 이 제품의 종류가 처음엔 하나였지만 사업이 확장되면서 다른 종류의 제품도 추가 하고 싶을 때 사용할 수 있다. 
- 단순히 하나의 제품을 만드는 형태로 만들어 놓는다면 새로운 제품을 만들때는 다시 새롭게 코드베이스를 변경해야 한다.
- 이런 상황을 해결하기 위해 팩토리를 만들어서 팩토리에서 새로운 제품을 만들 수 있도록 대체할 수 있다.

### 언제 사용하지 2
- 팩토리 메서드 패턴을 사용하는 방법에 대해 비유적으로 알아봤고 실제 우리 코드에서는 커스텀 뷰를 만들 때 사용해 볼 수 있다.

- 팩토리 패턴이 없다면 커스텀뷰 타입에 대해 세부사항을 기억하고  사용해야 하고 UI요소들을 직접적으로 초기화 하여 사용해야 할 것이다.

## 예제 코드
