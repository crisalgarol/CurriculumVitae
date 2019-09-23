//
//  DetailAppViewController.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/22/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import UIKit

class DetailAppViewController: UIViewController, DetailViewProtocol {

    @IBOutlet var topBar: UIView!
    @IBOutlet var iconApp: UIImageView!
    @IBOutlet var appDescription: UILabel!

    let presenter = DetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate? = self
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        iconApp.image = presenter.convertB64ToImage()
        iconApp.layer.cornerRadius = 10.0
        setUpBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        appDescription.text = presenter.appHolder.description
        self.title = presenter.appHolder.name
    }
    
    func setUpBar(){
        
        guard let firstColor = UIColor(named: "StrongBlue") else {return}
        guard let secondColor =  UIColor(named: "LightBlue") else {return}
        
        topBar.setGradientBackground(initialColor: firstColor, finalColor: secondColor)
        
    }
    
  


}
