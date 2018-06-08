//
//  ImagesImagesViewController.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import UIKit


class FlightsSearchViewController: UIViewController, FlightsSearchViewInput {

    var output: FlightsSearchViewOutput!
    
    @IBOutlet weak var collectionView: UITableView!
    

    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                style: .plain,
                                                                target: nil,
                                                                action: nil)

        self.navigationItem.title = output.title()
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func reload() {
        self.collectionView.reloadData()
    }

    // MARK: ImagesViewInput
    func setupInitialState() {
    }
    
}


extension FlightsSearchViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfItemsInSection()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlightDetailsCell.self), for: indexPath) as! FlightDetailsCell
            cell.configureCell(details: self.output.dataModel(with: indexPath).outbountFlight)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlightDetailsCell.self), for: indexPath) as! FlightDetailsCell
            cell.configureCell(details: self.output.dataModel(with: indexPath).inboundFlight)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlightPriceCell.self), for: indexPath) as! FlightPriceCell
            cell.configureCell(details: self.output.dataModel(with: indexPath))
            return cell
        }
    }
    
    
}
