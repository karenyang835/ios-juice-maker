//
//  JuiceMaker - JuiceMaker.swift
//  Created by Karen, myungsun.
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    private func canProduceJuice(_ juice: Juice) -> Bool {
        for (fruit, amount) in juice.recipe {
            if fruitStore.getCurrentStock(of: fruit) < amount {
                return false
            }
        }
        return true
    }
    
    func produceJuice(_ juice: Juice) throws -> Bool {
        if canProduceJuice(juice) {
            for (fruit, amount) in juice.recipe {
                try fruitStore.update(fruit, by: -amount)
            }
            return true
        }
        throw FruitStoreError.insufficientError
    }
}
