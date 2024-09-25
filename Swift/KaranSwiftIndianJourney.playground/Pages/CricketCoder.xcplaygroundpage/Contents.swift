//: [Previous](@previous)

/*:
# CricketLeague: Simplified Indian Cricket Simulator 🏏🇮🇳

Welcome to Delhi! Karan creates a streamlined cricket simulator using key Swift concepts.

## Player and Team Setup
*/

import Foundation

enum PlayerRole: String, CaseIterable {
    case batsman, bowler, allRounder
}

struct Player {
    let name: String
    let role: PlayerRole
    let skillLevel: Int
}

let players = [
    Player(name: "Virat Kohli", role: .batsman, skillLevel: 95),
    Player(name: "Jasprit Bumrah", role: .bowler, skillLevel: 90),
    Player(name: "Ravindra Jadeja", role: .allRounder, skillLevel: 88),
    Player(name: "Rohit Sharma", role: .batsman, skillLevel: 92)
]

/*:
## Player Description with Closures
*/

let describePlayer: (Player) -> String = { player in
    "\(player.name) is a \(player.role) with skill level \(player.skillLevel)"
}

/*:
## Team Analysis with Higher-Order Functions
*/

func getPlayers(with role: PlayerRole, from squad: [Player]) -> [Player] {
    squad.filter { $0.role == role }
}

let batsmen = getPlayers(with: .batsman, from: players)
print("Batsmen: \(batsmen.map { $0.name }.joined(separator: ", "))")

/*:
## Performance Calculation with Reduce
*/

let teamStrength = players.reduce(0) { $0 + $1.skillLevel } / players.count
print("Team Strength: \(teamStrength)")

/*:
## Match Simulation with Enums and Optionals
*/

enum MatchResult {
    case win, lose, draw
}

func simulateMatch(teamStrength: Int, team: [Player]) -> MatchResult {
    let opponentStrength = Int.random(in: 70...100)
    let result: MatchResult
    
    switch teamStrength - opponentStrength {
    case ..<0:
        result = .lose
        print("Match Result: Lost")
    case 0:
        result = .draw
        print("Match Result: Draw")
    default:
        result = .win
        print("Match Result: Won")
        print("\nWinning Team Players:")
        team.forEach { player in
            print(describePlayer(player))
        }
    }
    
    return result
}

let matchOutcome = simulateMatch(teamStrength: teamStrength, team: players)
print("Match Result: \(matchOutcome)")


/*:
## Challenge: Enhance the Simulator

1. Implement a simple commentary generator using `switch` and string interpolation.
2. Create a function that calculates the average skill level of a team.
3. Write a function that returns all players above a certain skill threshold.

*/

// Your code here

//: [Next](@next)
