# **Bridge Pattern**

[Bridge](https://refactoring.guru/design-patterns/bridge)

클래스 또는 밀접하게 연관된 클래스들의 집합을 두 개의 개별 계층구도(추상화 및 구현)로 나눈 뒤 각각 독립적으로 개발할 수 있도록 하는 구조 디자인 패턴이다.

# Problem

ex) `Circle` 및 `Square`라는 한 쌍의 자식 클래스들이 있는 기하학적 Shape 클래스가 있다고 가정해 본다. 이 클래스 계층구조를 확장하여 `Color`를 도입하기 위해 Red, Blue (Shape를 상속한 자식 클래스) 클래스들을 만들 계획이다. 

그러나, 이미 두 개의 자식 클래스가 있으므로 BlueCircle, RedSquare와 같은 네 가지의 클래스 조합을 만들어야 한다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5b4b16fa-b4da-46d7-9c56-574ca1c2c486/Untitled.png)

새로운 Shape 타입들과 색상 Type들을 추가할 때마다 계층 구조는 기하급수적으로 많이 만들어진다. 

ex) **`Triangle Shape`** 를 ****추가하려면 각 `Color`별로 하나씩(빨강, 파란) 두 개의 자식 클래스들을 도입해야 한다. 그 후에 또 새 색상을 추가하려면 각 Shape Type별로 하나씩 세 개의 자식 클래스를 만들어야 한다. 

**Summary**

- Type들이 많아질수록 코드는 점점 복잡해진다.

## Solution

위의 문제는 Shape와 Color의 두 Shape 클래스들을 확장하려고 하기 때문에 발생한다. 이것은 클래스 상속과 관련된 일반적인 문제이다.

`Bridge Pattern` 은 상속에서 객체 합성으로 전환하여 이 문제를 해결하는 것이다. 

이것이 의미하는 바는 하나의 별도 클래스 계층구조로 추출하여 원래 클래스들이 한 클래스 내에서 모든 상태와 행동들을 갖는 대신 새 계층 구조의 객체를 참조하도록 하는 것이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5e7b5eb9-cc74-4181-b687-5da5d82c263c/Untitled.png)

클래스 계층구조의 기하급수적인 확장을 방지하기 위하여 여러 관련 계층구조들로 변환할 수 있도록 한다.

이 접근 방식에 따르면, Color 관련 코드를 Red 및 Blue라는 클래스로 바로 추출할 수 있다. 그런 다음 `Shape` 클래스는 Color 객체들 중 하나를 가리키는 참조 프러퍼티를 받는다. 이제 Shape는 연결된 Color 객체에 모든 Color 관련 작업을 위임한다. 이 참조는 Shape 및 Color 클래스들 사이의 Bridge 역할을 할 것이다. 

→ 이제 새 Color들을 추가할 때 Shape 계층구조를 변경할 필요가 없으며 그 반대의 경우도 마찬가지이다.

### 추상화와 구현

추상화(interface == protocol) 는 일부 개체(entity)에 대한 상위 수준의 제어 Layer이다. 이 Layer는 자체적으로 실제 기능을 수행해서는 안되며(?), 기능들이 구현되는 객체에 위임해야 한다. 하지만 Swift는 Protocol extension을 통해 구현할 수 있다.

실제 앱을 예로 들면 추상화는 그래픽 사용자 인터페이스이며 구현은 그래픽 사용자 인터페이스 레이어가 사용자와 상호작용하여 그 결과로 호출하는 배경 운영 체제 코드(API)이다.

일반적으로 이러한 앱은 두 가지 독립적인 방향으로 확장할 수 있다.

- 다른 여러 개의 그래픽 사용자 인터페이스를 가진다.(예: 일반 고객 또는 관리자용으로 맞춘 인터페이스들)
- 여러 다른 API들을 지원한다.(맥, 리눅스, 윈도우에서 앱을 실행할 수 있는 API들)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/cf89530e-9716-40b2-ad1d-8d7fca622efd/Untitled.png)

브릿지 패턴은 클래스들을 두 개의 계층구조로 분리하여야 한다.

- 추상화 : App’s의 Graphic User Interface Layer
- 구현 : Operation System’s API

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4b9616b6-7ab0-4430-8fa0-7b76cb516fc8/Untitled.png)

**추상화 객체**

앱이 드러나는 모습을 제어하고 연결된 구현 객체에 실제 작업들을 위임한다. 서로 다른 구현들은 공통 인터페이스를 따르는 한 상호 호환이 가능하며, 이에 따라 같은 그래픽 사용자 인터페이스는 리눅스와 윈도우에 동시에 작동할 수 있다.

> 따라서 API 관련 클래스들을 건드리지 않고 그래픽 사용자 인터페이스 클래스들을 변경할 수 있다. 그리고 다른 운영 체제에 대한 지원을 추가하려면 **구현 계층구조 내에 자식 클래스를 생성하기만 하면 된다.**
> 

## 구조

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/76387a61-1c8e-4ae7-a3bb-66314efd8e84/Untitled.png)

1. **추상화**는 상위 Level의 메서드를 제공하며, 구현 객체에 의존해 실제 하위 Level 작업들을 수행한다.
2. **구현**은 모든 공통적인 인터페이스를 선언하며, 추상화는 여기에 선언된 메서드들을 통해서만 구현 객체와 소통할 수 있다.
    - 추상화는 구현과 같은 메서드들을 나열할 수 있지만 보통은 구현이 선언한 다양한 원시 작업들에 의존하는 몇 가지 복잡한 행동들을 선언하는 것이다.
3. 구상 구현들에는 플랫폼별 코드가 포함된다.
4. 정제된 추상화들은 제어 논리의 변형들을 제공한다. 그들은 그들의 부모처럼 일반 구현 인터페이스를 통해 다른 구현들과 작업한다.
5. 일반적으로 `Client`는 추상화와 작업하는데만 관심이 있다. 그러나 추상화 객체를 구현 객체들 중 하나와 연결하는 것도 `Client`의 역할이다.

## 의사코드

ex) 기기와 리모컨을 관리하는 앱의 Monolithic 코드를 나누는 데 Bridge 패턴의 활용에 대해 알아본다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9178a852-bb15-4066-a35e-47701fc0efb8/Untitled.png)

`Device` 클래스들은 구현의 역할 

`Remote` 클래스들은 추상화의 역할

- 초기에 리모컨클래스는 Device 클래스 객체와 연결하는 참조 프로퍼티를 선언한다.
- 모든 리모컨은 일반 Device 인터페이스를 통해 장치들과 작동하므로 같은 리모컨이 여러 Device Type을 지원할 수 있다.

Device 클래스들과 독립적으로 리모컨 클래스들을 개발할 수 있으며, 필요한 것은 새로운 리모컨 자식 클래스를 만드는 것뿐이다. 예를 들어 초기 리모컨에는 버튼이 두 개뿐일 수 있지만, 터치 스크린, 배터리 기능등을 추가하도록 확장할 수 있다.

- **Abstraction**

```swift
class SoundButton {
		// MARK: Bridge
		var soundButtonImplementor: SoundButtonImplementor?

		init(implementor: SoundButtonImplementor) {
				self.soundButtonImplementor = implementor
		}

		func up() {
			self.soundButtonImplementor?.volumeUp()
		}

		func down() {
					self.soundButtonImplementor?.volumeDown()
		}

		func set(_ percent: Float) {
				self.soundButtonImplementor?.setVolume(percent: percent)
		}
}
```

- **Implementor**

```swift
protocol SoundButtonImplementor {
    var volume: Float { get set }
    func volumeUp()
    func volumeDown()
    func setVolume(percent: Float)
}
```

- **Concrete Implementor**

```swift
class TvSoundButton: SoundButtonImplementor {
    var volume: Float = 0
    func volumeUp() {
        if volume >= 1.0 {
            print("TV 볼륨이 최대값입니다.")
        } else {
            volume = min(volume + 0.1, 1.0)
            print("TV 볼륨 \(volume)으로 올림")
        }
    }
    
    func volumeDown() {
        if volume <= 0.0 {
            print("TV 볼륨이 최저값입니다.")
        } else {
            volume = max(volume - 0.1, 0.0)
            print("TV 볼륨 \(volume)으로 내림")
        }
    }
    func setVolume(percent: Float) {
        if percent < 0.0 || percent > 1.0 {
            print("잘못된 TV 볼륨 값")
        } else {
            volume = percent
            print("TV 볼륨 \(volume)으로 세팅")
        }
    }
}
```

- **Concrete Implementor**

```swift
class RadioSoundButton: SoundButtonImplementor {
    var volume: Float = 0
    func volumeUp() {
        if volume >= 1.0 {
            print("Radio 볼륨이 최대값입니다.")
        } else {
            volume = min(volume + 0.1, 1.0)
            print("Radio 볼륨 \(volume)으로 올림")
        }
    }
    
    func volumeDown() {
        if volume <= 0.0 {
            print("Radio 볼륨이 최저값입니다.")
        } else {
            volume = max(volume - 0.1, 0.0)
            print("Radio 볼륨 \(volume)으로 내림")
        }
    }
    func setVolume(percent: Float) {
        if percent < 0.0 || percent > 1.0 {
            print("잘못된 Radio 볼륨 값")
        } else {
            volume = percent
            print("Radio 볼륨 \(volume)으로 세팅")
        }
    }
}
```

- ***Refined Abstraction***

```swift
class AdvancedSoundButton: SoundButton {
    func mute() {
        self.soundButtonImplementor?.setVolume(percent: 0.0)
    }
}
```

위와 같이 추가 기능을 구현부에 직접 만드는 것이 아닌 Abstraction에 만든 것

이렇게 되면 실제 기능을 추가할 때 모든 구현부에 적용하지 않고 위와 같이 Abstraction에만 추가하면 된다.

- ***Refined Abstraction***

```swift
extension SoundButton {
    func mute() {
        self.soundButtonImplementor?.setVolume(percent: 0.0)
    }
}
```

Swift에서는 extension을 활용.

- **Execute**

```swift
let tvSoundButton = TvSoundButton()
let soundButton = SoundButton(implementor: tvSoundButton)
soundButton.down()

let radio = RadioSoundButton()
soundButton.soundButtonImplementor = radio
soundButton.set(percent: 0.5)

soundButton.mute()
```

## 브릿지 패턴 적용

- **어떤 기능의 여러 변형을 가진 Monolithic 클래스를 나누고 정리할 때**

ex) 클래스가 다양한 데이터베이스 서버들과 상호작용 할 경우

클래스의 덩치가 커질수록 하나의 기능을 변경하려면 클래스 전체에 걸쳐 여러 기능을 변경해야 할 수 잇으며 이는 side-effect를 초래할 수 있다.

브릿지 패턴을 사용하면 Monolithic 클래스를 여러 클래스 계층구조로 나눌 수 있다. 

그런 다음 각 계층구조의 클래스들을 다른 계층구조들에 있는 클래스들과는 독립적으로 변경할 수 있다. 

- **독립적으로 기능을 둬서 클래스를 확장해야 할 때**

브릿지 패턴은 각 계층에 대한 별도의 클래스 계층구조를 추출할 것을 제안한다. 원래 클래스는 모든 작업을 자체적으로 수행하는 대신 추출된 계층구조들에 속한 객체들에 관련 작업들을 위임한다.

- **런타임에 구현을 전환할 수 있어야 할 때**

선택 사항이지만 브릿지 패턴을 사용하면 추상화 내부의 구현 객체를 바꿀 수 있으며, 필드에 새 값을 할당하기만 하면 된다.

> **브리지와 Strategy 패턴을 혼동할 수 있다.**
> 

## Pros

- 독립적인 클래스들로 앱을 만들수 있다.
- 클라이언트 코드는 상위 Level의 추상화를 통해 작동하며, 세부 정보는 노출되지 않는다.
- 개방/폐쇄 원칙을 준수하여 새로운 추상화, 구현들을 상호 독립적으로 도입할 수 있다.
- 단일 책임 원칙. 추상화의 상위 Level 로직과 구현의 세부 정보에 집중할 수 있다.

## Cons

- 결합도가 높은 클래스에 패턴을 적용하면 코드를 더 복잡하게 만들 수 있다.

## **다른 패턴과의 관계**

- **[브리지](https://refactoring.guru/ko/design-patterns/bridge)**는 일반적으로 사전에 설계되며, 앱의 다양한 부분을 독립적으로 개발할 수 있도록 합니다. 반면에 **[어댑터](https://refactoring.guru/ko/design-patterns/adapter)**는 일반적으로 기존 앱과 사용되어 원래 호환되지 않던 일부 클래스들이 서로 잘 작동하도록 합니다.
- **[브리지](https://refactoring.guru/ko/design-patterns/bridge)**, **[상태](https://refactoring.guru/ko/design-patterns/state)**, **[전략](https://refactoring.guru/ko/design-patterns/strategy)** 패턴은 매우 유사한 구조로 되어 있으며, **[어댑터](https://refactoring.guru/ko/design-patterns/adapter)** 패턴도 이들과 어느 정도 유사한 구조로 되어 있습니다. 위 모든 패턴은 다른 객체에 작업을 위임하는 합성을 기반으로 합니다. 하지만 이 패턴들은 모두 다른 문제들을 해결합니다. 패턴은 특정 방식으로 코드의 구조를 짜는 레시피에 불과하지 않습니다. 왜냐하면 패턴은 해결하는 문제를 다른 개발자들에게 전달할 수도 있기 때문입니다.
- 당신은 **[추상 팩토리](https://refactoring.guru/ko/design-patterns/abstract-factory)**를 **[브리지](https://refactoring.guru/ko/design-patterns/bridge)**와 함께 사용할 수 있습니다. 이 조합은 *브리지*에 의해 정의된 어떤 추상화들이 특정 구현들과만 작동할 수 있을 때 유용합니다. 이런 경우에 *추상 팩토리*는 이러한 관계들을 캡슐화하고 클라이언트 코드에서부터 복잡성을 숨길 수 있습니다.
- **[빌더](https://refactoring.guru/ko/design-patterns/builder)**를 **[브리지](https://refactoring.guru/ko/design-patterns/bridge)**와 조합할 수 있습니다. 디렉터 클래스는 추상화의 역할을 하고 다양한 빌더들은 구현의 역할을 합니다.