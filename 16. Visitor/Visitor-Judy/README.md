# Visitor
**Behavioral Patterns**
> 알고리즘이 작동하는 개체에서 알고리즘을 분리할 수 있는 패턴

**Visitor는 복잡하고 적용 범위가 좁기 때문에 그리 일반적인 패턴은 아닙니다.**
> - Complexity: ⭐️⭐️⭐️
> - Popularity: ⭐️

<br>

## 문제
지리 정보를 담는 앱을 만들 때, 각 노드가 도시를 나타낼 수도 있지만 산업, 관광 지역같은 세분화된 항목도 나타낼 수 있습니다. 이때 클래스는 종류가 되고 각 객체는 특정 노드가 됩니다.

이러한 정보들을 XML로 내보내고 싶을 때 각 노드 클래스에 내보내기 기능을 추가하는 방법을 생각할 수 있습니다. 하지만 기존 노드 클래스를 변경하는 것은 예상치 않은 문제가 발생할 수 있습니다.

![](https://velog.velcdn.com/images/juyoung999/post/4e901d89-de14-4e0c-afe6-53865527eb30/image.png)

또한 지리를 나타내는게 주요한 노드 클래스에 해당 기능을 추가하는 것은 적합하지 않을 수 있습니다. 게다가 이후에 다른 형식으로 내보내기를 추가 요구할 가능성도 높습니다. 
<br>

## 해결
Visitor 패턴 새로운 동작을 기존 클래스에 통합하는 대신에 Visitor 라는 별도의 클래스를 배치합니다. 해당 기능을 수행해야 하는 개체는 Visitor 메서드 중 하나에 인수로 전달되어 해당 개체의 모든 데이터에 대한 접근을 제공합니다. 

여러 유형의 인수를 가지도록 하여 다양한 객체에서 실행되도록 할 수 있습니다.
```swift
class ExportVisitor implements Visitor is
    method doForCity(City c) { ... }
    method doForIndustry(Industry f) { ... }
    method doForSightSeeing(SightSeeing ss) { ... }
    // ...
```

전체 그래프에서 다룰 때 이 메서드를 어떻게 호출할 수 있을까요? 해당 객체의 적절한 Visitor 메서드를 선택하려면 해당 클래스를 확인해야 합니다 😕 Visitor 패턴은 **Double Dispatch**를 이용하여 번거로운 조건문 없이 개체에서 적절한 메서드를 실행하게 합니다. 

클라이언트가 호출할 적절한 메서드를 선택하는 일을 Visitor에게 인수로 전달할 개체에게 위임하는 것입니다. 개체는 자기 자신을 알고 있기 때문에 어렵지 않게 적절한 메서드를 선택할 수 있습니다. visitor를 **accept**하고 어떤 visiting method를 실행해야 하는지 알려줍니다.

비록 Node 클래스에 변경은 필요하지만 사소하게 변경을 추가해 더 많은 기능을 제공하게 할 수 있습니다. 

이제 모든 visitor의 공통 인터페이스를 추출하면 모든 노드가 Visitor의 기능을 사용할 수 있고, 새로운 기능 추가하려면 새 Visitor 클래스만 구현하면 됩니다.
<br>

## 현실 예제
![](https://velog.velcdn.com/images/juyoung999/post/9745fbff-178c-4a35-a7d1-0e25046aed6b/image.png)

노련한 보험 판매자는 다양한 종류의 건물을 방문하며 보험을 판매하고자 합니다. 해당 건물의 조직에 따라 다양한 보험 정책을 제공할 수 있습니다. 

ex) 주거용 건물 ➡️ 의료 보험 / 은행 ➡️ 도난 보험 / 커피숍 ➡️ 화재 및 홍수 보험
<br>

## 구조

![](https://velog.velcdn.com/images/juyoung999/post/c5fe93f9-2a7a-4a76-871b-29ca582d614d/image.png)


1. Visitor Interface
- Concrete 개체를 인수로 사용할 수 있는 일련의 `visit` 메서드를 선언합니다.
- 언어가 오버로딩을 지원하는 경우 메서드의 이름은 같고 매개변수의 유형만 다르게 됨니다.

2. Concrete Visitor
- 서로 다른 Concrete 개체의 맞게 동일한 동작을 여러 버전에 맞게 제공합니다.

3. Element Interface
- Visitor를 `accept`하는 메서드를 선언합니다.

4. Concrete Element
- 구체적인 `accept` 방법을 구현. 현재 Element 클래스에 해당하는 적절한 visit 메서드를 호출하도록
- 기본 Element가 구현하더라도 하위 개체들이 재정의하여 적절한

5. Client
- 일반적으로 collection이나 복합 개체(ex. tree)를 선언
- 인터페이스로 작업하기 때문에 concrete 개체에 대해서는 알지 못합니다.
<br>

## 적용
- 복잡한 개체 구조(ex. tree)의 모든 요소에 대해 작업을 수행해야 할 때
- 보조 동작의 비즈니스 논리를 정리하고 싶을 때
- 동작이 일부 클래스에서만 의미가 있고 다른 클래스에서는 그렇지 않은 경우
<br>

## 구현 방법
1. concrete element에 대응하는 `visit` 메서드 세트를 선언
2. Element 인터페이스 선언. 방문자 객체를 인수로 받는 `accept` 메서드를 추가
3. Concrete Element 개체에 `accept` 메서드 구현. 현재 Element 클래스와 일치하는 `visit` 메서드를 단순히 호출하면 된다.
4. Element 클래스는 Visitor의 인터페이스를 통해서만 `visit` 메서드를 사용해야 합니다. 반면에 Visitor는 모든 Element 클래스에 대해 알고 있어야 합니다.
5. Element 내에서 구현할 수 없는 동작을 동작에 대해 새로운 Visitor 클래스를 만들고 모든 `visit` 메서드를 구현합니다.
6. Client는 Visitor 개체를 생성하고 `accept`를 통해 Element를 전달

<br>

## 장단점
### ✅ 장점
- **OCP**: 클래스를 변경하지 않고 새로운 동작을 추가할 수 있습니다. 
- **SRP**: 동일한 동작의 여러 버전을 하나의 클래스가 가집니다.
- 다양한 개체로 작업하는 동안 유용한 정보를 축적할 수 있습니다. 

### ❎ 단점
- Element 계층 구조에서 클래스가 추가되거나 제거될 때마다 모든 방문자를 업데이트해야 합니다.
- Visitor는 작업해야 하는 Element의 private 필드나 메서드에 접근 권한이 없을 수 있습니다.
<br><br>

--- 
[Visitor](https://refactoring.guru/design-patterns/visitor/swift/example)
