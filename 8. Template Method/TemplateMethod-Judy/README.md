# Template Method
**Behavioral Design Pattern**
> 상위 클래스에서 골격(알고리즘)을 결정하지만 하위 클래스들이 특정 단계를 오버라이드(재정의)할 수 있도록 하는 디자인 패턴

<br>

## 문제
문서를 분석하는 데이터 마이닝 앱을 만들 때, 사용자들은 앱에 다양한 형식의 문서를 제공하고 그 중 의미있는 데이터를 추출하려고 합니다.

첫 번째 버전은 `DOC` 파일을, 두 번째 버전은 `CSV`을 지원했고 마지막으로 `PDF`를 지원하도록 추가했습니다.

다양한 데이터 형식을 처리하는 코드는 다르지만 추출한 데이터를 처리 및 분석을 위한 코드는 거의 유사했습니다. 알고리즘 구조는 그대로 두되 코드의 중복을 제거하고 싶으면 어떻게 해야 할까요?
<br>

## 해결책
**Template Method**

### 템플릿 메서드 구현
1. 알고리즘을 일련의 단계로 나누기
2. 나눈 단계들을 메서드로 변환
3. 템플릿 메서드에서 단계들을 호출

➡️ 단계들은 추상(abstract)이거나 기본값(기본 구현)을 가집니다. 

### 알고리즘을 사용
1. 자식 클래스는 모든 추상 단계를 구현
2. 필요하다면 단계 중 일부를 재정의(템플릿 메서드는 제외)
3. 템플릿 메서드 사용
<br>

## 현실 예제

![](https://velog.velcdn.com/images/juyoung999/post/7919b774-8961-48b8-ab36-42ac9c4d4687/image.png)


대량 주택을 건설하고 싶을 때 표준 주택을 위한 건축 계획에는 일부 세부 사항을 조정할 수 있도록 하는 여러 확장 지점이 포함될 수 있습니다.

완성된 집이 다른 집들과 조금씩 다르도록 각 건축 단계는 약간씩 변경될 수 있습니다.
<br>

## 구조

![](https://velog.velcdn.com/images/juyoung999/post/c58c9da6-5d83-4875-8625-b33bb02d0fe5/image.png)

### 1. 추상 클래스 (Abstract Class)
- 알고리즘 단계의 역할을 하는 메서드 선언
- 메서드들을 특정 순서로 호출하는 템플릿 메서드 선언
- 각 단계들은 abstract로 선언되거나 기본 구현을 가짐

### 2. 구상 클래스 (Concrete Class)
- 모든 단계를 오버라이드(재정의)할 수 있음
- 템플릿 메서드는 재정의 불가
<br>

## 적용
- 클라이언트들이 알고리즘의 특정 단계만 확장할 수 있도록 하되, 전체 알고리즘 구조는 확장하지 못하도록 하려고 할 때
- 약간만 다르고 거의 비슷한 알고리즘을 포함하는 여러 클래스가 있는 경우
<br>

## 장단점
### ✅ 장점
- 대규모 알고리즘의 특정 부분만 오버라이드해 변경하여 원래 알고리즘에 영향을 줄일 수 있다
- 중복 코드를 부모 클래스에서 가져올 수 있다

### ❎ 단점
- 일부 클라이언트는 제공된 알고리즘의 구조에 의해 제한될 수 있다
- 하위 클래스를 통해 기본 구현을 억제하여 리스코프 치환 원칙을 위반할 수 있다
- 템플릿 메서드는 많은 단계를 유지하기 어려운 경향이 있다

---

**참고 링크**
[Template Method](https://refactoring.guru/design-patterns/template-method)