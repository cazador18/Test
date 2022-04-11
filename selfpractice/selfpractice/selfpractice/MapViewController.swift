//
//  MapViewController.swift
//  selfpractice
//
//  Created by Erzhan Kasymov on 29/3/22.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationEnabled()
    }
    func checkLocationEnabled(){
        if CLLocationManager.locationServicesEnabled(){
            setupManager()
            checkAuthorization()
        }else{
            
            showAlertLocation(title: "Your GPS is turned off", message: "Do you wanna turn on it?", url: URL(string: "App-Prefs:root=LOCATION_SERVICES"))
            
    }
    }
    func setupManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    func checkAuthorization(){
        switch CLLocationManager.authorizationStatus() {
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            mapView.showsUserLocation =  true
            locationManager.startUpdatingLocation()
            break
        case .denied:
            showAlertLocation(title: "You have banned the use of geolocation", message: "Want to change?", url: URL(string: UIApplication.openSettingsURLString))
            break
        case .restricted:
            break
        case .notDetermined:
                     locationManager.requestWhenInUseAuthorization()
        
        
        }
    }
    func showAlertLocation(title: String, message: String?,url: URL?){
        //URL(string: "App-Prefs:root=LOCATION_SERVICES")
        let alert = UIAlertController(title: title, message:message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { alert in
            if let url = url{
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(settingsAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }


}
extension MapViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate{
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 5000, longitudinalMeters: 5000)
            mapView.setRegion(region, animated: true)
        }
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkAuthorization()
    }
}
