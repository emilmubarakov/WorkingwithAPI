//
//  PersonalViewController.swift
//  WorkingwithAPI
//
//  Created by e.mubarakov on 29.05.2023.
//

import UIKit
import SnapKit

class PersonalViewController: UITabBarController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "My name is Emil"
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .darkGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.leading.equalTo(30)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
