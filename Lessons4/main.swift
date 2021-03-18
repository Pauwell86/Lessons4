//
//  main.swift
//  Lessons4
//
//  Created by Pauwell on 18.03.2021.
//
enum Action {
    case startEngine
    case stopEngine
    case openWindow
    case closeWindow
    case fillTrunk(cargoVolume: Double)
    case emptyTrunk(cargoVolume: Double)
}

enum Trailer: String{
    case haveTrailer = "Есть прицеп"
    case haveNotTrailer = "Нет прицепа"
}

class Car {
    let carBrand: String
    let yearOfRelease: Int
    let trunkVolume: Double
    var engineRunning: Bool
    var windowsIsOpen: Bool
    var filledTrunkVolume: Double
    
    static var carCount = 0
    
    init(carBrand: String,
         yearOfRelease: Int,
         trunkVolume: Double,
         engineRunning: Bool,
         windowsIsOpen: Bool,
         filledTrunkVolume: Double) {
        self.carBrand = carBrand
        self.yearOfRelease = yearOfRelease
        self.trunkVolume = trunkVolume
        self.engineRunning = engineRunning
        self.windowsIsOpen = windowsIsOpen
        self.filledTrunkVolume = filledTrunkVolume
        Car.carCount += 1
    }
          
    static func countInfo(){
        print("Выпущено \(self.carCount) автомобилей")
    }
    
    
    func printInfo() {
        print("Марка авто: \(self.carBrand)")
        print("Год выпуска: \(self.yearOfRelease)")
        print("Объем багажника: \(self.trunkVolume)")
        print("Состояние двигателя: \(self.engineRunning ? "Запущен" : "Заглушен")")
        print("Положение окон: \(self.windowsIsOpen ? "Открыты" : "Закрыты")")
        print("Загрузка багажника: \(self.filledTrunkVolume)")
    }
}

let car1 = Car(carBrand: "Mazda", yearOfRelease: 2012, trunkVolume: 200, engineRunning: true, windowsIsOpen: true, filledTrunkVolume: 50)

car1.printInfo()
Car.countInfo()


class SportCar: Car{
    var hatchOpen: Bool
    
    static var countSportCar = 0
    
    init(carBrand: String, yearOfRelease: Int, trunkVolume: Double, engineRunning: Bool, windowsIsOpen: Bool, filledTrunkVolume: Double, hatchOpen: Bool) {
        self.hatchOpen = hatchOpen
        SportCar.countSportCar += 1
        super.init(carBrand: carBrand, yearOfRelease: yearOfRelease, trunkVolume: trunkVolume, engineRunning: engineRunning, windowsIsOpen: windowsIsOpen, filledTrunkVolume: filledTrunkVolume)
        
    }
    
    static func printCountSportCar(){
        print("Спортивных машин произведено \(self.countSportCar)")
    }
    
    func printHatchState(){
        if hatchOpen == true {
            print("Люк открыт")
        } else {
            print("Люк закрыт")
        }
    }
    
    override func printInfo() {
        super.printInfo()
        print("Люк \(self.hatchOpen ? "открыт" : "закрыт")")
    }
    
}


let car2 = SportCar(carBrand: "Nissan", yearOfRelease: 2020, trunkVolume: 200, engineRunning: true, windowsIsOpen: false, filledTrunkVolume: 100, hatchOpen: true)
let car3 = SportCar(carBrand: "Ford", yearOfRelease: 2005, trunkVolume: 150, engineRunning: false, windowsIsOpen: true, filledTrunkVolume: 100, hatchOpen: true)

car2.printInfo()

class TruckCar: Car {
    var isTruck: Bool
    var trailer: Trailer
    init(carBrand: String, yearOfRelease: Int, trunkVolume: Double, engineRunning: Bool, windowsIsOpen: Bool, filledTrunkVolume: Double, isTruck: Bool, trailer: Trailer) {
        self.isTruck = isTruck
        self.trailer = trailer
        super.init(carBrand: carBrand, yearOfRelease: yearOfRelease, trunkVolume: trunkVolume, engineRunning: engineRunning, windowsIsOpen: windowsIsOpen, filledTrunkVolume: filledTrunkVolume)
    }
    
    func attachTrailer() {
        self.trailer = .haveTrailer
    }
    
    func unattachTrailer() {
        self.trailer = .haveNotTrailer
    }
    
    override func printInfo() {
        super.printInfo()
        print("Это грузовик: \(self.isTruck ? "Да" : "Нет")")
        print("\(trailer.rawValue)")
    }
}

let car4 = TruckCar(carBrand: "MAN", yearOfRelease: 2018, trunkVolume: 3000, engineRunning: false, windowsIsOpen: true, filledTrunkVolume: 1000, isTruck: true, trailer: .haveTrailer)

car4.printInfo()
car4.unattachTrailer()
car4.printInfo()

Car.countInfo()
SportCar.printCountSportCar()
