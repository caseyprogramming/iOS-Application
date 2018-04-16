//
//  ScheduleModel.swift
//  LAAOeligibilitytoolFINAL
//
//  Created by Gregory Casey (GPCASE2975) on 3/3/18.
//  Copyright © 2018 Gregory Casey (GPCASE2975). All rights reserved.
//

import Foundation

class ScheduleModel
{
    var scheduling: [Schedule] = []
    
    func saveSchedule(scheduleID: String, docname: String, date: Date)
    {
        let myContext = AppDelegate.context
        let scheduleItem = Schedule(context: myContext)
        scheduleItem.docname = docname
        scheduleItem.date = date
        scheduleItem.scheduleID = scheduleID
        
        do{
            try AppDelegate.context.save()
            print("Patient Successfully Saved")
        }
        catch {
            print("Patient not saved")
        }
    }
    
    
    func getBacklogSchedule()-> [Schedule]
    {
        do {
            scheduling = try AppDelegate.context.fetch(Schedule.fetchRequest())
        }
        catch{
            print("Fetching failed")
        }
        
        return scheduling
    }
    
}

