## Builder Pattern

➡️ [발표 자료](https://velog.io/@juyoung999/디자인-패턴-Builder) <br>
➡️ [공부 자료](https://refactoring.guru/design-patterns/builder)

<br>

### 코드 설명
- 오픈마켓에서 추상화된 request를 만들 때 많은 프로퍼티를 가져 복잡한 객체를 빌더 패턴으로 만들어보자!

```swift
struct MarketRequest: APIRequest {
    var method: HTTPMethod
    var baseURL: String
    var path: String
    var query: [String: Any]?
    var body: Data?
    var headers: [String: String]?
}
```

