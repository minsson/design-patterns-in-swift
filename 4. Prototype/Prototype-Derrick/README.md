# Prototype

[Prototype](https://refactoring.guru/design-patterns/prototype)

[[Swift 디자인 패턴] Prototype Pattern (프로토타입) - 디자인 패턴 공부 5](https://icksw.tistory.com/238)

## **Intent**

**`Prototype`**은 기존 객체의 클래스에 종속되지 않고 기존 객체를 복사할 수 있는 창의적인 디자인 패턴입니다.

![https://refactoring.guru/images/patterns/content/prototype/prototype.png?id=e912b1ada20bbf7b2ffc09e93b9fab20](https://refactoring.guru/images/patterns/content/prototype/prototype.png?id=e912b1ada20bbf7b2ffc09e93b9fab20)

## **Problem**

객체가 있는데 그 객체의 정확한 복사본을 만들고 싶다고 가정해 보십시오. 

**그걸 어떻게 하시겠어요?**

→ 먼저 `**동일한 클래스의 새 개체**`를 만들어야 합니다.

→ 그런 다음 원래 개체의 모든 필드를 살펴보고 **해당 값을 새 개체에 복사**해야 합니다.

**단점**

- 객체의 필드 중 일부는 `private` 일 수 있고 객체 자체를 외부에서 볼 수 없기 때문에 모든 객체를 이런 방식으로 복사할 수 없다.

![https://refactoring.guru/images/patterns/content/prototype/prototype-comic-1-en.png?id=4cc45ae42e26cc9533a6ac540713d1fa](https://refactoring.guru/images/patterns/content/prototype/prototype-comic-1-en.png?id=4cc45ae42e26cc9533a6ac540713d1fa)

**개체를 "외부에서" 복사하는 것이 항상 가능한 것은 아닙니다.**

Direct approach에는 한가지 문제가 더 있다. copy를 하려면 객체의 클래스를 알아야 하므로 코드는 해당 클래스에 종속된다. 

**만약 추가적인 의존이 문제가 없다면, 다른 함정일 수 있다.**

ex) 메서드의 매개 변수가 특정 인터페이스를 따르는 객체를 허용할 때 객체가 따르는 인터페이스만 알고 `**concrete class**`는 모르는 경우가 있다.

## **Solution**

`Prototype` 패턴은 `clone` 프로세스를 `clone` 중인 실제 객체로 위임한다.

- 해당 패턴은 `clone`를 지원하는 모든 객체에 대해 공통 인터페이스를 선언한다.
- 이 인터페이스를 사용하면 코드를 해당 객체의 클래스에 연결하지 않고도 객체를 `clone`할 수 있다. **일반적으로 이런 인터페이스는 단일** `clone` **method만 포함한다.**

`clone` 메서드의 구현은 모든 클래스와 유사하다. 메서드는 현재 클래스의 객체를 만들고 이전 객체의 모든 필드 값을 새 객체로 전달한다. 대부분의 프로그래밍 언어는 객체가 동일한 클래스에 속하는 다른 객체의 `private field`에 접근할 수 있도록 허용하므로 `private field`도 복사할 수 있다.

`clone` 을 지원하는 객체를 `Prototype`이라고 부른다. 객체에 수십 개의 필드와 수백 개의 가능한 구성이 있는 경우 이런 필드를 `clone` 하는 것이 `subclassing` 의 대안으로 사용될 수 있다.

![https://refactoring.guru/images/patterns/content/prototype/prototype-comic-2-en.png?id=e1df2dc39404c5eb2d485b7ae7c9914f](https://refactoring.guru/images/patterns/content/prototype/prototype-comic-2-en.png?id=e1df2dc39404c5eb2d485b7ae7c9914f)

미리 구성된 `prototype` 은 subclassing의 대안이 될 수 있다.

**작동 방식** 

- 다양한 방식으로 구성된 객체 집합을 만든다.
- 구성한 객체와 같은 객체가 필요한 경우 처음부터 새 객체를 생성하는 대신 `prototype`만 복제하면 된다.

## **Real-World Analogy**

In real life, prototypes are used for performing various tests before starting mass production of a product. However, in this case, prototypes don’t participate in any actual production, playing a passive role instead.

실제 생활에서, `prototype`은 제품 양산을 시작하기 전에 다양한 테스트를 수행하는 데 사용된다. 그러나 이 경우 `prototype`은 실제 생산에 참여하지 않고 수동적인 역할만 한다.

![https://refactoring.guru/images/patterns/content/prototype/prototype-comic-3-en.png?id=ff16dedbd0c10944d27bf87d2adcf8a6](https://refactoring.guru/images/patterns/content/prototype/prototype-comic-3-en.png?id=ff16dedbd0c10944d27bf87d2adcf8a6)

**cell의 분할**

산업적인 `prototype`은 실제로 자신을 복제하지 않기 때문에, 패턴과 훨씬 더 유사한점은 유사분열 세포 분열 프로세스이다. original cell은 prototype으로 작동하여 복사본을 만드는데 적극적인 역할을 한다.

## **Structure**

### **Basic implementation**

![https://refactoring.guru/images/patterns/diagrams/prototype/structure.png?id=088102c5e9785ff45debbbce86f4df81](https://refactoring.guru/images/patterns/diagrams/prototype/structure.png?id=088102c5e9785ff45debbbce86f4df81)

1. **`Prototype`** 인터페이스는 `clone` 메서드를 선언한다. 대부분의 경우에서, `**single clone method**`이다.
2. **`Concrete Prototype`** 클래스는 `clone` 메서드를 구현한다. 이 메서드는 원래 객체의 데이터를 `clone`에 복사하는 것 외에도 연결된 객체 복제, 재귀 종속성 풀기 등과 관련된 `cloning` 프로세스의 일부 `edge case`도 처리할 수 있다.
3. **`Client`** 는 prototype 인터페이스를 따르는 모든 객체의 복사본을 생성할 수 있다.

> **edge case :** 알고리즘이 처리하는 데이터의 값이 알고리즘의 특성에 따른 일정한 범위를 넘을 경우 발생하는 문제를 가리킨다.
> 

### **Prototype registry implementation**

![https://refactoring.guru/images/patterns/diagrams/prototype/structure-prototype-cache.png?id=609c2af5d14ed55dcbb218a00f98e7d5](https://refactoring.guru/images/patterns/diagrams/prototype/structure-prototype-cache.png?id=609c2af5d14ed55dcbb218a00f98e7d5)

1. **`Prototype Registry`** 를 사용하면 자주 사용되는 prototype에 접근할 수 있다. 복사할 준비가 된 사전 빌드 객체 집합을 저장한다. 가장 간단한 **`Prototype Registry`** 는 `name → prototype`  해시 맵이다. 단순한 이름보다 더 나은 검색 기준이 필요한 경우 훨씬 강력한 버전의 `**Registry`** 를 작성할 수 있다.

## **Pseudocode**

이 예제에서 **`Prototype`** 패턴을 사용하면 코드를 클래스에 결합하지 않고 기하학적 객체의 정확한 복사본을 생성할 수 있습니다.

![https://refactoring.guru/images/patterns/diagrams/prototype/example.png?id=47bc6c1058cb100b81e675b5ca6bda6c](https://refactoring.guru/images/patterns/diagrams/prototype/example.png?id=47bc6c1058cb100b81e675b5ca6bda6c)

***클래스 계층에 속하는 객체 집합을 복제한다.***

모든 `shape` 클래스는 `cloning method`을 제공하는 동일한 인터페이스를 채택한다. `subclass`는 자체 필드 값을 결과 개체에 복사하기 전에 **`parent’s cloning method`**를 호출할 수 있다.

**Protype Protocol**

```swift
public protocol Prototype: AnyObject {
		init(prototype: Self)
}

extension Prototype {
		public func clone() -> Self {
				return type(of: self).init(prototype: self)
		}
}
```

**Concrete Prototype 1** 

```swift
public class Marin: Prototype {
		public var health: Int
		public var attack: Int
		public var defence: Int

		public init(health: Int, attack: Int, defence: Int) {
				self.health = health
				self.attack = attack
				self.defence = defence
		}

		public required convenience init(prototype: Marin) {
        self.init(health: prototype.health,
									attack: prototype.attack,
								  defence: prototype.defence)
    }
		func printStatus() {
		    print("Marin Health: \(health) Attack: \(attack) Defence: \(defence)")
    }

}
```

**Concrete Prototype 2**

```swift
// Concrete Prototype
public class Medic: Prototype {
    public var health: Int
    public var mana: Int
    public var defence: Int
    
    public init(health: Int, mana: Int, defence: Int) {
        self.health = health
        self.mana = mana
        self.defence = defence
    }
    
    public required convenience init(prototype: Medic) {
        self.init(health: prototype.health, 
									mana: prototype.mana, 
									defence: prototype.defence)
    }

    func printStatus() {
        print("Medic Health: \(health) Mana: \(mana) Defence: \(defence)")
    }
}
```

**Implemented code**

```swift
import Foundation

let marin = Marin(health: 40, 
									attack: 5, 
									defence: 1)

let medic = Medic(health: 50, 
									mana: 20, 
									defence: 1)

marin.printStatus()
medic.printStatus()
```

**Call clone method** 

```swift
var newMarin = marin.clone()
var newMedic = medic.clone()

print("Clone")

newMarin.printStatus()
newMedic.printStatus()
```

- **위의 clone 메서드는 정말 새로운 객체를 생성한 것일까?**

```swift
var marin = Marin(health: 40, 
									attack: 5, 
									defence: 1)

var shallowCopyMarin = marin
var deepCopyMarin = marin.clone()

shallowCopyMarin.health += 7
deepCopyMarin.defence = += 5

shallowCopyMarin.printStatus()
deepCopyMarin.printStatus()
```

## **Applicability**

코드가 복사해야 하는 객체의 `**concrete class**`에 의존해서는 안 되는 경우 `**prototype**` 패턴을 사용하라.

이 문제는 코드가 일부 인터페이스를 통해 `3rd-party` 코드에서 사용자에게 전달된 객체와 함께 작동할 때 자주 발생한다. 이 객체들의 **`concrete classes`**는 알려져 있지 않고, 의지하고 싶어도 `**concrete classes**`에 의존할 수 없다.

The Prototype pattern provides the client code with a general interface for working with all objects that support cloning. This interface makes the client code independent from the concrete classes of objects that it clones.

`**prototype**` 패턴은 `cloning`을 지원하는 모든 객체로 작업할 수 있는 일반 인터페이스를 클라이언트 코드에 제공한다. 이 인터페이스는 클라이언트 코드를 `cloning`하는 객체의 `**concrete classes**`와 독립적이게 만든다.

**`subclass` 의 수를 줄이려면 각 객체를 초기화하는 방식만 다른 이 패턴을 사용하라.**

사용하기 전에 복잡한 구성을 필요로 하는 복잡한 클래스가 있다고 가정한다.

- 이 클래스를 구성하는 몇 가지 일반적인 방법이 있으며, 이 코드는 앱에 흩어져 있습니다.
- 중복을 줄이려면 여러 하위 클래스를 만들고 모든 공통 구성 코드를 해당 생성자에 넣는다.
- 중복 문제는 해결했지만, 지금은 dummy subclass들이 많이 있다.

`**Prototype**` 패턴을 사용하면 다양한 방식으로 구성된 `**pre-built objects**` 집합을 `**Prototype**`으로 사용할 수 있다.

일부 구성과 일치하는 하위 클래스를 인스턴스화하는 대신 클라이언트는 적절한`**Prototype**`을 찾아서 복제할 수 있다.

## ****How to Implement****

1. `**Prototype**` 인터페이스를 만들고 그 안에 `clone` 메서드를 선언한다. 또는 기존 클래스 계층 구조의 모든 클래스에 메서드를 추가한다(있는 경우).

2. `**Prototype**` 클래스는 해당 클래스의 개체를 인수로 받아들이는 대체 `initializer`를 정의해야 한다. 

- `initializer`는 클래스에 정의된 모든 필드의 값을 전달된 개체에서 새로 만든 인스턴스로 복사해야 한다.
- 하위 클래스를 변경하는 경우 상위 생성자를 호출하여 상위 클래스가 해당 개인 필드의 복제를 처리하도록 해야 합니다.
- 프로그래밍 언어가 메서드 오버로드를 지원하지 않는 경우 별도의 `**Prototype**` 생성자를 만들 수 없다.
- 따라서 객체의 데이터를 새로 생성된 복제본으로 복사하는 작업은 **`cloning method`** 내에서 수행되어야 한다. 그러나 새 연산자를 호출한 직후 결과 개체가 완전히 구성되었으므로 일반 생성자에 이 코드가 있으면 더 안전하다.

3. The cloning method usually consists of just one line: running a `new` operator with the prototypical version of the constructor. Note, that every class must explicitly override the cloning method and use its own class name along with the `new` operator. Otherwise, the cloning method may produce an object of a parent class.

3. `**cloning method**`은 일반적으로 생성자의 `**prototype**` 버전을 사용하여 새 연산자를 실행하는 한 줄로만 구성된다.

- 모든 클래스는 `**cloning method**`을 명시적으로 재정의하고 자체 클래스 이름을 새 연산자와 함께 사용해야 한다. 그렇지 않으면 `**cloning method**`이 부모 클래스의 개체를 생성할 수 있다.

4.추가적으로, 자주 사용하는 `Prototype의 Catalog`를 저장할 중앙 집중식 `**Prototype Registry**`를 만든다.

`**Registry**`를 새 `**factory class**`로 구현하거나 `prototype`을 가져오는 `**static method**`을 사용하여 기본 `prototype` class에 넣을 수 있다.

이 메서드는 클라이언트 코드가 메서드에 전달하는 검색 기준에 따라 프로토타입을 검색해야 합니다.

 기준은 단순 문자열 태그 또는 복잡한 검색 매개 변수 집합일 수 있습니다. 적합한 프로토타입을 찾은 후 레지스트리는 이를 복제하고 사본을 클라이언트에 반환해야 합니다.

마지막으로 하위 클래스의 생성자에 대한 직접 호출을 프로토타입 레지스트리의 팩토리 메서드에 대한 호출로 바꿉니다.

## **Pros**

- `concrete class`에 결합하지 않고 객체를 `clone`할 수 있습니다.
- 반복된 초기화 코드를 제거하여 pre-built prototype을 복제할 수 있습니다.
- 복잡한 객체를 더 편리하게 제작할 수 있습니다.

## **Cons**

- 복잡한 객체에 대한 구성 사전 설정을 처리할 때 상속 대신 사용할 수 있습니다.
- 순환 참조가 있는 복잡한 객체를 복제하는 것은 매우 어려울 수 있습니다.

## **Relations with Other Patterns**

- Many designs start by using **[Factory Method](https://refactoring.guru/pattern/factory-method)** (less complicated and more customizable via subclasses) and evolve toward **[Abstract Factory](https://refactoring.guru/pattern/abstract-factory)**, **[Prototype](https://refactoring.guru/pattern/prototype)**, or **[Builder](https://refactoring.guru/pattern/builder)** (more flexible, but more complicated).
- **[Abstract Factory](https://refactoring.guru/pattern/abstract-factory)** classes are often based on a set of **[Factory Methods](https://refactoring.guru/pattern/factory-method)**, but you can also use **[Prototype](https://refactoring.guru/pattern/prototype)** to compose the methods on these classes.
- **[Prototype](https://refactoring.guru/pattern/prototype)** can help when you need to save copies of **[Commands](https://refactoring.guru/pattern/command)** into history.
- Designs that make heavy use of **[Composite](https://refactoring.guru/pattern/composite)** and **[Decorator](https://refactoring.guru/pattern/decorator)** can often benefit from using **[Prototype](https://refactoring.guru/pattern/prototype)**. Applying the pattern lets you clone complex structures instead of re-constructing them from scratch.
- **[Prototype](https://refactoring.guru/pattern/prototype)** isn’t based on inheritance, so it doesn’t have its drawbacks. On the other hand, *Prototype* requires a complicated initialization of the cloned object. **[Factory Method](https://refactoring.guru/pattern/factory-method)** is based on inheritance but doesn’t require an initialization step.
- Sometimes **[Prototype](https://refactoring.guru/pattern/prototype)** can be a simpler alternative to **[Memento](https://refactoring.guru/pattern/memento)**. This works if the object, the state of which you want to store in the history, is fairly straightforward and doesn’t have links to external resources, or the links are easy to re-establish.
- **[Abstract Factories](https://refactoring.guru/pattern/abstract-factory)**, **[Builders](https://refactoring.guru/pattern/builder)** and **[Prototypes](https://refactoring.guru/pattern/prototype)** can all be implemented as **[Singletons](https://refactoring.guru/pattern/singleton)**.