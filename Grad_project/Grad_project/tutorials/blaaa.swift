//
//  blaaa.swift
//  Grad_project
//
//  Created by Amalie Morch on 01/05/2023.
//

//@EnvironmentalObject; perf if you want to reference something across different screens
// add to background of hiarchy and then all views in hiarchy will have access to object
// use environmentObject sparingly as it gets confusing -> use StateObject and ObservedObject instead

import SwiftUI

// if this was homeview it would be called HomeViewModel
// all data is within this class

class EnvironmentViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    // when viewmodel is created, init function is called
    init() {
        getData()
    }
    
    func getData() {
        self.dataArray.append(contentsOf: ["iphone", "ipad", "mac", "apple watch"])
    }
}
struct blaaa: View {
    
    // creating new enviornmentviewmodel and initialising it  
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink(
                        destination: DetailView(selectedItem: item),
                        label: {
                            Text(item)
                        })
                    
                }
            }
        }
        // what was a @StateObject var viewModel is passed into Environment so all view in hiarchy has access - all subviews that derive from navigationstack here, have access to viewModel
        .environmentObject(viewModel )
    }
}

struct DetailView: View {
    
    let selectedItem: String
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            NavigationLink(destination: FinalView(),
                           label: {
                Text(selectedItem)
                    .foregroundColor(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            })

        }
       
    }
    
}

struct FinalView: View {
    
    // no need for ObservedObject anymore, so we pass it into an EnvironmentObject
    // code will crash if there is no envioronmentObject
    @EnvironmentObject var viewModel: EnvironmentViewModel

    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                        Text(item)
                    }
                }
                .foregroundColor(.white)
            }
            
        }
    }
    
}

struct blaaa_Previews: PreviewProvider {
    static var previews: some View {
        blaaa()
    }
}
