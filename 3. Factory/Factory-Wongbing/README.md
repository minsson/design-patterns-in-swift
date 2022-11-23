###### tags: `디자인패턴`
[REFACTORING GURU - Factory Method](https://refactoring.guru/design-patterns/factory-method)
[참고 블로그](https://icksw.tistory.com/237)
# Factory Method

### Intent

> **Factory Method** is a creational design pattern that provides an interface for creating objects in a superclass, but allows subclasses to alter the type of object that will be created

Factory Method 는 superclass에서 객체를 생성하는 인터페이스를 제공하지만, subclass가 생성되는 객체의 타입을 결정할 수 있는 창조적 디자인 패턴이다.

즉, **객체 생성을 subclass가 하도록 처리하는 패턴** 이다

객체 생성을 캡슐화할 수 있으며, 이로 인해 부모 클래스는 자식 클래스가 어떤 객체를 생성하는지 몰라도 된다
![](https://i.imgur.com/EPKBTsM.png)

### Problem (문제점)
당신이 물류관리 어플을 만든다고 생각해보자 . 첫번째 버전의 앱은 트럭 물류만 처리할 수 있다. 그래서 대부분의 코드가 `Truck` 클래스 안에 있다.

후에 앱이 유명해져서 해상물류와 합치게 될 것이다
(만약 나머지 코드가 이미 존재하는 클래스에 연결되어 있다면, 프로그램에 새로운 클래스를 추가하는 것은 쉽지 않을 것이다.)

좋은 소식이지만, 대부분의 코드가 `Truck` 클래스에 결합되어있기 때문에 전체 코드배이스를 바꿔야 할 것이다. (매우 귀찮겠다)

>As a result, you will end up with pretty nasty code, riddled with conditionals that switch the app’s behavior depending on the class of transportation objects.

결과적으로 이송수단 객체에 의존하여 앱의 동작을 바꾸는 조건으로 가득 찬 꽤 지저분한 코드를 맞이할 것이다.

### Solution

Factory Method 패턴은 생성 호출을 특별한 factory method를 호출하는 것으로 대체하는 것을 제안한다. 
![](https://i.imgur.com/An04c1P.png)

처음엔 별 영향이 없어 보인다. 그저 생성코드 호출을 옮긴 것 뿐이라고 보인다. 그러나 이 점을 봐라. 당신은 이제 subclass에서 factory method를 재정의할 수 있고, 메서드에 의해 생성되는 products의 클래스를 바꿀 수 있다. 

하지만 약간의 제한이 있다 : ==subclasses는 오직 이 products가 공통의 베이스 class나 인터페이스를 가질때만, 다른 타입의 product를 반환할 것이다== -> Structure 부분의 1,2 번에 나온 모습을 나타낸 것?

![](https://i.imgur.com/ngth8Iy.png)

예를들어 `Truck` 과 `Ship` 클래스들은 둘 다 Transport 인터페이스를 구현해야 한다. 각 클래스는 이 deliever() 메서드를 다르게 구현한다. 트럭은 land로 배는 sea로 화물을 배달한다. `RoadLogistics` 클래스 안의 factory method는 트럭객체를 반환하고, `SeaLogistics` 클래스 안의 factory method 는 배를 반환다.

> The code that uses the factory method (often called the client code) doesn’t see a difference between the actual products returned by various subclasses. The client treats all the products as abstract Transport. The client knows that all transport objects are supposed to have the deliver method, but exactly how it works isn’t important to the client.

### Structure

![](https://i.imgur.com/sfQTFuC.png)

1. Product는 creator 또는 그것의 subclasses에 의해 생산될 수 있는 모든 객체에 공통인 인터페이스를 선언한다

2. Concrete Products 는 product 인터페이스의 다른 구현들이다.
3. Creator 클래스는 새로운 생산품 객체를 반환하는 factory method를 선언한다. 모든 subclasses가 그들의 메서드를 구현하도록 factory method를 `abstract`로써 선언할 수 있다. 

creator 는 우선책임을 하지 않는다. 

### 장-단점

:::success
#### 장점

- Creator와 Concrete product 사이 강한결합을 피할 수 있다.
- SRP : product 생성코드를 옮겼다 !
- OCP : 이미 존재하는 client 코드를 망가뜨리지 않고 새로운 타입을 도입할 수 있다.

:::

:::danger
#### 단점
- 패턴을 형성하기 위해 새로운 서브클래스를 많이 도입하기 때문에 이전보다 더욱 복잡해질 수 있다. creator 클래스에 존재하는 계층에 패턴을 도입할 때가 가장 좋은 경우이다.

:::


