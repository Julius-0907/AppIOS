import SwiftUI

struct Inicio: View {
  
  // MARK: - Properties
  
  @State private var showMenu: Bool = false
  let carreras = ["ING nn sistemas", "Relaciones internacionales", "Comunicaciones", "Licenciatura en idiomas", "Psicologia"]
  
  // MARK: - View Body
    
    @ObservedObject var viewModel = CarreraViewModel()
  
  var body: some View {
    NavigationView {
      
      ZStack {
        
        VStack {
          Text("Carreras Destacadas")
            .font(.largeTitle)
            .foregroundColor(.black)
            .padding()
          
            List(viewModel.carreras) { carrera in
            /*NavigationLink(destination: CarreraDetailView(carrera: carrera)) {
              Text(carrera)
                .foregroundColor(.black)*/
                Text("\(carrera.nombre)")
            }
            /*List(viewModel.carreras){
                carrera in
                VStack(alignment: .leading){
                    Text(carrera.nombre)
                }
            }.onAppear{
                viewModel.fetchCarreras()
            }*/
          
          Spacer()
          
          Text("UTEC")
            .padding()
            .font(.title)
            .foregroundColor(.black)
        }.onAppear{
            self.viewModel.fetchCarreras()
        }
        
        GeometryReader { _ in
          
          HStack {
            Spacer()
            
            MenuList()
              .offset(x: showMenu ? 0 : UIScreen.main.bounds.width)
              .animation(.easeInOut(duration: 0.4), value: showMenu)
          }
          
        }
        .background(Color.black.opacity(showMenu ? 0.5 : 0))
        
      }
      
      .navigationTitle(" Menu ")
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        
        Button {
          self.showMenu.toggle()
        } label: {
          
          if showMenu {
            
            Image(systemName: "xmark")
              .font(.title)
              .foregroundColor(.red)
            
          } else {
            Image(systemName: "text.justify")
              .font(.title)
              .foregroundColor(.red)
          }
          
        }
      }
    }
  }
}

struct CarreraDetailView: View {
    var carrera: String
    
    var body: some View {
        Text("Información de la carrera: \(carrera)")
    }
}

struct InicioView_Previews: PreviewProvider {
  static var previews: some View {
    Inicio()  // Asegúrate de usar aquí el nombre correcto de la View que quieres previsualizar
  }
}

