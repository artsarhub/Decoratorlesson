import UIKit

protocol Coffee {
    var cost: Int { get }
}

class SimpleCoffee: Coffee {
    let cost: Int
    
    init(cost: Int) {
        self.cost = cost
    }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(base: Coffee)
}

class Milk: CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        base.cost + 20
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Whip: CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        base.cost + 30
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

class Sugar: CoffeeDecorator {
    var base: Coffee
    
    var cost: Int {
        base.cost + 10
    }
    
    required init(base: Coffee) {
        self.base = base
    }
}

let coffee = SimpleCoffee(cost: 50)
let whipCoffee = Whip(base: coffee)
let sugarWhipCoffee = Sugar(base: whipCoffee)

print(sugarWhipCoffee.cost)
