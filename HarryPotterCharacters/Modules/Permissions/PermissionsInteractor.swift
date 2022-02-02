//
//  PermissionsInteractor.swift
//  HarryPotterCharacters
//
//  Created by Elia Dotor Puente on 2/2/22.
//

import Foundation
import CoreLocation


class PermissionsInteractor: NSObject {
    weak var output: PermissionsInteractorOutputContract?
    private let locationManager: CLLocationManager
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
    }
        
}

extension PermissionsInteractor: PermissionsInteractorContract {
    var currentPermission: PermissionsIteractorStatus {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            return .unknown
        case .restricted, .denied:
            return .denied
        case .authorizedAlways, .authorizedWhenInUse:
            return .allowed
        @unknown default:
            return .unknown
        }
    }
    
    func requestPermissions() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
}


extension PermissionsInteractor: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        output?.didUpdatePermission(status: currentPermission)
    }
}
