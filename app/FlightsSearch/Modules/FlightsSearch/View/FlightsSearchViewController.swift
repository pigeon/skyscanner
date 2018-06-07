//
//  ImagesImagesViewController.swift
//  Movies
//
//  Created by Dmytro Golub on 09/04/2018.
//  Copyright © 2018 Dmytro Golub. All rights reserved.
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        output.prepare(for: segue)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FlightDetailsCell.self), for: indexPath) as! FlightDetailsCell
        cell.configureCell(details: self.output.dataModel(with: indexPath).inboundFlight)
        return cell
    }
    
    
}
