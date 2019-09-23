//
//  CVServicesNetworking.swift
//  CV1
//
//  Created by Cristian Olmedo on 9/23/19.
//  Copyright © 2019 Cristian Olmedo. All rights reserved.
//

import Foundation

class CVServicesNetworking{

    let baseURL = URL(string: "https://gist.githubusercontent.com/crisalgarol/7d6c7c262a2e35b82a7e80a62264a324/raw/7db953ee6a998e6299d7819cc7c22bb27682b455/bekojsonprueba.json")!
    
    
    func getCVData(completion: @escaping (Curriculum?) -> Void ){
          
          let task = URLSession.shared.dataTask(with: baseURL){
              (data, response, error) in
              
              if let data = data{
                  do{
                      let decoder = JSONDecoder()
                      let m = try decoder.decode(Curriculum.self, from: data)
                      completion(m)
                  }catch{
                    #if DEBUG
                      print(error)
                    #endif
                  }
          }
          }
          
          task.resume()
      }
    
}

