/*:
# Tech Towers of HITEC City: Object-Oriented Swift 🏢

Welcome to Hyderabad's HITEC City! As Karan explores India's tech hub, he's fascinated by the modern office buildings and tech campuses. Let's learn Swift's object-oriented programming by modeling these architectural marvels.

 ## Core Components Overview

 ### 1. Value Types (Structures)
 The foundation starts with two key structures:
 * `BuildingLocation`: Handles address components (sector, block, pinCode)
 * `BuildingSpecs`: Manages building specifications (area, parking, helipad)
   * Features mutating functions for modifications
   * Includes computed properties for derived values
   * Demonstrates value semantics with deep copying

 ### 2. Reference Types (Classes)
 The building hierarchy demonstrates inheritance and reference semantics:
 * `TechBuilding`: Base class with core building properties
   * Includes initialization/deinitialization
   * Basic description and cost calculations
 * `SmartBuilding`: Extends TechBuilding with automation features
   * Demonstrates method overriding
   * Adds AI and automation level tracking
 * `ModernTechBuilding`: Showcases advanced property features
   * Property observers for occupancy tracking
   * Computed properties for occupancy rates
   * Lazy properties for security systems

 ### 3. Protocols and Protocol Extensions
 Multiple protocols define building standards:
 * `BuildingManagement`: Occupancy management contract
   * Default implementations via protocol extensions
   * Error handling with custom `BuildingError` enum
 * `GreenBuilding`: Environmental features contract
   * Solar capacity tracking
   * Rainwater harvesting status
   * Green score calculations

 ### 4. Memory Management
 Demonstrates ARC best practices:
 * `Facility` and `FacilityManager`: Shows proper use of weak references
 * `BuildingMonitor`: Illustrates closure capture lists
 * Proper deinitialization handling

 This implementation provides a roubust foundation for building management systems while demonstrating Swift's key object-oriented and protocol-oriented programming features.
 
 ### Building Management System Architecture
 
 ![Building Management UML](ClassDiagram.png)
 
 This UML class diagram shows the relationships between different building types and their specifications.
 
## Part 1: Structures (Value Types)

In Swift, we use structures for simple data types that should be copied when passed around.
Perfect for things like locations, measurements, or specifications.
*/

// Structure for building location
struct BuildingLocation {
    let sector: String
    let block: String
    let pinCode: String
    
    func getAddress() -> String {
        return "Block \(block), Sector \(sector), HITEC City, \(pinCode)"
    }
}

// USAGE: BuildingLocation
print("\n=== BuildingLocation Example ===")
let mindspaceLocation = BuildingLocation(sector: "1", block: "A", pinCode: "500081")
print(mindspaceLocation.getAddress())

// Structure for building specifications
struct BuildingSpecs {
    var totalArea: Double
    var numberOfParkingSpots: Int
    var hasHelipad: Bool
    
    // Mutating function example - can modify properties
    mutating func addParkingSpots(count: Int) {
        numberOfParkingSpots += count
        print("Added \(count) parking spots. Total now: \(numberOfParkingSpots)")
    }
    
    // Computed property example
    var parkingAreaNeeded: Double {
        return Double(numberOfParkingSpots) * 12.5 // 12.5 sq meters per spot
    }
}

// USAGE: BuildingSpecs
print("\n=== BuildingSpecs Example ===")
var mindspaceSpecs = BuildingSpecs(totalArea: 5000, numberOfParkingSpots: 100, hasHelipad: true)
print("Initial parking spots: \(mindspaceSpecs.numberOfParkingSpots)")
print("Parking area needed: \(mindspaceSpecs.parkingAreaNeeded)")
mindspaceSpecs.addParkingSpots(count: 50)
print("Parking area needed: \(mindspaceSpecs.parkingAreaNeeded) sq meters")

// Demonstrating Value Type Behavior
print("\n=== Value Type Behavior Demo ===")
var specs2 = mindspaceSpecs  // Creates a complete copy
specs2.addParkingSpots(count: 25)  // Modifies only specs2
print("Original specs parking: \(mindspaceSpecs.numberOfParkingSpots)")  // Unchanged
print("Copy specs parking: \(specs2.numberOfParkingSpots)")              // Changed

/*:
## Part 2: Classes (Reference Types)

Classes are reference types - when you copy them, you get a reference to the same instance.
They're perfect for complex objects that need identity and shared state.
*/

// Base class for all buildings
class TechBuilding {
    var name: String
    var floors: Int
    var location: BuildingLocation
    var specs: BuildingSpecs
    
    // Initializer
    init(name: String, floors: Int, location: BuildingLocation, specs: BuildingSpecs) {
        print("Initializing TechBuilding: \(name)")
        self.name = name
        self.floors = floors
        self.location = location
        self.specs = specs
    }
    
    // Deinitializer
    deinit {
        print("TechBuilding \(name) is being demolished")
    }
    
    func describe() -> String {
        return "\(name) has \(floors) floors at \(location.getAddress())"
    }
    
    func calculateMaintenanceCost() -> Double {
        return Double(floors) * 1000.0
    }
}

// USAGE: TechBuilding
print("\n=== TechBuilding Example ===")
let building = TechBuilding(
    name: "Tech Hub",
    floors: 10,
    location: mindspaceLocation,
    specs: mindspaceSpecs
)
print(building.describe())
print("Basic maintenance cost: ₹\(building.calculateMaintenanceCost())")

// Demonstrating Reference Type Behavior
print("\n=== Reference Type Behavior Demo ===")
let building2 = building  // Creates a reference to the same building
building2.name = "Tech Hub - Renamed"
print("Original building name: \(building.name)")   // Shows renamed value
print("Reference building name: \(building2.name)") // Shows same renamed value

/*:
## Part 3: Inheritance and Override

Inheritance allows us to build upon existing classes, adding new functionality
and customizing behavior.
*/

// First level of inheritance
class SmartBuilding: TechBuilding {
    var hasAI: Bool
    var automationLevel: Int
    
    init(name: String, floors: Int, location: BuildingLocation,
         specs: BuildingSpecs, hasAI: Bool, automationLevel: Int) {
        print("Initializing SmartBuilding features")
        self.hasAI = hasAI
        self.automationLevel = automationLevel
        super.init(name: name, floors: floors, location: location, specs: specs)
    }
    
    override func calculateMaintenanceCost() -> Double {
        let baseCost = super.calculateMaintenanceCost()
        return hasAI ? baseCost * 1.5 : baseCost
    }
    
    override func describe() -> String {
        return "\(super.describe()) with Level \(automationLevel) automation"
    }
}

// USAGE: SmartBuilding
print("\n=== SmartBuilding Example ===")
let smartBuilding = SmartBuilding(
    name: "AI Tower",
    floors: 15,
    location: mindspaceLocation,
    specs: mindspaceSpecs,
    hasAI: true,
    automationLevel: 3
)
print(smartBuilding.describe())
print("Smart building maintenance cost: ₹\(smartBuilding.calculateMaintenanceCost())")

/*:
## Part 4: Properties and Property Observers

Swift provides different types of properties with powerful observation capabilities.
*/

// Building with advanced property features
class ModernTechBuilding: TechBuilding {
    // Property with observers
    var occupancy: Int = 0 {
        willSet {
            print("\nOccupancy will change from \(occupancy) to \(newValue)")
        }
        didSet {
            if occupancy > oldValue {
                print("Building is filling up! Added \(occupancy - oldValue) people")
            }
            checkOccupancyLevel()
        }
    }
    
    // Computed property
    var occupancyRate: Double {
        let maxOccupancy = floors * 50  // 50 people per floor
        return (Double(occupancy) / Double(maxOccupancy)) * 100
    }
    
    // Lazy property - only initialized when first accessed
    lazy var securitySystem: String = {
        print("\nInitializing security system for \(name)...")
        return "Advanced Security System for \(floors) floors"
    }()
    
    private func checkOccupancyLevel() {
        if occupancyRate > 80 {
            print("WARNING!! High occupancy alert: \((occupancyRate * 10).rounded() / 10)%")
        }
    }
}

// USAGE: ModernTechBuilding
print("\n=== ModernTechBuilding Example ===")
let modernBuilding = ModernTechBuilding(
    name: "Innovation Hub",
    floors: 20,
    location: mindspaceLocation,
    specs: mindspaceSpecs
)

// Demonstrate property observers
print("\nTesting property observers:")
modernBuilding.occupancy = 500
modernBuilding.occupancy = 850

// Demonstrate lazy property
print("\nAccessing lazy property first time:")
print(modernBuilding.securitySystem)
print("Accessing lazy property second time:")
print(modernBuilding.securitySystem)  // No initialization message

/*:
## Part 5: Protocols and Extensions

Protocols define contracts that types can adopt, while extensions add functionality
to existing types.
*/

// Protocol definition
protocol BuildingManagement {
    var maxOccupancy: Int { get }
    var currentOccupancy: Int { get set }
    
    func isAtCapacity() -> Bool
    func addOccupants(count: Int) throws
}

// Error handling for building management
enum BuildingError: Error {
    case overCapacity(needed: Int, available: Int)
    case invalidCount
    case maintenanceInProgress
}

// Protocol extension with default implementation
extension BuildingManagement {
    func isAtCapacity() -> Bool {
        return currentOccupancy >= maxOccupancy
    }
    
    func checkAvailability(for count: Int) -> Bool {
        return (currentOccupancy + count) <= maxOccupancy
    }
}

// Protocol for environmentally friendly buildings
protocol GreenBuilding {
    var solarPanelCapacity: Int { get }
    var hasRainwaterHarvesting: Bool { get }
    
    func calculateGreenScore() -> Int
}

// Adopting multiple protocols
class ManagedBuilding: ModernTechBuilding, BuildingManagement, GreenBuilding {
    var maxOccupancy: Int
    var currentOccupancy: Int
    let solarPanelCapacity: Int
    let hasRainwaterHarvesting: Bool
    
    init(name: String, floors: Int, location: BuildingLocation, specs: BuildingSpecs,
         maxOccupancy: Int, solarCapacity: Int, rainwaterHarvesting: Bool) {
        self.maxOccupancy = maxOccupancy
        self.currentOccupancy = 0
        self.solarPanelCapacity = solarCapacity
        self.hasRainwaterHarvesting = rainwaterHarvesting
        super.init(name: name, floors: floors, location: location, specs: specs)
    }
    
    func addOccupants(count: Int) throws {
        guard count > 0 else {
            throw BuildingError.invalidCount
        }
        
        let newTotal = currentOccupancy + count
        guard newTotal <= maxOccupancy else {
            throw BuildingError.overCapacity(
                needed: count,
                available: maxOccupancy - currentOccupancy
            )
        }
        
        currentOccupancy = newTotal
        print("Added \(count) occupants. Current occupancy: \(currentOccupancy)")
    }
    
    func calculateGreenScore() -> Int {
        var score = 0
        score += solarPanelCapacity / 10
        if hasRainwaterHarvesting { score += 20 }
        return score
    }
}

// USAGE: Protocols and Extensions
print("\n=== Protocol and Extension Example ===")
let managedBuilding = ManagedBuilding(
    name: "Green Tech Tower",
    floors: 15,
    location: mindspaceLocation,
    specs: mindspaceSpecs,
    maxOccupancy: 1000,
    solarCapacity: 500,
    rainwaterHarvesting: true
)

do {
    try managedBuilding.addOccupants(count: 500)
    print("Green Score: \(managedBuilding.calculateGreenScore())")
    print("Is at capacity? \(managedBuilding.isAtCapacity())")
    
    // Try to exceed capacity
    try managedBuilding.addOccupants(count: 600)
} catch BuildingError.overCapacity(let needed, let available) {
    print("Cannot add occupants: needed \(needed), only \(available) spots available")
} catch {
    print("Unexpected error: \(error)")
}
/*:
## Part 6: Memory Management and ARC

Swift uses Automatic Reference Counting (ARC) to manage memory. Let's explore
strong, weak, and unowned references:
*/

// Class with potential memory cycle
class Facility {
    let name: String
    var manager: FacilityManager?  // Strong reference
    
    init(name: String) {
        self.name = name
        print("Facility '\(name)' is created")
    }
    
    deinit {
        print("Facility '\(name)' is being deinitialized")
    }
}

class FacilityManager {
    let name: String
    weak var facility: Facility?  // Weak reference to break cycle
    
    init(name: String) {
        self.name = name
        print("Manager \(name) is hired")
    }
    
    deinit {
        print("Manager \(name) has left")
    }
}

// Closure capture example
class BuildingMonitor {
    let buildingName: String
    var onAlert: (() -> Void)?
    
    init(buildingName: String) {
        self.buildingName = buildingName
        
        // Potential retain cycle if not careful!
        onAlert = {
            print("Alert in \(buildingName)!")  // Captures self strongly
        }
        
        // Correct way - using capture list
        onAlert = { [weak self] in
            guard let buildingName = self?.buildingName else { return }
            print("Alert in \(buildingName)!")
        }
    }
    
    deinit {
        print("Monitor for \(buildingName) is being deinitialized")
    }
}

// USAGE: Memory Management
print("\n=== Memory Management Example ===")
do {
    let facility = Facility(name: "Tech Park")
    let manager = FacilityManager(name: "Karan")
    let monitor = BuildingMonitor(buildingName: facility.name)
    do {
        // Create relationships
        facility.manager = manager
        manager.facility = facility
        
        print("Relationships established")
        
        // Create monitor
        monitor.onAlert?()
    } // Everything should be deinitialized here
}


/*:
## Challenge Time! 🧠💪

Help Karan enhance the building management system:

1. Create a `BuildingResource` protocol with properties for `resourceName`, `isAvailable`, and methods for `reserve()` and `release()`.

2. Create a `ConferenceRoom` struct that adopts `BuildingResource` and includes capacity and equipment information.

3. Add property observers to track resource usage and notify when resources are running low.

Write your solutions below:
*/

// Write your solution here

// 1. BuildingResource Protocol
protocol BuildingResource {
    var resourceName: String { get }
    var isAvailable: Bool { get set }
    
    mutating func reserve() -> Bool
    mutating func release()
}

// 2. ConferenceRoom Implementation
struct ConferenceRoom: BuildingResource {
    let resourceName: String
    var isAvailable: Bool = true
    let capacity: Int
    
    // Equipment information
    let hasProjector: Bool
    let hasVideoConference: Bool
    
    // 3. Property observer to track usage
    var currentOccupancy: Int = 0 {
        didSet {
            if currentOccupancy > capacity * 80 / 100 {  // 80% capacity
                print("Warning: Room \(resourceName) is nearly full!")
            }
        }
    }
    
    mutating func reserve() -> Bool {
        guard isAvailable else { return false }
        isAvailable = false
        print("Room \(resourceName) is now reserved")
        return true
    }
    
    mutating func release() {
        isAvailable = true
        currentOccupancy = 0
        print("Room \(resourceName) is now available")
    }
}

// Testing
let room = ConferenceRoom(
    resourceName: "Meeting Room 1",
    capacity: 10,
    hasProjector: true,
    hasVideoConference: true
)

// Test usage
var meetingRoom = room
meetingRoom.reserve()
meetingRoom.currentOccupancy = 8  // Should trigger warning
meetingRoom.release()

/*:
Key Takeaways:
- Use structs for simple value types (BuildingLocation, BuildingSpecs)
- Use classes for complex objects with identity (TechBuilding hierarchy)
- Use protocols to define shared behavior (BuildingManagement, GreenBuilding)
- Use extensions to add functionality
- Use proper memory management to avoid retain cycles
- Consider value vs reference semantics when designing types

[Previous](@previous) | [Next](@next)
*/
