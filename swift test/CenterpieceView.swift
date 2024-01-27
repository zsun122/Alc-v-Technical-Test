//
//  CenterpieceView.swift
//  swift test
//
//  Created by karen sun on 2024/1/26.
//

import SwiftUI
import SDWebImageSwiftUI


struct CenterpieceView: View {
    @State var presentSheet = false
    @State private var isLoading = true
    
    let furnitureURL = URL(string: "https://medleyhome.com/cdn/shop/files/Rio-Sofa-Collections-Page.jpg?v=1696955703&width=1400")!
    var selectedOptions: [String]
    var selectedRoomType: String
    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            ZStack{
                Color(hex: "#f2f2f7").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    
                    Image(systemName: "lamp.floor.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.mint)
                        .frame(width: 300, height: 200)
                    
                    Text("The \nCenterpiece")
                        .font(.custom("Helvetica", size: 40))
                        .padding()
                        .frame(width: 350, height: 150, alignment: .leading)
                        .bold()
                    
                    Text("A good centerpiece lorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus, odio ac sollicitudin feugiat. \n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. In maximus, odio ac solicitudin feugiat:\n\nThis could be a tip\n\nAnd this could be another tip")
                        .padding()
                        .foregroundColor(.gray)
                        .frame(width: 350, height: 300, alignment: .leading)
                    
                    
                    
                    Button("SWIPE FOR SUGGESTIONS") {
                        presentSheet = true
                    }.foregroundColor(.mint)
                }
                .sheet(isPresented: $presentSheet) {
                    
                    if isLoading {
                        Text("We’re generating room ensembles that you’ll be excited to lounge and binge watch your favorite tv show.").frame(width: 300, height: 200, alignment: .leading)
                        
                        
                        ProgressView()
                            .tint(.mint)
                            .scaleEffect(3)
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(width: 300, height: 30)
                            .onAppear {
                                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                                    isLoading = false
                                }
                            }
                        
                        
                        Text("Generating ensembles for you...").frame(width: 300, height: 300, alignment: .leading)
                        
                    } else {
                        Spacer()
                        Image(systemName:"house")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 150)
                            .foregroundColor(.mint)
                        
                        
                        
                        Spacer()
                        Text("Selected Room Type:")
                            .font(.headline)
                            .foregroundColor(.mint)
                        Text(" \(selectedRoomType)")
                            .bold()
                        
                        Text("You have selected:")
                            .font(.headline)
                            .foregroundColor(.mint)
                        ForEach(selectedOptions, id: \.self) { option in
                            Text(option)
                                .bold()
                        }
                        Spacer()
                        
                        
                        WebImage(url: furnitureURL)
                            .resizable()
                            .transition(.fade(duration: 0.5))
                            .scaledToFit()
                            .frame(width: 300, height: 200)
                            .cornerRadius(30)
                        Spacer()
                            .presentationDetents([.large, .large])
                    }
                }
                
                .navigationBarItems(
                    leading: NavigationLink(destination: RoomView(selectedOptions: selectedOptions, selectedRoomType: selectedRoomType).navigationBarHidden(true)) {
                        Image(systemName: "arrow.backward")
                    }
                )
            }
            
            
        }
    }
}
    
struct CenterpieceView_Previews: PreviewProvider {
    static var previews: some View {
        CenterpieceView(selectedOptions: ["Sleeping for one", "Lounging"], selectedRoomType: "Bedroom")
    }
}

