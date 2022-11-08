**Singleton Pattern**

## **1. Singleton Pattern이란?**

싱글톤 패턴이란,

**특정 용도로 객체를 하나만 생성하여,**

**공용으로 사용하고 싶을 때 사용하는 디자인 유형**

다음과 같은 **User의 정보를 저장하는 클래스**를 만들고

```swift
class UserInfo {
    var id: String?
    var password: String?
    var name: String?
}
```

그리고 **A ViewController**에선 **id**를, **B** **ViewController**에선 **password**를,

**C** **ViewController**에선 **name**을 입력 받아

이를 **UserInfo라는 클래스**에 저장해야 한다고 생각하면

```swift
//A ViewController
let userInfo = UserInfo()
userInfo.id = "Sodeul"
//B ViewController
let userInfo = UserInfo()
userInfo.password = "123"
//C ViewController
let userInfo = UserInfo()
userInfo.name = "Sodeul"
```

만약, 이런 식으로 A, B, C ViewController에서 **각각 UserInfo 객체를 만들어서 저장**하면,
![](https://i.imgur.com/yaGJfJT.png)


이런 식으로 **각 Instance의 프로퍼티에만 저장**될 것이고 😱

**한 Instance에 모든 정보가 저장**되어야 하는데..원하는것이 아니다

그럼 방법이 하나 더 있긴 하다

**인스턴스는 참조 타입**이기 때문에, **User Info 인스턴스를 한번 생성한 후**,

이 인스턴스를 A->B->C로 **필요할 때마다** **참조로 넘겨줄 수도 있긴 함**

근데 이렇게 해도 되지만,

App 어디 클래스든 User Info 인스턴스가 참조되어야 할 때마다

매번 이 인스턴스를 넘겨주기도 귀찮고.. 코드도 지저분해진다

따라서

**이 클래스에 대한 Instance는 최초 생성될 때 딱 한번만 생성해서 전역에 두고,**

**그 이후로는 이 Instance만 접근 가능하게 하자**

는게 바로 **Singleton Pattern이다**

따라서 싱글톤을 사용하면 다음과 같은 그림이 된다
![](https://i.imgur.com/Kc8Eyn5.png)


이런 식으로 **한 Instance에 어디 클래스에서든 접근 가능하게 합니다**

****2. Singleton Class 만드는 방법****

****2-1. static 프로퍼티로 Instance 생성하기****

```swift
class UserInfo {
    static let shared = UserInfo()
    var id: String?
    var password: String?
    var name: String?
}
```

****2-2. init 함수 접근제어자를 private로 지정하기****

```swift
class UserInfo {
    static let shared = UserInfo()
    var id: String?
    var password: String?
    var name: String?
    private init() { }
}
```

혹시라도 Init 함수를 호출해 **Instance를 또 생생하는 것을 막기 위해**,

**init() 함수 접근 제어자를 private로 지정**해주면 된다

자 그럼 Swift로 Singleton 만들기는 끝난다

그럼 외부에서 어떻게 접근하는것인가

****3. Singleton Class 접근하는 방법****

```swift
//A ViewController
let userInfo = UserInfo.shared
userInfo.id = "Sodeul"
 
//B ViewController
let userInfo = UserInfo.shared
userInfo.password = "123"
 
//C ViewController
let userInfo = UserInfo.shared
userInfo.name = "Sodeul"
```

어느 클래스에서든 **shared란 static 프로퍼티로 접근**하면,하나의 Instance를 공유하는 것

****4. Singleton의 장단점****

장점 

- 한 번의 Instance만 생성하므로 메모리 낭비를 방지할 수 있음
- Singleton Instance는 전역 Instance로 다른 클래스들과 자원 공유가 쉬움
- DBCP(DataBase Connection Pool)처럼 공통된 객체를 여러개 생성해서 사용해야하는 상황에서 많이 사용 (쓰레드풀, 캐시, 대화상자, 사용자 설정, 레지스트리 설정, 로그 기록 객체등)

단점

- Singleton Instance가 너무 많은 일을 하거나, 많은 데이터를 공유시킬 경우 다른 클래스의 Instance들 간 결합도가 높아져 "개방=폐쇄" 원칙을 위배함 (객체 지향 설계 원칙 어긋남)
- 따라서 수정과 테스트가 어려워짐

5. iOS에서 Singleton을 사용하는 예시
```swift
let screen = UIScreen.main
let userDefault = UserDefaults.standard
let application = UIApplication.shared
let fileManager = FileManager.default
let notification = NotificationCenter.default
```

## 작성한 코드
```swift
import Foundation
class YagomAcademyMember {
    static let shared = YagomAcademyMember()
    
    var nickName: String?
    var cardinalNumber: String?
    var role: String?
    
    private init() {}
}
//Controller A
let yagomMemberA = YagomAcademyMember.shared
yagomMemberA.nickName = "BaekGom"
// nickName = "BaekGom"
// cardinalNumber = nil
// role = nil
print("Controller A")
print(yagomMemberA.nickName)
print(yagomMemberA.cardinalNumber)
print(yagomMemberA.role)
let yagomMemberB = YagomAcademyMember.shared
yagomMemberB.cardinalNumber = "6기"
// nickName = "BaekGom"
// cardinalNumber = "6기"
// role = nil
print("Controller B")
print(yagomMemberA.nickName)
print(yagomMemberA.cardinalNumber)
print(yagomMemberA.role)
let yagomMemberC = YagomAcademyMember.shared
yagomMemberC.role = "Camper"
// nickName = "BaekGom"
// cardinalNumber = "6기"
// role = "Camper"
print("Controller C")
print(yagomMemberC.nickName)
print(yagomMemberC.cardinalNumber)
print(yagomMemberC.role)
let yagomMemberD = YagomAcademyMember.shared
print("Controller D")
print(yagomMemberD.nickName)
print(yagomMemberD.cardinalNumber)
print(yagomMemberD.role)
```
