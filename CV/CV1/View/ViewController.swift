//
//  ViewController.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/19/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    @IBOutlet var viewBar: UIView!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var cvTable: UITableView!
    

    let presenter: CVPresenter = CVPresenter(dataServices: CVServicesNetworking())
    
    var didAnimate = true
    var itemSelected:ApplicationT?
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    @IBAction func showInfo(_ sender: Any) {
        let ac = UIAlertController(title : "Contact 📲", message: presenter.getContactMsg() , preferredStyle: .alert)
        ac.addAction(UIAlertAction(title:"OK", style: .default))
        self.present(ac, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dv = segue.destination as? DetailAppViewController
        dv?.presenter.appHolder = itemSelected ?? ApplicationT(name: "", icon: "", description: "")
  
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getItemsCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = presenter.getItemsElement(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: type(of: item).id)!
        item.configure(cell: cell)
        return cell
    }
    
    func animateTable() {
        
        self.cvTable.reloadData()
        
        let cells = cvTable.visibleCells
        let tableHeight: CGFloat = cvTable.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i as UITableViewCell
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            self.cvTable.isHidden = false
            let cell: UITableViewCell = a as UITableViewCell
            UIView.animate(withDuration: 0.5, delay: 0.0 , usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .transitionFlipFromTop, animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0);
            }, completion: nil)
            
            index += 1
        }
    }
    
        
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getApplicationsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppCollectionCell", for: indexPath) as! AppCollectionViewCell
        collectionCell.icon.image = presenter.getApplicationElement(at: indexPath.row).convertB64ToImage()
        collectionCell.icon.layer.cornerRadius = 10.00
        return collectionCell
    }

    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
            itemSelected = presenter.getApplicationElement(at: indexPath.row)
        return true
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Detail", sender: self)
    }
    
    
}

extension ViewController: CVViewProtocol{
    
    func setUpUI() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.nameLabel.adjustsFontSizeToFitWidth = true

        cvTable.delegate = self
        cvTable.dataSource = self
        presenter.delegate = self
        
        presenter.getData()
        setUpProfileImage()
        setUpBar()
    }
    
    
    func updateUI(items:[SetterUpCell], CV:Curriculum){
        DispatchQueue.main.async {
            self.nameLabel.text = CV.name.components(separatedBy: "%")[0]
            self.lastNameLabel.text = CV.name.components(separatedBy: "%")[1]
            self.cvTable.reloadData()
            self.animateUI()
            self.animateTable()
        }
    }
    
    
    func setUpBar() {
        guard let firstColor = UIColor(named: "StrongBlue") else {return}
        guard let secondColor =  UIColor(named: "LightBlue") else {return}
        viewBar.setGradientBackground(initialColor: firstColor, finalColor: secondColor)
        viewBar.alpha = 0.0
    }
    
    func setUpProfileImage() {
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.width/2
        self.profileImage.layer.shadowColor = UIColor.black.cgColor
        self.profileImage.layer.shadowOffset = .zero
        self.profileImage.layer.shadowRadius = 4.0
        self.profileImage.layer.shadowOpacity = 1.0
        self.profileImage.alpha = 0.0
    }
    
    func animateUI() {
        
        profileImage.center.y -= (viewBar.bounds.height + self.profileImage.bounds.height/2)
          profileImage.center.x = viewBar.bounds.width/2
          cvTable.center.y -= cvTable.bounds.width * 2
          
          nameLabel.center.x += nameLabel.bounds.width
          lastNameLabel.center.x += lastNameLabel.bounds.width
          
          nameLabel.alpha = 0.0
          lastNameLabel.alpha = 0.0
        
        UIView.animate(withDuration: 1.0, delay: 0.1,
                       usingSpringWithDamping: 2.0, initialSpringVelocity: 0.0, options: [], animations: {
                        self.profileImage.center.y += (self.viewBar.bounds.height + self.profileImage.bounds.height/2)
                        self.profileImage.center.x = self.viewBar.bounds.width/2
                        self.nameLabel.center.x += self.nameLabel.bounds.width
                        self.lastNameLabel.center.x -= self.lastNameLabel.bounds.width
                        self.nameLabel.alpha = 1.0
                        self.lastNameLabel.alpha = 1.0
                        self.viewBar.alpha = 1.0
                        self.profileImage.alpha = 1.0
                        self.cvTable.center.y -= self.cvTable.bounds.width*2
        }, completion: {_ in
        })
    }
    
  

    

}
