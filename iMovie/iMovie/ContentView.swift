//
//  ContentView.swift
//  iMovie
//
//  Created by Hmoo Myat Theingi on 23/07/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            Background(color: "Background")
            ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    MenuBar(leftLogo: "line.3.horizontal", text: "iMovie", rightLogo: "magnifyingglass")
                    Description(text: "Trailers")
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            Trailers(image: "xokitty", name: "XO kitty")
                            Trailers(image: "queenCharlotte", name: "Queen Charlotte")
                            Trailers(image: "Sharper", name: "Sharper")
                            Trailers(image: "theSummerITurnedPretty", name: "The Summer I Turned Pretty ")
                        }
                    }
                    Description(text: "Trending Movies")
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            TrendingMovies(image: "Barbie2023", duration: "113 min • 2023 ", name: "Barbie")
                            TrendingMovies(image: "LittleMermaid",duration: "135 min • 2023", name: "Little Mermaid")
                            TrendingMovies(image: "TheMother",duration: "115 min • 2023", name: "The Mother")
                            TrendingMovies(image: "Unlocked",duration: "117 min • 2023 " ,name: "Unlocked")
                            TrendingMovies(image: "You", duration: "40 min • 2023 ", name: "You")
    
                        }
                    }
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack{
                            Genre(opacity: 0.1,background: "Red", text: "All", width: 50)
                            Genre(text: "Drama", width: 100)
                            Genre(text: "Romance", width: 100)
                            Genre(text: "Action", width: 100)
                            Genre(text: "Horror", width: 100)
                            Genre(text: "Comedy", width: 100)
                            Genre(text: "Thriller", width: 110)
                            Genre(text: "Sci-fi", width: 100)
                            Genre(text: "Musical", width: 110)
                            Genre(text: "Mystery", width: 100)
                        }
                        .padding()
                    }
                    ScrollView(.vertical,showsIndicators: false) {
                        VStack{
                            HStack{
                                Movies(image: "badBoy", duration: "110 min • 2023 ", name: "Bad Boy")
                                Movies(image: "blackPanther", duration: "110 min • 2023", name: "Black Panther")
                                Movies(image: "doRevenge", duration: "123 min • 2023 ", name: "Do Revenge")
                            }
                            HStack{
                                Movies(image: "flash", duration: "103 min • 2023", name: "Flash")
                                Movies(image: "joy", duration: "103 min • 2023", name: "Joy")
                                Movies(image: "otto", duration: "103 min • 2023", name: "Otto")
                            }
                            HStack{
                                Movies(image: "plane", duration: "113 min • 2023", name: "Plane")
                                Movies(image: "theJohnsons", duration: "133 min • 2023", name: "The Johnsons")
                                Movies(image: "soul", duration: "103 min • 2023 ", name: "soul")
                            }
                            
                            
                            
                        }
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
//MARK: - Background

struct Background:View {
    var color:String
    var body: some View{
        Color(color)
            .ignoresSafeArea()
    }
}

//MARK: - Trailers

struct Trailers:View {
    var image:String
    var name:String

    var body: some View{
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: .infinity,height: 200)
            .cornerRadius(10)
            .overlay(
                VStack{
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50,height: 50)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.red)

                }

                )
            .overlay (
                Text(name)
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
                   .padding()
                ,alignment: .topLeading
            )



    }
}


//MARK: - MenuBar

struct MenuBar:View {
    var leftLogo:String
    var text:String
    var rightLogo:String
    var body: some View{
        HStack{
            Image(systemName: leftLogo)
                .font(.title)
            Spacer()
            Text(text)
                .font(.title2)
                .fontDesign(.rounded)
                .fontWeight(.medium)
            Spacer()
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 50,height: 50)
                .background(Color("Icon"))
                .opacity(0.1)
                .overlay {
                    Image(systemName: rightLogo)
                }
        }.foregroundColor(.white)
            .padding()
    }
}

//MARK: - Description


struct Description:View {
    var text:String
    var body: some View{
        HStack{
            Text(text)
                .foregroundColor(.white)
                .font(.title)
                .fontDesign(.rounded)
                .fontWeight(.bold)
            Spacer()
        }
        .padding(.horizontal)
    }

}
//MARK: - TrendingMovies

struct TrendingMovies:View {
    var image:String
    var duration:String?
    var name:String
    var width: CGFloat?
    var body: some View{
        VStack(alignment: .leading){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width:width ?? 200)
                .cornerRadius(10)
            HStack{
                RoundedRectangle(cornerRadius: 1)
                    .foregroundColor(.red)
                    .frame(width: 10,height: 10)
                Text(duration ?? "")
                    .foregroundColor(.gray)
                    .font(.callout)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
            Text(name)
                .foregroundColor(.white)
                .font(.title3)
                .fontDesign(.rounded)
                .fontWeight(.medium)
        }
        .padding()
    }
}
//MARK: - Genre

struct Genre:View {
    var opacity:Double?
    var background:String?
    var text:String
    var width: CGFloat
    var body: some View{
        Rectangle()
            .opacity(opacity ?? 0.7)
            .frame(width: width,height: 40)
            .background(Color(background ?? "Icon"))
            .overlay {
                Text(text)
                    .foregroundColor(.white)
                    .font(.title3)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
            }
            .cornerRadius(10)
            .padding(.horizontal,5)

    }
}

//MARK: - Movies

struct Movies:View {
    var image:String
    var duration:String
    var name:String

    var body: some View{
        VStack(alignment: .leading){
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width:100)
                .cornerRadius(10)
            HStack{
                RoundedRectangle(cornerRadius: 1)
                    .foregroundColor(.red)
                    .frame(width: 5,height: 5)
                Text(duration)
                    .foregroundColor(.gray)
                    .font(.caption)
                    .fontDesign(.rounded)
                    .fontWeight(.medium)
            }
            .foregroundColor(.white)
            Text(name)
                .foregroundColor(.white)
                .font(.callout)
                .fontDesign(.rounded)
                .fontWeight(.medium)
        }
        .padding()
    }
}

