//
//  ProfileViewable.swift
//  BitUncle
//
//  Created by Eugène Peschard on 07/02/2019.
//  Copyright © 2019 Eugène Peschard. All rights reserved.
//

protocol ProfileViewable: class {
    var profile: Profile.DataModel? { get set }
    func showAlert(_ error: ApiError)
}