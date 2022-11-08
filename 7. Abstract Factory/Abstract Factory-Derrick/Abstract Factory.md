# **Abstract Factory**

[Abstract Factory](https://refactoring.guru/design-patterns/abstract-factory)

[[Swift 디자인 패턴] Abstract Factory Pattern (추상 팩토리) - 디자인 패턴 공부 2](https://icksw.tistory.com/235)

# ****Intent****

추상 팩토리 패턴의 목적은 구체적인 클래스를 지정하지 않고 관련된 객체들을 모으기 위한 인터페이스를 제공하는 것이다. 또한 코드를 변경하지 않고도 조건에 따른 적절한 객체를 사용할 수 있게 해준다.

# ****Problem****

- 관련 제품들로 형셩된 패밀리(제품): `Chair` + `Sofa` + `CoffeeTable`
- 해당 제품군의 여러 가지 변형.
    - 예를 들어, `Chair` + `Sofa` + `CoffeeTable` 같은 제품들은 `Modern(현대식)`, `Victorian(빅토리안)`, `ArtDeco(아르테코 양식)`와 같은 변형으로 제공된다.
             

새로운 가구 객체를 생성했을 때, 이 객체들이 기존의 같은 패밀리 내에 있는 다른 가구 객체들과 일치하는 변형(스타일)을 가지도록 할 방법이 필요하다. 

가구 공급업체들은 카탈로그를 자주 변경하기 때문에, 새로운 제품을 기존 코드에 추가할 때마다 변경해야 하는 번거로움이 있다.

# ****Solution****

UI를 만들 때 스크롤 바, 버튼과 같은 View를 사용해서 만들게 되는데, 이들은 모두 다른 모양과 동작을 한다. 이들은 모양과 동작은 다르지만 모두 관련이 되어있다고 할 수 있다. 이러한 객체들을 프로그램 내에서 모두 각자 다른 객체로 만들게 되면 나중에 수정이 어려울 수 있기 때문에 이러한 객체들을 표현하는 하나의 추상 클래스를 정의하여 이를 해결하기 위한 방법으로 만들어졌다.

각 제품에 해당하는 개별적인 인터페이스를 명시적으로 선언하는 것이다. 그 다음, 제품의 모든 변형이 위의 인터페이스를 따르도록 한다. 

# ****Structure****

추상 팩토리 패턴은 구체적인 클래스를 지정하지 않고 공통된 요소들을 갖는 개별 팩토리 그룹을 캡슐화하는 방법을 제공하는 것이다.

Swift는 Protocol을 예로 들 수 있는데, Protocol은 어떤 메서드나 변수를 가질 것이다라는 껍데기만 존재한다. Protocol을 채택한 클래스나 구조체는 해당 Protocol이 정의한 껍데기 부분을 구체적으로 구현하고 나머지 더 필요한 부분을 추가하게 된다. 여기서 Protocol을 추상 팩토리라고 할 수 있다.

실제로 Protocol을 채택한 Class를 사용할 땐 해당 클래스의 요소들만 사용하기 때문에 내부적으로 어떤 Protocol을 채택했는지 알 필요가 없다.

따라서 추상 팩토리 패턴은 껍데기만 정의해두고 관련 객체들에서 껍데기의 세부사항을 구현하기 때문에 객체 구성에 의존한다고 할 수 있다. 

추상 팩토리 패턴을 사용하면 이를 사용하는 코드를 변경하지 않고도 구체적인 구현을 바꿀 수 있다. 하지만 복잡성과 추가 작업은 발생할 수 있다. 

# 언제 사용하면 될까?

- 앱이 객체의 생성, 구성, 표현 방법과 독립적이어야 할 때
- 앱이 여러 객체 중 하나로 구성되어야 할 때
- 관련 객체들이 함게 사용할 수 있게 설계 할 때
- 앱의 클래스 라이브러리를 제공하고 구현이 아닌 인터페이스만 표시할 때

# ****Pros****

- 팩토리에서 생성되는 객체들의 상호 호환을 보장한다
- 객체들 사이의 결합도를 낮출 수 있다
- 단일 책임 원칙, 객체 생성 코드를 한 곳으로 둬서 코드를 더 쉽게 유지보수 할 수 있다.
- 개방 폐쇄 원칙, 기존 클라이언트 코드를 훼손하지 않고 새로운 객체들을 생성할 수 있다.

# ****Cons****

- 패턴과 함게 새로운 인터페이스들과 클래스들이 많이 도입 되기 때문에 코드가 필요 이상으로 복잡해질 수 있다.

# **Relations with Other Patterns**

- 많은 디자인은 복잡성이 낮고 자식 클래스들을 통해 더 많은 커스터마이징이 가능한 **[팩토리 메서드](https://refactoring.guru/ko/design-patterns/factory-method)**로 시작해 더 유연하면서도 더 복잡한 **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)**, **[프로토타입](https://refactoring.guru/ko/design-patterns/prototype)** 또는 **[빌더](https://refactoring.guru/ko/design-patterns/builder)** 패턴으로 발전해 나갑니다.
- **[빌더](https://refactoring.guru/ko/design-patterns/builder)**는 복잡한 객체들을 단계별로 생성하는 데 중점을 둡니다. **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)**는 관련된 객체들의 패밀리들을 생성하는 데 중점을 둡니다. *추상 팩토리*는 제품을 즉시 반환하지만 *빌더*는 제품을 가져오기 전에 당신이 몇 가지 추가 생성 단계들을 실행할 수 있도록 합니다.
- **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)** 클래스들은 **[팩토리 메서드](https://refactoring.guru/ko/design-patterns/factory-method)**들의 집합을 기반으로 하는 경우가 많습니다. 그러나 당신은 또한 **[프로토타입](https://refactoring.guru/ko/design-patterns/prototype)**을 사용하여 **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)**의 구상 클래스들의 생성 메서드들을 구현할 수도 있습니다.
- **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)**는 하위시스템 객체들이 클라이언트 코드에서 생성되는 방식만 숨기고 싶을 때 **[퍼사드](https://refactoring.guru/ko/design-patterns/facade)** 대신 사용할 수 있습니다.
- 당신은 **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)**를 **[브리지](https://refactoring.guru/ko/design-patterns/bridge)**와 함께 사용할 수 있습니다. 이 조합은 *브리지*에 의해 정의된 어떤 추상화들이 특정 구현들과만 작동할 수 있을 때 유용합니다. 이런 경우에 *추상 팩토리*는 이러한 관계들을 캡슐화하고 클라이언트 코드에서부터 복잡성을 숨길 수 있습니다.
- **[추상 팩토리들](https://refactoring.guru/ko/design-patterns/abstract-factory)**, **[빌더들](https://refactoring.guru/ko/design-patterns/builder)** 및 **[프로토타입들](https://refactoring.guru/ko/design-patterns/prototype)**은 모두 **[싱글턴](https://refactoring.guru/ko/design-patterns/singleton)**으로 구현할 수 있습니다.