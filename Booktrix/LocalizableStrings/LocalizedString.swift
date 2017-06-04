//
//  ValidationMessages.swift
//  Booktrix
//
//  Created by Impresyjna on 17.05.2017.
//  Copyright © 2017 Impresyjna. All rights reserved.
//

import Foundation

struct LocalizedString {
    static let error = NSLocalizedString("booktrix.common.error", comment: "Error")
    static let ok = NSLocalizedString("booktrix.common.ok", comment: "OK")
    static let back = NSLocalizedString("booktrix.common.back", comment: "Back")
    static let edit = NSLocalizedString("booktrix.common.edit", comment: "Edit")
    static let delete = NSLocalizedString("booktrix.common.delete", comment: "Delete")
    static let save = NSLocalizedString("booktrix.common.save", comment: "Save")
    
    static let badRequest = NSLocalizedString("booktrix.http_error.bad_request", comment: "Bad request")
    static let notAuthorized = NSLocalizedString("booktrix.http_error.not_authorized", comment: "Not authorized")
    static let forbidden = NSLocalizedString("booktrix.http_error.forbidden", comment: "Forbidden request")
    static let notFound = NSLocalizedString("booktrix.http_error.not_found", comment: "Not found")
    static let unprocessable = NSLocalizedString("booktrix.http_error.unprocessable", comment: "Request cannot be processed")
    static let conflicted = NSLocalizedString("booktrix.http_error.conflicted", comment: "Request conflicted")
    static let serverError = NSLocalizedString("booktrix.http_error.server_error", comment: "Internal server error")
    static let unknown = NSLocalizedString("booktrix.http_error.unknown", comment: "Unknown")
}
