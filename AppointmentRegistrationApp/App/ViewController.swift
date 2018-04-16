//
//  ViewController.swift
//  LAAOeligibilitytoolFINAL
//
//  Created by Gregory Casey (GPCASE2975) on 3/3/18.
//  Copyright © 2018 Gregory Casey (GPCASE2975). All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    var patient: PatientModel = PatientModel()
    var schedule: ScheduleModel = ScheduleModel()
    var patientList: [ThePatient] = []
    var scheduling: [Schedule] = []
    
    //Patient Registration Fields
   
    @IBOutlet weak var Sex: UITextField!
    @IBOutlet weak var BirthDate: UITextField!
    
    @IBOutlet weak var PatientID: UITextField!
    @IBOutlet weak var SSN: UITextField!
    @IBOutlet weak var MiddleName: UITextField!
    @IBOutlet weak var FirstName: UITextField!
    @IBOutlet weak var LastName: UITextField!
    //LOOK
    //Patient Scheduling Fields
    @IBOutlet weak var pIDtxt: UITextField!
    @IBOutlet weak var docName: UITextField!
    @IBOutlet weak var appDate: UIDatePicker!
    
    
    @IBAction func touchSchedule(_ sender: UIButton) {
        schedule.saveSchedule(scheduleID: pIDtxt.text!, docname: docName.text!, date: appDate.date)
        print("Appointment saved")
    }
    
    
    //Patient Lookup Fields
    @IBOutlet weak var IDlookup: UITextField!
    /* label fields to change for patient information */
    @IBOutlet weak var IDtxt: UILabel!
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var DOBtxt: UILabel!
    @IBOutlet weak var SSNtxt: UILabel!
    @IBOutlet weak var sexTxt: UILabel!
    /* label fields to change for schedule information */
    @IBOutlet weak var docTxt: UILabel!
    @IBOutlet weak var dateTxt: UILabel!
    
    @IBAction func IDsearch(_ sender: UIButton) {
        
        patientList = patient.getBacklogList()
        scheduling = schedule.getBacklogSchedule()
        for everyone in patientList{
            if (IDlookup.text == everyone.patientid){
            
            print("WORK")
                IDtxt.text = everyone.patientid!
                nameTxt.text = everyone.firstname! + " " + everyone.middlename! + " " + everyone.lastname!
                DOBtxt.text = everyone.birthdate!
                SSNtxt.text = everyone.ssn!
                sexTxt.text = everyone.sex!
                
            }
        }
        /*
        for candidate in patientlist{
            if (IDlookup.text! == candidate.patientid){
                
                /* sets label field values on search */
                IDtxt.text = candidate.patientid!
                nameTxt.text = candidate.firstname! + " " + candidate.middlename! + " " + candidate.lastname!
                DOBtxt.text = candidate.birthdate!
                SSNtxt.text = candidate.ssn!
                sexTxt.text = candidate.sex!
            }
            print("something")
            
        }*/
        for schedule in scheduling {
            print("working")
            if (IDlookup.text! == schedule.scheduleID){
                docTxt.text = schedule.docname
                dateTxt.text = String(describing: schedule.date)
            }
        }
    }
    
    
    //Patient History Fields
    /* CHA2DS2-VASC fields */
    
    
    //Main App Functions
    
    @IBAction func reset(_ sender: UIButton) {
        /* clear registration text fields */
        Sex.text = ""
        BirthDate.text = ""
        PatientID.text = ""
        SSN.text = ""
        MiddleName.text = ""
        FirstName.text = ""
        LastName.text = ""
    }
    
    @IBAction func Register(_ sender: UIButton) {
        
        patientList = patient.getBacklogList()
         patient.saveData(firstname: FirstName.text!, middlename: MiddleName.text!, lastname: LastName.text!,patientid: PatientID.text!, birthdate: BirthDate.text!, ssn: SSN.text!, sex: Sex.text!)
        for candidate in patientList{
            
            if(PatientID.text! == candidate.patientid){
                
                print("already registered")
                break
                
            }
            else{
                
                print("Saving New Patient")
                patient.saveData(firstname: FirstName.text!, middlename: MiddleName.text!, lastname: LastName.text!,patientid: PatientID.text!, birthdate: BirthDate.text!, ssn: SSN.text!, sex: Sex.text!)
                break
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

