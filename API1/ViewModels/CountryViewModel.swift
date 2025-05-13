import Foundation

@MainActor
final class CountryViewModel: ObservableObject {
    @Published var countries: [Country] = []
    
    private let service = CountryService()
    
    //APIから国データを取得して公開する
    func loadCountries() async {
        do {
            let result = try await service.fetchCountries()
            self.countries = result
        } catch {
            print("エラー: \(error)")
        }
    }
}
