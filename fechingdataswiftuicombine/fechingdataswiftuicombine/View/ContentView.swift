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
                HStack{
                    Spacer()
                }
                
                ForEach(courseViewModel.courses){course in
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
            ImageRow(url: bannerUrl).frame(height: 200)
            Text(self.name)
            
            Divider()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
