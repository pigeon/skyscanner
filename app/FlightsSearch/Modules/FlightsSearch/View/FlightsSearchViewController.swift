//
//  ImagesImagesViewController.swift
//
//
//  Created by magic on 08/06/2018.
//
//

import UIKit

extension CGRect {
    init(_ x:CGFloat, _ y:CGFloat, _ w:CGFloat, _ h:CGFloat) {
        self.init(x:x, y:y, width:w, height:h)
    }
}


class FlightsSearchViewController: UIViewController, FlightsSearchViewInput {

    var output: FlightsSearchViewOutput!
    var navigationBarView:NavigationBar?
    
    @IBOutlet weak var collectionView: UITableView!
    

    
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        navigationBarView = NavigationBar(frame:CGRect(0,0,self.view.bounds.size.width,89 + 22))
        
        self.navigationController?.view.insertSubview(navigationBarView!, aboveSubview: (navigationController?.navigationBar)!)
        
        output.viewIsReady()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func reload() {
        self.navigationBarView?.numberOfResults.text = output.numberOfResults()
        self.navigationBarView?.title.text = output.title()
        self.navigationBarView?.dates.text = output.subTitle()
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
