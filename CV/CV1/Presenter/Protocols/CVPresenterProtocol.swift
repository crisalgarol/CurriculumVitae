//
//  CVPresenterProtocol.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/23/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

protocol CVPresenterProtocol{
    
    init(dataServices:CVServicesNetworking)
    func fullWidthData(cv:Curriculum) -> [SetterUpCell]
    func getData()
    func getContactMsg()->String
    func getItemsCount()->Int
    func getItemsElement(at index: Int) -> SetterUpCell
    func getApplicationsCount()->Int
    func getApplicationElement(at index:Int)->ApplicationT
   
}
