//  RentBike
//
//  Created by Marian on 10/28/17.
//  Copyright © 2017 Marian. All rights reserved.
//

import UIKit
import MapKit
import SwiftKeychainWrapper

class MapViewController: BaseViewController {
    // MARK: - IBOutlet

    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - Class Properties

    let regionRadius: CLLocationDistance = 1000
    var presenter: MapPresenterProtocol?
    var pinAnnotations: [PinAnnotation] = []
    var places:[Place]?
    var selectedPlace: Place?
    
    // MARK: - Class methods

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.delegate = self
        presenter = MapPresenter(view: self)
        presenter?.getPlaceList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - IBActions

    
    @IBAction func logout(_ sender: Any) {
        KeychainWrapper.standard.removeObject(forKey: DataConstants.UserData.token)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController  = appDelegate.window!.rootViewController
        
        if rootViewController is UITabBarController {
            
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController") as! UINavigationController
            appDelegate.window?.rootViewController?.dismiss(animated: false, completion: nil)
            appDelegate.window?.rootViewController?.view.removeFromSuperview()
            appDelegate.window?.rootViewController = navigationController
            appDelegate.window?.makeKeyAndVisible()
            
        }else{
            performSegue(withIdentifier: "unwindToMainMenuWithSender", sender: self)
        }
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        if segue.identifier == "rent"{
        let rentViewController = segue.destination as! RentViewController
        rentViewController.selectedPlace = self.selectedPlace
        }
     }
     
    
}

// MARK: - MapViewProtocol implementation

extension MapViewController: MapViewProtocol{
    func showPlacesOnMap(places: [Place]) {
        
        self.places = places
        let center = CLLocationCoordinate2D(latitude: places[0].location!.latitude!, longitude: places[0].location!.latitude!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(region, animated: true)
        
        for place in places{
            let annotation = PinAnnotation(coordinate: CLLocationCoordinate2D(latitude: (place.location?.latitude)!,longitude: (place.location?.longitude)!), title: place.name!)
            pinAnnotations.append(annotation)
            self.mapView.addAnnotation(annotation)

        }
        self.mapView.showAnnotations(self.mapView.annotations, animated: true)

    }
    
    func showErrorMsg(msg : String){
        alert(message: msg)
    }
}
// MARK: - MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView?{
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: "PinAnnotation")
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "PinAnnotation")
            view?.canShowCallout = true
            view?.rightCalloutAccessoryView = UIButton(type: .contactAdd)
        } else {
            view?.annotation = annotation
        }
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        if control == view.rightCalloutAccessoryView {
            if let selectedIndex = places?.index(where: { $0.location?.latitude == view.annotation?.coordinate.latitude }){
                self.selectedPlace = places![selectedIndex]
                self.performSegue(withIdentifier: "rent", sender: self)
            }
        }
    }
}
extension MapViewController: UITabBarControllerDelegate{
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            let viewController  = tabBarController.viewControllers?[1] as! HistoryViewController
            viewController.places = self.places
        
        return true
    }
}
