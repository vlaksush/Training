//
//  ViewController.swift
//  MyAddress
//
//  Created by Ravi Shankar on 30/09/24.
//

import UIKit
import CoreLocation

class MyAddressViewController: UIViewController {
    @IBOutlet weak var addressTextView: UITextView!
    
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    //    locationManager.requestWhenInUseAuthorization()
    }

    @IBAction func getMyAddress(sender: Any) {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension MyAddressViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        // Stop updating location to conserve battery
        locationManager.stopUpdatingLocation()
        
        // Get address from location
        getAddressFromLocation(location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error.localizedDescription)
    }
    
    func getAddressFromLocation(_ location: CLLocation) {
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemark found")
                return
            }
            
            // Create address string
            let address = [
                placemark.subThoroughfare,
                placemark.thoroughfare,
                placemark.locality,
                placemark.administrativeArea,
                placemark.postalCode,
                placemark.country
            ].compactMap { $0 }.joined(separator: ", ")
            
            DispatchQueue.main.async {
                self.addressTextView.text = address
            }
        }
    }
}

