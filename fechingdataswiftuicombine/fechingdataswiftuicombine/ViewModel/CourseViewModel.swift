//
//  CourseViewModel.swift
//  fechingdataswiftuicombine
//
//  Created by Dwi Randy Herdinanto on 26/02/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import Foundation

class CourseViewModel : ObservableObject {
    
    let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"
    
    @Published var messages = "Messages from view model"
    
    @Published var courses: [Course] = []
    
    func fetchCourses(){
        guard let url = URL(string: apiUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // make sure to check error / response
            
            DispatchQueue.main.async {
                do {
                    self.courses = try JSONDecoder().decode([Course].self, from: data!)
                    
                }catch let error as NSError{
                    debugPrint(error)
                }
            }
            
        }.resume()
    }
}
