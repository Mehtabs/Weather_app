//
//  ViewController1.swift
//  Weather_app
//
//  Created by Mehtab Singh Sidhu on 4/30/19.
//  Copyright © 2019 Mehtab Singh Sidhu. All rights reserved.
//

// used this link as reference
// https://guides.codepath.com/ios/Search-Bar-Guide


import UIKit
import CoreLocation

class view_controller_Search: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    //@IBOutlet weak var tableView: UITableView!
    
    
   // @IBOutlet var tableView: UITableView!
    @IBOutlet var tableView: UITableView!
    
   // @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    let data = ["New York, NY", "Los Angeles, CA", "Chicago, IL", "Houston, TX",
                "Philadelphia, PA", "Phoenix, AZ", "San Diego, CA", "San Antonio, TX",
                "Dallas, TX", "Detroit, MI", "San Jose, CA", "Indianapolis, IN",
                "Jacksonville, FL", "San Francisco, CA", "Columbus, OH", "Austin, TX",
                "Memphis, TN", "Baltimore, MD", "Charlotte, ND", "Fort Worth, TX"]
    //var lati: String = ""
    //var long: String = ""
    
    var index_path = -1
    var filteredData: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        searchBar.delegate = self
        filteredData = data
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? data : data.filter { (item: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        }
        
        tableView.reloadData()
    }
    
//    func getLocation(from address: String, completion: @escaping (_ location: CLLocationCoordinate2D?)-> Void) {
//        let geocoder = CLGeocoder()
//        geocoder.geocodeAddressString(address) { (placemarks, error) in
//            guard let placemarks = placemarks,
//                let location = placemarks.first?.location?.coordinate else {
//                    return
//            }
//            completion(location)
//        }
//    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        getLocation(from: data[indexPath.row]) { location in
//            self.lati = String(format:"%.6f", (location?.latitude)!)
//            self.long = String(format:"%.6f", (location?.longitude)!)
//        }
//        let group = DispatchGroup()
//        group.enter()
//
//
//        getCoordinateFrom(address: data[indexPath.row]) { coordinate, error in
//            guard let coordinate = coordinate, error == nil else { return }
//
//
//            self.lati = String(format:"%.6f", coordinate.latitude)
//            self.long = String(format:"%.6f", coordinate.longitude)
//            print("coordinates:", coordinate)
//            print(self.lati, self.long)
//
//            // don't forget to update the UI from the main thread
////            DispatchQueue.main.async {
////                print(address, "Location:", coordinate) // Rio de Janeiro, Brazil Location: CLLocationCoordinate2D(latitude: -22.9108638, longitude: -43.2045436)
////            }
//
//        }
        
        //group.leave()
        
        //group.notify(queue: DispatchQueue.main) {
        self.index_path = indexPath.row
        self.performSegue(withIdentifier: "segue_to_weather", sender: self.self)
            
        //}
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? search_weather_vc {
            
           
            //print("printing coords")
            //print(self.lati, self.long)
            //vc.lat = self.lati //"40.7128"
            //vc.lon = self.long //"-73.935242"
            vc.loc = data[index_path]
            
        }
    }
    
    
//    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
//        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
//    }
    
    
    
    
    
    
}


