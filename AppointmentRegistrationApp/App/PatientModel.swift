//
//  PatientModel.swift
//  LAAOeligibilitytoolFINAL
//
//  Created by Gregory Casey (GPCASE2975) on 3/3/18.
//  Copyright © 2018 Gregory Casey (GPCASE2975). All rights reserved.
//

import Foundation

class PatientModel
{
    var patientlist: [ThePatient] = []
    
    func saveData(firstname: String, middlename : String, lastname: String, patientid: String, birthdate: String, ssn: String, sex: String)
    {
        let myContext = AppDelegate.context
        let patientItem = ThePatient(context: myContext)
        patientItem.firstname = firstname
        patientItem.middlename = middlename
        patientItem.lastname = lastname
        patientItem.patientid = patientid
        patientItem.birthdate = birthdate
        patientItem.ssn = ssn
        patientItem.sex = sex
        
        do{
            try AppDelegate.context.save()
            print("Patient Successfully Saved")
            
        }catch
        {
            print("Patient not saved")
        }
    }
    
    
    func getBacklogList()-> [ThePatient]
    {
        do {
            
            patientlist = try AppDelegate.context.fetch(ThePatient.fetchRequest())
            
        }
        catch
        {
            print("Fetching failed")
        }
        
        return patientlist
    }
    
}


