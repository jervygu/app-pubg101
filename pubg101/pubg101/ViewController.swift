//
//  ViewController.swift
//  pubg101
//
//  Created by Jervy Umandap on 5/27/21.
//

import UIKit

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(WeaponsTableViewCell.self, forCellReuseIdentifier: WeaponsTableViewCell.identifier)
        tableView.backgroundColor = .systemBackground
//        tableView.separatorInset = .zero
        return tableView
    }()
    
    private var weapons = [Weapon]()
    private var viewModels = [WeaponsTableViewCellViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pubg 101"
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .label
        
        view.addSubview(tableView)
        
        fetchWeapons()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
        
    }
    
    private func fetchWeapons() {
        APICaller.shared.getWeapons { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let model):
                    self?.weapons = model.weapons
                    self?.viewModels = model.weapons.compactMap({
                        WeaponsTableViewCellViewModel(
                            name: $0.weaponName,
                            type: "Weapon Type: \($0.weaponType)",
                            dps: "Dps: \($0.damagePerSecond)",
                            range: "Range: \($0.range ?? 0)",
                            imageURL: URL(string: $0.imageURL))
                    })
                    self?.tableView.reloadData()
                    
                case .failure(let error):
                    print(error)
                    break
                }
            }
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeaponsTableViewCell.identifier, for: indexPath) as? WeaponsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(withViewModel: viewModels[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let weapons = viewModels[indexPath.row]
        
        let vc = WebViewController()
        vc.weaponName = weapons.name
        vc.title = weapons.name
        vc.navigationItem.largeTitleDisplayMode = .never
        
        print(weapons.name)
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
