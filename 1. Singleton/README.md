[Singleton](https://refactoring.guru/design-patterns/singleton)
[Apple Developer Documentation](https://developer.apple.com/documentation/swift/cocoa_design_patterns/managing_a_shared_resource_using_a_singleton/)

[Singleton](https://developer.apple.com/library/archive/documentation/General/Conceptual/DevPedia-CocoaCore/Singleton.html)

> 특정 용도로 객체를 하나만 생성하여, 공용으로 사용하고 싶을 때 사용하는 디자인 패턴

**Singleton**은 클래스에 인스턴스가 하나만 있는지 확인하는 동시에 이 인스턴스에 대한 전역 접근 지점을 제공하는 생성 디자인 패턴이다.

## Problem

Singleton 패턴은 단일 책임 원칙을 위반하여 두 가지 문제를 동시에 해결한다.

1. 클래스에 인스턴스가 하나만 있는지 확인한다. 왜 누군가가 클래스에 있는 instance 수를 제한하고 싶어 할까? → 일부 공유 리소스(예: 데이터 베이스 또는 파일)에 대한 접근을 제어하기 위한 것이다.

**작동 방식**

객체를 생성했지만 새 객체를 받는 대신 이미 만든 객체를 받게 된다. 

생성자 호출은 항상 새 객체를 반환 해야하므로 이 동작은 일반 생성자로 구현할 수 없다.

1. 해당 인스턴스에 대한 전역 접근 지점을 제공한다. 일부 필수 객체를 저장하는 데 사용했던 전역 변수를 만들어서 사용한다. 매우 편리하지만 모든 코드가 잠재적으로 해당 변수의 내용을 덮어쓸 수 있고 앱이 충돌할 가능성이 존재해 안전하지 않다.

전역 변수와 마찬가지로 Singleton 패턴을 사용하면 프로그램의 어느 곳에서나 일부 객체에 접근할 수 있다. 다른 코드가 해당 인스턴스를 덮어쓰지 않도록 보호해야 한다.

**Singleton의 구현** 

- Singleton 클래스가 새로운 인스턴스 객체를 생성하지 못하도록 기본 생성자를 비공개로 설정한다.
- 생성자 역할을 하는 정적 생성 메서드를 만든다. 내부적으로는 이 메서드는 private 생성자를 호출하여 객체를 만들고 정적 필드에 저장한다. 이  메서드에 대한 다음의 모든 호출은 캐시된 객체를 반환한다.

코드가 Singleton 클래스에 접근할 수 있는 경우 Singleton의 정적 메서드를 호출할 수 있다. 따라서 해당 메서드를 호출할 때마다 항상 동일한 인스턴스가 반환된다.

```swift
class SampleSingletonClass {
	public static let shared = SampleSingletonClass()

	private init() { }

	public func save() {
		// ....
	}
}
```

- 싱글톤 클래스는 APP이 요청환 횟수와 상관없이 동일한 인스턴스 반환
- 일반적인 클래스에서는 호출자가 원하는 만큼 클래스의 인스턴스 만들수 있음
- 싱글톤 클래스는 프로세스당 클래스의 인스턴스가 하나만 있을 수 있음
- 싱글톤 객체는 해당 클래스의 리소스에 대한 전역 접근 지점을 제공
- **싱글톤은 일반적인 서비스나 리소스를 제공하는 클래스와 같이 단일 제어 지점이 필요한 상황에서 사용.**

---

- 팩토리 메서드를 통해 싱글톤 클래스에서 전역 인스턴스를 얻음
- 클래스는 처음 요청될 때 유일한 인스턴스를 느리게 생성하고 그후에는 다른 인스턴스를 생성할 수 없도록 함.
- 싱글톤 클래스는 또한 호출자가 인스턴스를 복사, 유지 또는 해체하는 것을 방지
- 필요하면 자신만의 싱글톤 클래스 생성 가능
- 여러 Cocoa Framework 클래스는 싱글톤
- UIKit의 NSFileManager, NSWorkspace, UIApplication, UIAccelerometer 가 포함됨
- 싱글톤 인스턴스를 반환하는 팩토리 메서드의 이름은 규칙에 따라 Shared Class Type 형식
- Cocoa 프레임워크의 예 sharedFileManager, sharedColorPanel, sharedWorkspace

---

## Shared Class Type

```swift
class Singleton { 
	 static let shared = Singleton()
}
```

```swift
class Singleton {
		static let shared: Singleton = {
				let instance = Singleton()
				return instance	
		}()
}
```