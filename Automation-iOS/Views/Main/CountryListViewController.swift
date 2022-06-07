//
//  CountryListViewController.swift
//  Automation-iOS
//
//  Created by Dushan Saputhanthri on 6/6/22.
//

import UIKit

class CountryListViewController: BaseViewController {
    
    let vm = CountryListViewModel()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
        tableView.register(UINib(nibName: "CountryTVCell", bundle: nil), forCellReuseIdentifier: .CountryCell)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        getCountryList()
    }

}

extension CountryListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: .CountryCell, for: indexPath) as? CountryTVCell {
            let country = vm.countryList[indexPath.row]
            cell.configureCell(with: country)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country = vm.countryList[indexPath.row]
        Coordinator.shared.pushToViewController(in: .Main, for: .CountryDetailsViewController, from: self, data: country)
    }
}

extension CountryListViewController {
    
    func getCountryList() {
        self.startLoading()
        vm.getCountryListWithAPI(completion: { success, code, message in
            self.stopLoading()
            if success {
                self.tableView.reloadData()
            } else {
                AlertProvider(vc: self).showAlert(title: "Error", message: message, action: AlertAction(title: "Dismiss"))
            }
        })
    }
}

