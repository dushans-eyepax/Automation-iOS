//
//  MainViewController.swift
//  Automation-iOS
//
//  Created by Dushan Saputhanthri on 6/6/22.
//

import UIKit

class MainViewController: BaseViewController {
    
    let vm = MainViewModel()
    
    let tableViewReuseIdentifier = "CountryCell"

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Countries"
        
        tableView.register(UINib(nibName: "CountryTVCell", bundle: nil), forCellReuseIdentifier: tableViewReuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        getCountryList()
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.countryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: tableViewReuseIdentifier, for: indexPath) as? CountryTVCell {
            cell.configureCell(with: vm.countryList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension MainViewController {
    
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

