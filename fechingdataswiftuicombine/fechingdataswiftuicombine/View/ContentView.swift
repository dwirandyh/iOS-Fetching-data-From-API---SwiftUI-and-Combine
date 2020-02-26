//
//  ContentView.swift
//  fechingdataswiftuicombine
//
//  Created by Dwi Randy Herdinanto on 26/02/20.
//  Copyright © 2020 dwirandyh.com. All rights reserved.
//

import SwiftUI

let apiUrl = "https://api.letsbuildthatapp.com/static/courses.json"

struct ContentView: View {
    
    @ObservedObject var courseViewModel = CourseViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                Text(courseViewModel.messages)
                
                ForEach(courseViewModel.courses){course in
                    Text(course.name)
                    
                    CourseItem(name: course.name, bannerUrl: course.bannerUrl)
                }
                
            }.navigationBarTitle("Course List")
                .navigationBarItems(trailing: Button(action: {
                    self.courseViewModel.fetchCourses()
                }, label: {
                    Text("Fetch Course")
                }))
        }
    }
}


struct CourseItem : View {
    
    var name: String
    var bannerUrl: String
    
    var body: some View {
        VStack{
            ImageRow(url: bannerUrl).frame(width: 100, height: 50)
            Text(self.name)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
