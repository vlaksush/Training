//: [Previous](@previous)

/*:
# BollywoodBits: Lights, Camera, Code! 🎬🇮🇳

Welcome to Mumbai, the heart of Bollywood! Karan has arrived in the city of dreams, inspired by the glitz and glamour of Indian cinema. As he explores the film studios and iconic locations, he decides to create a Swift program to analyze and categorize his growing collection of Bollywood films.

## Setting the Stage with Types and Arrays

Karan starts by defining a type for movies and creating an array of Bollywood classics:
*/

import Foundation

// Simple types to represent movies
typealias Movie = (title: String, year: Int, rating: Double)

// Array of Bollywood movies
let bollywoodMovies: [Movie] = [
    ("Dilwale Dulhania Le Jayenge", 1995, 8.1),
    ("3 Idiots", 2009, 8.4),
    ("Lagaan", 2001, 8.1),
    ("PK", 2014, 8.1),
    ("Dangal", 2016, 8.4),
    ("Kabhi Khushi Kabhie Gham", 2001, 7.4),
    ("Zindagi Na Milegi Dobara", 2011, 8.2),
    ("Wake Up Sid", 2015, 7.6),
    ("Yeh Jawaani Hai Deewani", 2013, 7.2),
    ("Dear Zindagi", 2016, 7.4)
]
/*:
## Scene 1: Filtering with Closures

Karan wants to find all movies from the 21st century:
*/

print("Movies from the 21st century:")
bollywoodMovies.filter { $0.year >= 2000 }.forEach { print($0.title) }

/*:
## Scene 2: Mapping the Movie Landscape

Next, Karan creates a list of all movie titles:
*/

let movieTitles = bollywoodMovies.map { $0.title }
print("\nAll movie titles:")
print(movieTitles.joined(separator: ", "))

/*:
## Scene 3: Reducing to Find the Average Rating

Karan calculates the average rating of all movies:
*/

let averageRating = bollywoodMovies.reduce(0.0) { $0 + $1.rating } / Double(bollywoodMovies.count)
print("\nAverage rating of all movies: \(averageRating.rounded())")

/*:
## Scene 4: Custom Filtering with Closures

Karan creates a function to filter movies based on custom criteria:
*/

func filterMovies(from movies: [Movie], using criteria: (Movie) -> Bool) -> [Movie] {
    return movies.filter(criteria)
}

let highlyRatedMovies = filterMovies(from: bollywoodMovies) { $0.rating >= 8.2 }
print("\nHighly rated movies (8.2+):")
highlyRatedMovies.forEach { print("\($0.title) (\($0.year)) - Rating: \($0.rating)") }

/*:
## Scene 5: Optional Binding and Nil Coalescing

Karan implements a function to find and display movie information:
*/

func findMovie(title: String) -> Movie? {
    return bollywoodMovies.first { $0.title.lowercased() == title.lowercased() }
}

func displayMovieInfo(for title: String) {
    if let movie = findMovie(title: title) {
        print("\nMovie found: \(movie.title) (\(movie.year)) - Rating: \(movie.rating)")
    } else {
        print("\nMovie not found. Did you mean: \(bollywoodMovies.randomElement()?.title ?? "No suggestions")?")
    }
}

displayMovieInfo(for: "3 Idiots")
displayMovieInfo(for: "Sholay")

/*:
## Scene 6: Sorting with Closures

Finally, Karan sorts the movies by year to find the oldest and newest:
*/

let sortedByYear = bollywoodMovies.sorted { $0.year < $1.year }
print("\nOldest movie: \(sortedByYear.first?.title ?? "Unknown") (\(sortedByYear.first?.year ?? 0))")
print("Newest movie: \(sortedByYear.last?.title ?? "Unknown") (\(sortedByYear.last?.year ?? 0))")

/*:
## Challenge Time! 🧠💪

Help Karan enhance his Bollywood movie database with these challenges:

1. Implement a closure that filters movies from a specific decade (e.g., 2010s) and use it with the filterMovies function.
2. Write a function that groups the movies by their release decade using a dictionary.
3. Create a function that takes a list of movie titles and returns an array of corresponding Movie tuples, handling cases where a movie might not be found.

*/

// Write your solution here

// Filter movies from a specific decade
let filterByDecade: (Int) -> (Movie) -> Bool = { decade in
    return { movie in
        (movie.year >= decade) && (movie.year < decade + 10)
    }
}

// Test
let moviesFrom2010s = filterMovies(from: bollywoodMovies, using: filterByDecade(2010))
print("\nMovies from 2010s:")
moviesFrom2010s.forEach { print("\($0.title) (\($0.year))") }

// Group movies by release decade
func groupMoviesByDecade(_ movies: [Movie]) -> [Int: [Movie]] {
    return movies.reduce(into: [:]) { (result, movie) in
        let decade = (movie.year / 10) * 10
        result[decade, default: []].append(movie)
    }
}

// Test
let groupedMovies = groupMoviesByDecade(bollywoodMovies)
print("\nMovies grouped by decade:")
for (decade, movies) in groupedMovies.sorted(by: { $0.key < $1.key }) {
    print("\(decade)s: \(movies.map { $0.title }.joined(separator: ", "))")
}

// Get Movie tuples from a list of titles
func getMovies(from titles: [String]) -> [Movie?] {
    return titles.map { title in
        bollywoodMovies.first { $0.title.lowercased() == title.lowercased() }
    }
}

// Test
let moviesToFind = ["3 Idiots", "Sholay", "PK", "Nonexistent Movie"]
let foundMovies = getMovies(from: moviesToFind)
print("\nSearching for movies:")
for (index, movie) in foundMovies.enumerated() {
    if let movie = movie {
        print("\(moviesToFind[index]): Found - \(movie.title) (\(movie.year)) - Rating: \(movie.rating)")
    } else {
        print("\(moviesToFind[index]): Not found")
    }
}


/*:
Great job!

[Previous](@previous) | [Next](@next)
*/
