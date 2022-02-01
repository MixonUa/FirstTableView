//
//  CitiesViewController.swift
//  FirstTableView
//
//  Created by Михаил Фролов on 16.01.2022.
//

import UIKit

class CitiesViewController: UIViewController {
    @IBOutlet weak var cityTableView: UITableView!
    
    private var citiesImages: [City] = []
    private var citiesByCountry = [[City]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cities"
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        citiesByCountry = MockGenerator.generateRandomCitiesByCountries()
        cityTableView.reloadData() // после изменения масива нужно обновить таблицу
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetails" else { return }
        guard let destinationVC = segue.destination as? DetailsViewController else { return }
        guard let cityCell = sender as? UITableViewCell else { return }
        guard let indexPath = cityTableView.indexPath(for: cityCell) else { return }
        let city = citiesByCountry[indexPath.section][indexPath.row]
        destinationVC.city = city
        
    }
}
    //MARK: - UITableViewDelegate & UITableViewDataSource
extension CitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return citiesByCountry.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cities = citiesByCountry[section]
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CitiesTableViewCell", for: indexPath) as! CitiesTableViewCell // as? + guard let
        let currentCity = citiesByCountry[indexPath.section][indexPath.row]
        cell.updateCell(name: currentCity.name, image: currentCity.image) //image (Literal) -> нажать на квадрат и выбрать
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let currentCity = citiesByCountry[section].first
        return currentCity?.country
    } // viewForHeaderInSection - создает вью, titleForHeaderInSection созадет только тайтл
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
        
}
    

