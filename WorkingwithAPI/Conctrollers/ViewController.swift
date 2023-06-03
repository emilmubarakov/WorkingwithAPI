//
//  ViewController.swift
//  WorkingwithAPI
//
//  Created by e.mubarakov on 14.05.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var petitions = [Petition]()

    private let tableView = UITableView()
    let urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = .white
        navigationItem.title = "All petitions"
        
        setUpView()
        apiCall()
    }
    
    func apiCall() {
        APICaller.getPetitions { [weak self] result in
            switch result {
            case .success(let data):
                self?.petitions = data.results
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setUpView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        petitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
