//
//  CVPresenter.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/23/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

class CVPresenter: CVPresenterProtocol{
    
    weak var delegate: CVViewProtocol?
    
    let dataServices: CVServicesNetworking
    var items: [SetterUpCell] = [SetterUpCell]()
    var curriculum:Curriculum?
    var itemSelected:ApplicationT?

    required init(dataServices: CVServicesNetworking) {
        self.dataServices = dataServices
    }
    
    func fullWidthData(cv:Curriculum) -> [SetterUpCell]{
        
        var itemsArray:[SetterUpCell] = [SetterUpCell]()
        
        //The CV has a format that should be
        
        //1.-About me
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.aboutMeHeader.title, icon: cv.aboutMeHeader.icon)) )
        itemsArray.append( TableCellSetterUp <AboutTableViewCell, String> (item: cv.about) )
        
        //2.-Languages
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.languagesHeader.title, icon: cv.languagesHeader.icon)) )
        
        for lan in cv.languages{
            itemsArray.append( TableCellSetterUp <LanguagesTableViewCell, Language>(item: Language(language: lan.language, percentage: lan.percentage) ) )
        }
        
        //3.-Education
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.educationHeader.title, icon: cv.educationHeader.icon)) )
        
        for ed in cv.education{
            itemsArray.append( TableCellSetterUp <DescriptionTableViewCell, Description>(item: Description(title: ed.title, description: ed.description) ) )
        }
        
        //4.-Work Experience
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.workExperienceHeader.title, icon: cv.workExperienceHeader.icon)) )
        
        for we in cv.workExperience{
            itemsArray.append( TableCellSetterUp <DescriptionTableViewCell, Description>(item: Description(title: we.title, description: we.description)) )
        }
        
        //5.-Personal Projects
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.personalProjectsHeader.title, icon: cv.personalProjectsHeader.icon)) )
        itemsArray.append( TableCellSetterUp <ApplicationsTableViewCell, String>(item: "instance") )
        
        
        //6.- Programming languages & Frameworks
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.programmingHeader.title, icon: cv.programmingHeader.icon)) )
        for (row,pl) in cv.programmingLanguages.enumerated(){
            itemsArray.append( TableCellSetterUp <ElementTableViewCell, String>(item: cv.programmingLanguages[row]) )
        }
        
        //Certifications
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.certificationsHeader.title, icon: cv.certificationsHeader.icon)) )
        
        for ce in cv.certifications{
            itemsArray.append( TableCellSetterUp <DescriptionTableViewCell, Description>(item: Description(title: ce.title, description: ce.description)))
        }
        
        //Extracurriculars
        itemsArray.append( TableCellSetterUp <TitleTableViewCell,HeaderT>(item: HeaderT(title: cv.extracurricularsHeader.title, icon: cv.extracurricularsHeader.icon)) )
        
        for ec in cv.extracurricular{
            itemsArray.append( TableCellSetterUp <ElementTableViewCell, String>(item: ec ) )
        }
        
        return itemsArray
        
    }

    func getData() {
        
        dataServices.getCVData{ (cv) in
                   if let cv = cv{
                    self.curriculum = cv
                    self.items = self.fullWidthData(cv: cv)
                    self.delegate?.updateUI(items: self.items , CV: cv)
                    }
               }
    }
    
    func getContactMsg() -> String {
        
        if let phone = curriculum?.contact.phone, let email = curriculum?.contact.email, let git = curriculum?.contact.github{
            return """
            Phone: \(phone)
            Email: \(email)
            Github: \(git)
            """
        }
        
        return "😋"
        
    }
    
    func getItemsCount() -> Int {
        return items.count
    }
    
    func getItemsElement(at index:Int) -> SetterUpCell {
        return items[index]
    }
    
    func getApplicationsCount() -> Int {
        return curriculum?.personalProjects.count ?? 0
    }
    
    func getApplicationElement(at index: Int) -> ApplicationT {
        return curriculum?.personalProjects[index] ?? ApplicationT(name: "", icon: "", description: "")
    }
    
}
