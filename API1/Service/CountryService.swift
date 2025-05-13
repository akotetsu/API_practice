import Foundation

final class CountryService {
    
    /// 国一覧を取得する関数
    func fetchCountries() async throws -> [Country] {
        // 1. APIのURLを定義
        guard let url = URL(string: "https://restcountries.com/v3.1/all") else {
            throw URLError(.badURL)
        }

        // 2. 非同期でデータ取得（URLSession）
        let (data, _) = try await URLSession.shared.data(from: url)

        // 3. JSONデコード
        let countries = try JSONDecoder().decode([Country].self, from: data)

        // 4. 呼び出し元にデータを返す
        return countries
    }
}
