//
//  ContentView.swift
//  test2
//
//  Created by user on 13/09/23.
//

import SwiftUI

struct Product:Identifiable{
    let id = UUID()
    let name: String
    let price: Double
    let imagename:String
}
let sampleProducts = [ Product(name: "Macbook", price: 999.99, imagename: "macbook"),Product(name: "Iphone", price: 500.99, imagename: "iphone"),Product(name: "Ipad", price: 120.99, imagename: "ipad"),Product(name: "Imac", price: 300.00, imagename: "imac")]
struct ProductTile: View{
    let product: Product
    var body:some View{
        VStack(alignment: .leading, spacing: 8){
            Image(product.imagename).resizable().aspectRatio(contentMode: .fit).frame(maxHeight: 150)
            Text(product.name).font(.headline)
            Text("$\(String(format: "%.2f",product.price))").font(.subheadline).foregroundColor(.secondary)
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius:4)
    }
    
}
struct ContentView : View {
    let columns:[GridItem] = [
        GridItem(.flexible(minimum:100, maximum: 200),spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200),spacing:16)
    ]
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(sampleProducts)
                    { product in
                        NavigationLink(destination: Productdetail(product: product)){
                             
                            ProductTile(product: product)
                        }
                    }
                }
            }
            .padding()
        }
        .navigationTitle("E-commerce Store App")
    }
}
struct Productdetail: View{
    let product:Product
    var body: some View{
        VStack{
            Image(product.imagename).resizable().aspectRatio(contentMode: .fit).frame(height: 300)
            Text(product.name).font(.title).padding()
            Text("Price:$\(String(format: "%.2f", product.price))").font(.headline).padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
