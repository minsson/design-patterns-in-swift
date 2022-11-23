# Facade Pattern

- [개인 기술블로그 글](https://velog.io/@minsson/facade) 내용 옮겨 적음

![](https://velog.velcdn.com/images/minsson/post/4752523a-ab08-44b3-a979-a70dbf2f1370/image.png)

## 🏞️ 퍼사드 패턴이란?

- 라이브러리, 프레임워크 또는 다른 클래스들의 복잡한 집합에 대해 단순화된 인터페이스를 제공하는 구조적 디자인 패턴
- façade는 프랑스어로 건물의 정면을 의미한다. 건물 안에 무엇이 들어있을지는 모른다. 다만 우리 눈에는 정면이 보일 뿐이다.


## 🏞️ 문제

- 다양한 외부 라이브러리, 프레임워크를 사용한다고 하자.
- 이 객체들을 매번 이니셜라이즈 해야 하고, 의존 관계를 추적하고, 올바른 순서로 사용해야 한다.
- 결과적으로 각 객체들의 비즈니스 로직은 서드파티 클래스들의 세부 구현사항과 강력하게 결합된다.

## 🏞️ 해결책

- 외부 라이브러리, 프레임워크에서 필요한 기능만 추린다.
- 내 코드의 비즈니스 로직과 필요한 기능 간의 간단한 인터페이스를 제공하는 `Facade` 타입을 만들어 사용한다.

## 🏞️ 예시

- 서류를 발급 받아야 해 동사무소에 전화를 해야 한다고 하자. 동사무소 각 부서의 전화번호와 담당자를 다 알고 있어야 한다면 머리가 아플 것이다.
- 그런데 동사무소에 전화하면 상담원 분이 계신다. 이 분에게 필요한 걸 말씀 드리면 관련 부서 담당자에게 연결해주시고, 부서 담당자는 업무를 처리해준다. 이때, 상담원 분이 Facade 객체라고도 볼 수 있다.

## 🏞️ 구조

![](https://velog.velcdn.com/images/minsson/post/a1a62835-a547-4ac1-8179-bac779754c77/image.png)

### 🧩 1) **퍼사드**

- Facade 객체를 사용하면 Subsystem 기능들의 특정한 부분에 편리하게 접근할 수 있다.
- Facade 객체는 클라이언트의 요청을 어느 객체로 보내야 할지, 어떤 데이터가 이를 위해 필요한지 알고 있다.

### 🧩 2) **추가적인 퍼사드** (옵셔널)

- 하나의 퍼사드에 관련 없는 다양한 기능을 모아 놓으면 그 퍼사드가 너무 복잡한 구조가 될 수 있다.
- 클라이언트도, 다른 퍼사드들도 이 추가적인 퍼사드를 사용할 수 있다.

### 🧩 3) **복잡한 하위 시스템 (정리 필요)**

- 매우 많은 다양한 객체들로 구성된다.
- 하위시스템이 잘 작동하게 하려면, 하위시스템의 세부 구현 정보 및 객체들의 이니셜라이즈 순서를 알고, 적절한 형식의 데이터를 제공해야 한다.
- 하위시스템은 퍼사드의 존재를 알지 못하며, 하위시스템들끼리 직접 소통한다.

### 🧩 4) **클라이언트**

- 하위 시스템 객체들을 직접 호출하는 대신 퍼사드를 사용한다.

## 🏞️ 예시 코드

- 영화를 보고 싶다고 하자. 낮이라면 블라인드도 내리고, 조명도 끄고, TV를 켜고, Apple TV 등으로 영화를 틀어야 할 것이다.

### 🧩 1) main.swift

- 두 명의 사람이 있다고 하자.
- 구조에서의 설명과 일치시키기 위해 `Client`라고 해놨지만, Person이라고 생각하는 게 더 자연스러울 것 같다.
- `Client`와 `ClientWithFacade`가 있다.

```swift
import Foundation

let client = Client()
client.turnOnMovieMode()
client.turnOffMovieMode()

let clientWithFacade = ClientWithFacade()
clientWithFacade.siri.turnOnMovieMode()
clientWithFacade.siri.turnOffMovieMode()
```

### 🧩 2) Libraries.swift (Subsystems)

- 우리가 가져다 써야할 물건들, 즉, 라이브러리다.

```swift
struct Blind {
    func rollUp() { }
    func rollDown() { }
}

struct Light {
    func turnOn() { }
    func turnOff() { }
}

struct TV {
    func turnOn() { }
    func turnOff() { }
}

struct AppleTVSoftware {
    func findMovie() { }
    func showMoive() { }
}
```

### 🧩 3) Client.swift

- `Client`가 영화를 보고 싶다면, 우선 블라인드, 조명, TV, Apple TV를 모두 인지하고, 영화를 볼 때는 블라인드를 내리고, 조명을 끄고, TV를 켜고, Apple TV를 통해 영화를 찾고, 영화를 보여달라고 요청하기 위한 메서드가 필요하다.

```swift
struct Client {
    private let blind = Blind()
    private let light = Light()
    private let tv = TV()
    private let appleTVsoftware = AppleTVSoftware()
    
    func turnOnMovieMode() {
        blind.rollDown()
        light.turnOff()
        tv.turnOn()
        appleTVsoftware.findMovie()
        appleTVsoftware.showMoive()
    }
    
    func turnOffMovieMode() {
        blind.rollUp()
        light.turnOn()
        tv.turnOff()
    }
}
```

- 하지만 `Facade`를 활용한다면 클라이언트 코드를 아래와 같이 줄일 수 있다.
- 그냥 모든 걸 대신해줄 Siri 같은 존재인 `Facade`를 알고 있으면 된다. “시리야, 무슨무슨 영화 틀어줘!”라고 하면 알아서 해주는 것과 같다.
    - 사족이지만 집에 그런 스마트홈 생태계를 얼른 구축하고 싶다.. 🥲 연동 가능한 전동블라인드 사고 싶다.

```swift
struct ClientWithFacade {
    let siri = SiriFacade()
}
```

- 어떻게 이게 가능한 걸까?

### 🧩 4) Facade

- `Facade` 안에 필요한 것들이 구현되어 있기 때문이다.
- `Blind`, `Light`, `TV`, `AppleTVSoftware`로 여러가지 행동을 할 수 있겠지만, `Client`에서는 `영화감상모드 시작 혹은 영화감상모드 종료가 필요할 뿐이다.` 그래서 `이 두 가지 기능만을 제공할 수 있게 메서드를 정의`해놓았다.

```swift
struct SiriFacade {
    private let blind = Blind()
    private let light = Light()
    private let tv = TV()
    private let appleTVsoftware = AppleTVSoftware()
    
    func turnOnMovieMode() {
        blind.rollDown()
        light.turnOff()
        tv.turnOn()
        appleTVsoftware.findMovie()
        appleTVsoftware.showMoive()
    }
    
    func turnOffMovieMode() {
        blind.rollUp()
        light.turnOn()
        tv.turnOff()
    }
}
```

## 🏞️ 장점

- 복잡한 하위시스템의 컴포넌트들로부터 클라이언트를 분리한다.

## 🏞️ 단점

- 프로그램의 모든 객체와 연결된 갓 오브젝트가 될 수 있다는 리스크가 있다.

## 🏞️ 참고자료

[Refactoring Guru - Facade](https://refactoring.guru/design-patterns/facade)

[사전 검색 결과 - façade](https://dictionary.cambridge.org/dictionary/french-english/facade)
