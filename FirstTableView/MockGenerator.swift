//
//  MockGenerator.swift
//  FirstTableView
//
//  Created by Михаил Фролов on 17.01.2022.
//

import Foundation

struct MockGenerator {
    static func generateRandomCities() -> [City] {
        var citiesArray = [City]()
        let paris = City(country: "France", name: "Paris", image: #imageLiteral(resourceName: "paris"))
        citiesArray.append(paris)
        let nice = City(country: "France", name: "Nice", image: #imageLiteral(resourceName: "nice"))
        citiesArray.append(nice)
        let marseille = City(country: "France", name: "Marseille", image: #imageLiteral(resourceName: "marseille"))
        citiesArray.append(marseille)
        let barcelona = City(country: "Spain", name: "Barcelona", image: #imageLiteral(resourceName: "barcelona"))
        citiesArray.append(barcelona)
        let madrid = City(country: "Spain", name: "Madrid", image: #imageLiteral(resourceName: "madrid"))
        citiesArray.append(madrid)
        let dusseldorf = City(country: "Germany", name: "Dusseldorf", image: #imageLiteral(resourceName: "dusseldorf"))
        citiesArray.append(dusseldorf)
        let frankfurt = City(country: "Germany", name: "Frankfurt", image: #imageLiteral(resourceName: "frankfurt"))
        citiesArray.append(frankfurt)
        let koln = City(country: "Germany", name: "Koln", image: #imageLiteral(resourceName: "koln"))
        citiesArray.append(koln)
        let munich = City(country: "Germany", name: "Munich", image: #imageLiteral(resourceName: "munich"))
        citiesArray.append(munich)
        let berlin = City(country: "Germany", name: "Berlin", image: #imageLiteral(resourceName: "berlin"))
        citiesArray.append(berlin)
        let dresden = City(country: "Germany", name: "Dresden", image: #imageLiteral(resourceName: "dresden"))
        citiesArray.append(dresden)
        let venice = City(country: "Italy", name: "Venice", image: #imageLiteral(resourceName: "venice"))
        citiesArray.append(venice)
        let milano = City(country: "Italy", name: "Milano", image: #imageLiteral(resourceName: "milano"))
        citiesArray.append(milano)
        let roma = City(country: "Italy", name: "Roma", image: #imageLiteral(resourceName: "roma"))
        citiesArray.append(roma)
        
        return citiesArray
    }
    
    static func generateRandomCitiesByCountries() -> [[City]] {
        let cities = generateRandomCities()
        var countries: [String: [City]] = [:]
        for item in cities {
            var citiesByCountry = countries[item.country] ?? []
            citiesByCountry.append(item)
            countries[item.country] = citiesByCountry
   
//   то же самое, более понятной записью
//            if var citiesByCountry = countries[item.country] {
//                citiesByCountry.append(item)
//                countries[item.country] = citiesByCountry
//            } else {
//                countries[item.country] = [item]
//            }
        }
        return Array(countries.values) //Array - преоброзование типа, [[City]] - двумерный масив
    }
}
