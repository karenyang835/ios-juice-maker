# 🍓🍌🥝 Juice Maker 🍍🥭

> 사용자가 버튼을 통해 쥬스를 주문하면 쥬스에 필요한 과일을 소모하여 쥬스를 제조합니다. 과일의 재고가 부족할 경우 재료 수정 페이지를 통해 부족한 과일 재고를 충전할 수 있습니다.

</br>

## 목차

1. [팀원](#1.)
2. [타임라인](#2.)
3. [트러블 슈팅](#3.)
4. [참고 링크](#3.)



---

</br>

<a id="1."></a>
## 1. 팀원
| [myungsun ♌️](https://github.com/myungsun7782)  | [Karen ♉️](https://github.com/karenyang835) |
| :--------: | :--------: |
| <img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/c41add1e-9da1-473d-b5c5-b1cf3f175654" height="150"/>| <Img src="https://i.imgur.com/auFOXpc.png" width="150"/>| 

---
</br>


<a id="2."></a>
## 2. 타임라인
<!-- <details><summary span style="color:black; background-color:#ffff2421; font-size:120%"><b>1주차</b></summary></span>  -->

### 2023.05.08.(월)
- 코드 구조 및 협의


### 2023.05.09.(화)
<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/7166e189-f9f5-4d02-8151-c5c7839cabdf" height="21"/> 과일의 재고를 관리하는 FruitStore 타입과 과일 쥬스를 제조하는 JuiceMaker타입을 정의 후 initializer 설정

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/7166e189-f9f5-4d02-8151-c5c7839cabdf" height="21"/> 과일의 재고 수량을 갱신 해주는 기능 추가

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/7166e189-f9f5-4d02-8151-c5c7839cabdf" height="21"/> 현재 남아있는 과일의 수량을 알려주는 기능 추가

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/7166e189-f9f5-4d02-8151-c5c7839cabdf" height="21"/> 해당 쥬스를 만들 수 있는 지 체크하는 기능 추가

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/7166e189-f9f5-4d02-8151-c5c7839cabdf" height="21"/> 쥬스를 만드는 기능 추가


### 2023.05.10.(수)
<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/6fe0cd08-cf12-4d68-bc9b-ea7bb4284f73" height="21"/> 불필요한 주석 제거 및 creator수정

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/077161b3-b526-48bb-80a3-79b0c0b77f01" height="21"/> 전체적으로 어색한 네이밍 수정

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/077161b3-b526-48bb-80a3-79b0c0b77f01" height="21"/> FruitStore 생성자 수정

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/077161b3-b526-48bb-80a3-79b0c0b77f01" height="21"/> canMake에 옵셔널 바인딩 추가

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/077161b3-b526-48bb-80a3-79b0c0b77f01" height="21"/> enum 파일들을 Model 디렉토리로 위치 변경


### 2023.05.12.(금)
<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/077161b3-b526-48bb-80a3-79b0c0b77f01" height="21"/> 반환되어지는 오류 타입 변경(throws-> Result로 변경)

<img src="https://github.com/myungsun7782/ios-juice-maker/assets/124643896/077161b3-b526-48bb-80a3-79b0c0b77f01" height="21"/> FruitStore 클래스 Preventing Overrides 처리 및 기능 분리 

</details>


---

</br>

<a id="3."></a>
## 3. 트러블 슈팅 💣
### 1️⃣ 기능 분리
#### 문제점
- FruitStore 클래스 내 changeStock 메서드는 재고를 변경하는 기능인데, 재고를 확인하는 기능까지 수행하고 있었습니다.
#### 해결 방법
- 재고를 수행하는 기능인 checkStock 메서드를 FruitStore 클래스에 새로 생성해서 기능을 분리했습니다.
<details>
<summary>세부 사항</summary>   


#### 수정 전
```swift
func changeStock(of fruit: Fruit, by quantity: Int) {
    guard let currentStock = fruitInventory[fruit],
           currentStock + quantity >= 0 else { return }
    fruitInventory[fruit] = currentStock + quantity
}
```

#### 수정 후
```swift
func changeStock(of fruit: Fruit, by quantity: Int) {
    guard let currentStock = fruitInventory[fruit] else { return }
    fruitInventory[fruit] = currentStock + quantity
}

func checkStock(of fruit: Fruit, for amount: Int) -> Bool {
    guard let currentStock = fruitInventory[fruit],
              currentStock >= amount else { return false }
    return true
}
```
</details>

### 2️⃣ 코드 컨벤션 
#### 문제점 
- 페어 프로그래밍을 진행할 때 코드 컨벤션에 관한 문제점이 있었습니다. 특히, 명확하지 않은 네이밍과 타입 선언 통일성이 맞지 않음으로서 코드의 가독성에 문제가 생겼습니다.
#### 해결 방법
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)를 참고하여 문제를 해결했습니다.

<details>
<summary>세부 사항</summary>

- Dictionary 선언 컨벤션 불일치
```swift
// 수정 전
private var fruitInventory: [Fruit: Int] = Dictionary<Fruit, Int>()

// 수정 후 
private var fruitInventory: [Fruit: Int] = [:]
    
```
- 에러 메시지 네이밍
```swift
// 수정 전 
enum FruitStoreError: Error {
    case insufficientError
}

// 수정 후 
enum FruitStoreError: Error {
    case outOfStock
}
    
```
- 메서드 네이밍
```swift
// 1-1 update 메서드 
// 수정 전 
func update(_ fruit: Fruit, by quantity: Int) {}

// 수정 후 
func changeStock(of fruit: Fruit, by quantity: Int) {}

// 1-2 canProduceJuice 메서드
// 수정 전 => 메서드를 봤을 때 can produce juice juice로 읽히게 됩니다.
func canProduceJuice(_ juice: Juice) -> Bool {}

// 수정 후 
func canMake(_ juice: Juice) -> Bool {} 

// 1-3 produceJuice 메서드
// 수정 전
func produceJuice(_ juice: Juice) -> Juice? {}

// 수정 후 
func make(_ juice: Juice) -> Juice? {}
    
```
</details>
    

### 3️⃣ 에러 타입 변경 
#### 문제점 
- `JuiceMaker` 구조체 내 `make` 메서드에서 `canMake(juice)`가 true일 경우에는 `try fruitStore.changeStock(of: fruit, by: -amount)` 메서드는 절대 에러를 던지지 않는 문제가 발생했습니다. 
#### 해결 방법
- `Result` 타입을 사용해서 `case .success`와 `case .failure`에 따라 에러를 처리하는 코드로 수정하여 문제를 해결했습니다.
<details>
<summary>세부 사항</summary>

#### 수정 전
```swift
func make(_ juice: Juice) throws -> Juice? {
    if canMake(juice) {
        for (fruit, amount) in juice.recipe {
            try fruitStore.changeStock(of: fruit, by: -amount)
        }
        return juice
    }
    return nil
}
```

#### 수정 후
```swift
func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
    let result = canMake(juice)
    
    switch result {
    case .success(_):
        for (fruit, amount) in juice.recipe {
            fruitStore.changeStock(of: fruit, by: -amount)
        }
        return .success(juice)
    case .failure(let error):
        return .failure(error)
    }
}
```
</details>

---
</br>
    
<a id="4."></a> 
## 4. 참고 링크
- [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
- [The Swift Language Guide - Preventing Overrides](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/inheritance/#Preventing-Overrides)
- [The Swift Language Guide - Result Type](https://developer.apple.com/documentation/swift/result)
- [The Swift Language Guide - Properties](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/properties/)
- [The Swift Language Guide - Structures and Classes](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/classesandstructures/)
- [The Swift Language Guide - Initialization](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/initialization/)
--- 
    
</br>


