//
//  LocaleExtension.swift
//  weatherios
//
//  Created by Vlad Stanescu on 10.12.2020.
//

import Foundation

extension Locale {
    func isoCode(for countryName: String) -> String? {
        return Locale.isoRegionCodes.first(where: { (code) -> Bool in
            localizedString(forRegionCode: code)?.compare(countryName, options: [.caseInsensitive, .diacriticInsensitive]) == .orderedSame
        })
    }
}
