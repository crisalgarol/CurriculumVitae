//
//  Curriculum.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/22/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

class Curriculum : Decodable{
    
    let aboutMeHeader:HeaderT
    let languagesHeader:HeaderT
    let educationHeader:HeaderT
    let workExperienceHeader:HeaderT
    let personalProjectsHeader:HeaderT
    let programmingHeader:HeaderT
    let certificationsHeader:HeaderT
    let extracurricularsHeader:HeaderT
    
    
    let name:String
    let address:String
    let about:String
    let languages:[Language]
    let workExperience:[Description]
    let education:[Description]
    let photo:String
    let personalProjects:[ApplicationT]
    let programmingLanguages:[String]
    let certifications:[Description]
    let extracurricular:[String]
    let contact:ProfileContact
    
    
    init(aboutMeHeader:HeaderT,
         languagesHeader:HeaderT,
         educationHeader:HeaderT,
         workExperienceHeader:HeaderT,
         personalProjectsHeader:HeaderT,
         programmingHeader:HeaderT,
         certificationsHeader:HeaderT,
         extracurricularsHeader:HeaderT,
         name:String, address:String,
         about:String ,
         languages:[Language],
         workExperience:[Description],
         education:[Description],
         photo:String,
         personalProjects:[ApplicationT],
         programmingLanguages:[String],
         certifications:[Description],
         extracurricular:[String],
         contact:ProfileContact ){
        
        self.aboutMeHeader = aboutMeHeader
        self.languagesHeader = languagesHeader
        self.educationHeader = educationHeader
        self.workExperienceHeader = workExperienceHeader
        self.personalProjectsHeader = personalProjectsHeader
        self.programmingHeader = programmingHeader
        self.certificationsHeader = certificationsHeader
        self.extracurricularsHeader = extracurricularsHeader
        
        self.name = name
        self.address = address
        self.about = about
        self.languages = languages
        self.workExperience = workExperience
        self.education = education
        self.photo = photo
        self.personalProjects = personalProjects
        self.programmingLanguages = programmingLanguages
        self.certifications = certifications
        self.extracurricular = extracurricular
        self.contact = contact
        
    }
    
}
