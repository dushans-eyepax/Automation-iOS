//
//  CountryDetailsViewController.swift
//  Automation-iOS
//
//  Created by Dushan Saputhanthri on 6/6/22.
//

import UIKit
import MapKit

class CountryDetailsViewController: BaseViewController {
    
    let vm = CountryDetailsViewModel()
    
    @IBOutlet weak var lblCountryName: UILabel!
    @IBOutlet weak var lblCapital: UILabel!
    @IBOutlet weak var lblArea: UILabel!
    @IBOutlet weak var lblPopulation: UILabel!
    @IBOutlet weak var lblRegion: UILabel!
    @IBOutlet weak var lblSubregion: UILabel!
    @IBOutlet weak var lblTopLevelDomain: UILabel!
    @IBOutlet weak var lblCallingCodes: UILabel!
    @IBOutlet weak var lblCurrencies: UILabel!
    @IBOutlet weak var lblLanguages: UILabel!
    @IBOutlet weak var lblTimezones: UILabel!
    @IBOutlet weak var imageViewFlag: UIImageView!
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Country Details"
        
        setupUI()
        showInfo()
    }

    func setupUI() {
        
    }
    
    func showInfo() {
        
        guard let country = vm.country else {
            return
        }
        
        lblCountryName.text = country.name ?? "-"
        
        let flagUrlString = country.flags?.png ?? ""
        imageViewFlag.setImageWithUrl(flagUrlString)
        
        lblCapital.text = country.capital ?? "-"
        
        lblArea.text = "\(country.area ?? 0) km²"
        lblPopulation.text = (country.population ?? 0).roundedWithAbbreviations
        
        lblRegion.text = country.region ?? "-"
        lblSubregion.text = country.subregion ?? "-"
        
        lblTopLevelDomain.text = (country.topLevelDomain ?? []).joined(separator: .CommaWithSpace)
        lblCallingCodes.text = (country.callingCodes ?? []).joined(separator: .CommaWithSpace)
        lblCurrencies.text = (country.currencies ?? []).map({$0.name ?? ""}).joined(separator: .LineBreak)
        lblLanguages.text = (country.languages ?? []).map({$0.name ?? ""}).joined(separator: .LineBreak)
        lblTimezones.text = (country.timezones ?? []).joined(separator: .LineBreak)
        
        showInMap(country: country)
    }
    
    func showInMap(country: Country?) {
        
        let title = country?.name ?? ""
        let subtitle = "\(country?.subregion ?? ""), \(country?.region ?? "")"
        
        guard let location = country?.latlng,
              let latitude = location.first,
              let longitude = location.last else {
            return
        }
        
        let locationCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let camera = MKMapCamera(lookingAtCenter: locationCoordinate, fromDistance: 3.0, pitch: 0.0, heading: 1.0)
        self.mapView.camera = camera
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        self.mapView.showsCompass = true
        self.mapView.isZoomEnabled = true
        self.mapView.mapType = .standard
        
        self.createMarker(title: title, subtitle: subtitle, latitude: latitude, longitude: longitude, mapView: self.mapView)
    }
    
    func createMarker(title: String?, subtitle: String?, latitude: Double, longitude: Double, mapView: MKMapView) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
        annotation.title = title
        annotation.subtitle = subtitle
        mapView.addAnnotation(annotation)
    }

}

extension CountryDetailsViewController: MKMapViewDelegate {
    
    
}

