//
//  Navigator.swift
//  BitUncle
//
//  Created by Eugène Peschard on 14/02/2019.
//  Copyright © 2019 pesch.app All rights reserved.
//

protocol Navigator: Navigable {
    func show(_ Navigable: Navigable, sender: Any?)
    func showDetail(_ Navigable: Navigable, sender: Any?)
    func present(_ Navigable: Navigable, completion: Completion?)
    func dismiss(completion: Completion?)    
}
