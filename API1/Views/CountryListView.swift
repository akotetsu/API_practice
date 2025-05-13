import SwiftUI

struct CountryListView: View {
    @StateObject private var viewModel = CountryViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.countries) { country in
                NavigationLink(destination: CountryDetailView(country: country)) {
                    Text(country.name.common)
                }
            }
            .navigationTitle("Countries")
            .task { //View表示時に非同期処理を実行
                await viewModel.loadCountries()
            }
        }
    }
}

#Preview {
    CountryListView()
}
