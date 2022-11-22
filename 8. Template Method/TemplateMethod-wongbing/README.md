###### tags: `디자인패턴`
> [name=웡빙]
> [time=Wed, Nov 9, 2022 9:09 AM]

# Template Method Pattern

**템플릿 메서드**는 부모 클래스에서 알고리즘의 골격을 정의하지만, 해당 알고리즘의 구조를 변경하지 않고 자식 클래스들이 알고리즘의 특정 단계들을 오버라이드(재정의)할 수 있도록 하는 행동 디자인 패턴입니다.
<img src="https://i.imgur.com/5Xw6IoJ.png" width="400">

- 전체적으로 동일하면서 부분적으로 다른 구문으로 구성된 메서드의 코드 중복을 최소화할 때 유용하다.
- 행위 패턴(Behavior)중의 하나이다.

- 2개 이상의 클래스가 유사한 기능을 제공하면서 중복된 코드가 있는 경우에는 상속을 이용해서 코드 중복 문제를 피할 수 있다.


### 스위프트에서 적용
- 비슷한 기능을 하는 두개이상의 객체가 존재하게 되었다.
- Protocol로 중복되는 메서드를 뽑아 공통 인터페이스를 만들어준다.
- 공통구현은 Extension을 통해 기본구현을 해준다.
- 채택하는 객체마다 다르게 적용해야될 부분은 기본구현을 하지 않는다.

### 장점
- 클라이언트들이 대규모 알고리즘의 특정 부분만 오버라이드하도록 하여 그들이 알고리즘의 다른 부분에 발생하는 변경에 영향을 덜 받도록 할 수 있습니다.
- 중복 코드를 부모 클래스로 가져올 수 있습니다.

### 단점
- 일부 클라이언트들은 알고리즘의 제공된 골격에 의해 제한될 수 있습니다.
- 당신은 자식 클래스를 통해 디폴트 단계 구현을 억제하여 리스코프 대체 원칙을 위반할 수 있습니다.
- 템플릿 메서드들은 단계들이 더 많을수록 유지가 더 어려운 경향이 있습니다.

## <span style = "color:gray"> 🔗 References</span>

- [Refactoring Guru - template method](https://refactoring.guru/ko/design-patterns/template-method)
- [참조 블로그](https://gmlwjd9405.github.io/2018/07/13/template-method-pattern.html)