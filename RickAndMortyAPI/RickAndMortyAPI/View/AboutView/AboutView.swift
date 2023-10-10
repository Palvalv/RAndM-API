//
//  AboutView.swift
//  RickAndMortyAPI
//
//  Created by Pablo Álvarez on 10/10/23.
//

import SwiftUI

/**
 Define una vista que muestra información sobre la aplicación y el perfil del desarrollador.
 La vista utiliza un control de selección (Picker) para cambiar entre las secciones de información de la aplicación y el perfil del desarrollador.
 La vista tiene un fondo semi-transparente y una imagen de fondo que crea un aspecto visual atractivo.
 */
struct AboutView: View {
    @State var pickerView = ["App information", "Profile"]
    @State var pickerViewSelected = "App information"
    // Es el control de selección que se usará más adelante en la vista. Se establece el color de fondo cuando se selecciona una opción y el color del texto de las opciones seleccionadas y no seleccionadas.
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(.darkBlueBackground)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor(.darkBlueBackground)], for: .normal)
    }
    
    var body: some View {
                ScrollView {
                    VStack(spacing: 32) {
                        VStack {
                            Image("Me")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 140)
                                .clipShape(Circle())
                            
                            Text(NSLocalizedString("view.profile.name", comment: ""))
                                .font(.title)
                            Text(NSLocalizedString("view.profile.role", comment: ""))
                            
                        }
                        
                        Picker("pickerViewSelected", selection: $pickerViewSelected) {
                            ForEach(pickerView, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.segmented)
                        .background(.white.opacity(0.6))
                        .cornerRadius(6)
                    }
                    
                    VStack() {
                        VStack() {
                            if pickerViewSelected == "App information" {
                                AppInfoView()
                            } else {
                                ProfileView()
                            }
                            
                            Spacer()
                        }
                    }

        }
        .foregroundColor(.white)
        .background(.black.opacity(0.6))
        .background(
            Image("Stars")
                .renderingMode(.original)
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
        )
    }
}


struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
