**Prototype Pattern**

## **1. Prototype Pattern이란?**

Prototype 패턴이란,

**프로토타입 패턴의 정의는 코드를 클래스에 종속시키지 않고**

**기존에 존재하던 객체를 복사할 수 있는 디자인 패턴입니다.**

어떤 객체가 존재하고 해당 객체와 정확하게 똑같은 객체를 만들고 싶을 때 프로토타입 패턴을 사용할 수 있습니다. 어떻게 하면 특정 객체와 동일한 객체를 만들 수 있을까 일단 클래스와 같은 참조 타입을 복사하는 방법에는 얕은 복사(shallow copy)와 깊은 복사 (deep copy)가 있습니다. 얕은 복사는 그냥 새로운 변수에 기존 객체를 할당하는 방법인데, 이렇게 생성한 객체는 기존 객체를 계속 가리키고 있기 때문에 새로운 객체를 만든 것이라 할 수 없어요. 따라서 해당 객체의 모든 정보를 동일하게 가진 새로운 객체를 만들기 위해서는 깊은 복사를 해줘야 하며 프로토타입 패턴은 이러한 작업을 쉽게 할 수 있도록 도와주는 패턴입니다.

****2. 프로토타입 패턴은 언제 사용되는가****

어떤 객체를 새로 만드는데 똑같은 값을 갖는 객체로 만들고 싶을 때 사용할 수 있습니다. 이를 해결하는 가장 간단한 방법은 원본 객체의 모든 값을 가지고 직접 새로운 객체를 만드는 방법인데요, 이렇게 직접 만드는 경우 접근 제한이 private인 프로퍼티에는 접근할 수 없기 때문에 복사를 하지 못할 수도 있습니다. 또한 복사본을 만들기 위해 원본 객체의 클래스를 알아야 하기 때문에 코드가 해당 클래스에 종속되어 의존성이 발생합니다. 
 
이런 상황에서 프로토타입 패턴을 사용할 수 있는데요, 매번 객체를 직접 만들기보다는 기존 객체의 정보와 동일한 정보를 갖는 새로운 객체를 생성하는 역할을 하는 프로토타입 클래스를 만들어서 간편하게 사용할 수 있습니다. 또한 프로토타입이 인터페이스를 갖는 객체를 허용하여 클래스 의존성도 해결할 수 있습니다. 즉 객체의 복제를 직접 하는 것이 아닌 프로토타입 클래스에 넘겨서 처리하는 패턴이라고 할 수 있습니다.

****3. 프로토타입 패턴의 결과****

- 프로토타입을 사용하면 클라이언트에 프로토타입 인스턴스를 등록하기만 하면 새로운 객체를     복제할 수 있게 됩니다.
-  이를 런타임에서 처리하기 때문에 다른 생성 패턴보다 유연하다고 할 수 있어요.
- 새로운 객체를 만들 때 default 값이 아닌 다른 값으로 객체를 생성할 수 있게 됩니다.
- 다양한 구조로 객체를 하위 클래스에서 만들 수 있게 됩니다.

****4. 프로토타입 패턴의 장단점****

장점 

- 객체를 클래스들에 의존하지 않고 복제할 수 있습니다.
- 반복되는 초기화 코드를 제거한 후 그 대신 미리 만들어진 프로토타입들을 복제하는 방법을 사용할 수 있습니다.
- 복잡한 객체들을 더 쉽게 생성할 수 있습니다.
- 복잡한 객체들에 대한 사전 설정들을 처리할 때 상속 대신 사용할 수 있는 방법입니다.

단점

- 순환 참조가 있는 복잡한 객체들을 복제하는 것은 매우 까다로울 수 있습니다.

## 작성한 코드
```swift

import Foundation

public protocol Prototype: AnyObject {
    init(prototype: Self)
}

extension Prototype {
    public func clone() -> Self {
        return type(of: self).init(prototype: self)
    }
}

public class iPhone: Prototype {
    public var cpu: String
    public var ram: Int
    public var display: String
    
    public init(cpu: String, ram: Int, display: String) {
        self.cpu = cpu
        self.ram = ram
        self.display = display
    }
    
    public required convenience init(prototype: iPhone) {
        self.init(cpu: prototype.cpu, ram: prototype.ram, display: prototype.display)
    }
    
    func specification() {
        print("iPhone Spec CPU: \(cpu) RAM: \(ram)GB Display: \(display)")
    }
}

let iPhone1 = iPhone(cpu: "M1", ram: 8, display: "12inch")

print("Original")
iPhone1.specification()

let iPhone1Clone = iPhone1.clone()

print("Clone")
iPhone1Clone.specification()

var iPhone2 = iPhone(cpu: "M2", ram: 16, display: "13inch")
var shallCopyiPhone2 = iPhone2
var deepCopyiPhone2 = iPhone2.clone()

shallCopyiPhone2.ram += 8
deepCopyiPhone2.ram += 16

iPhone2.specification()
deepCopyiPhone2.specification()


```
