//
//  ContentView.swift
//  Dribble-design
//
//  Created by Sam Maurya on 23/12/21.
//

import SwiftUI

struct ContentView: View {
    
    private let categories = ["All","Chair","Sofa","Lamp","Kitchen","Table"]
    @State private var selectedIndex = 0
    
    var body: some View {
        ZStack {
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack(alignment: .leading){
                    
                    AppbarView()
                    
                    TagLineView()
                        .padding()
                    
                    SearchAndScanView()
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< categories.count) { item in
                                CategoryView(isActive: item == selectedIndex, text: categories[item])
                                    .onTapGesture {
                                        selectedIndex = item
                                    }
                            }
                        }
                        .padding()
                    }
                    
                    Text("Popular")
                        .font(.system(size: 24))
                        .padding()
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"),size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding()
                    }
                    
                    Text("Best")
                        .font(.system(size: 24))
                        .padding(.horizontal)
                        .padding(.top)
                    
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack {
                            ForEach(0 ..< 4) { index in
                                ProductCardView(image: Image("chair_\(index + 1)"),size: 210)
                            }
                            .padding(.trailing)
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppbarView: View {
    var body: some View {
        HStack{
            
            Button {
            } label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("Profile")
                    .resizable()
                    .frame(width: 42,height: 42)
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("find The \nBest ")
            .font(.system(size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.system(size: 28,weight: .bold))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    
    
    
    @State private var search = ""
    
    var body: some View {
        HStack {
            HStack{
                Image("Search").padding(.trailing,8)
                TextField("Search Furniture",text: $search)
            }
            .padding(.all,20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
             
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    
    let isActive : Bool
    let text: String
    
    var body: some View {
        
        VStack(alignment: .leading,spacing: 0) {
            Text(text)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(isActive ?  Color("Primary") : Color.black.opacity(0.5))
                
            if(isActive){
                Color("Primary")
                  .frame(width: 15,height: 2)
                  .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView: View {
    let image : Image
    let size: CGFloat
    
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            Text("Luxury Swedian chair")
                .font(.title3)
                .fontWeight(.bold)
            
            HStack{
                ForEach(0 ..< 5){ item in
                    Image("star")
                }
                
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .fontWeight(.bold)
                
            }
            
        }
        .frame(width:size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}
