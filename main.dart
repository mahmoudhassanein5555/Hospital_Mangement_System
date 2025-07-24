import 'dart:io';

class Doctor {
  String? name;
  String? specialty;
  double? from;
  double? to;
}

class Sick {
  String? name;
  int? age;
  int? id;
  String? disease;
  String? doctor;
  bool? admitted;
}

class Appointment {
  String? doctor_name;
  String? patient_name;
  String? date;
  double? time;
}

void main() {
  List<Doctor> doctors = [];
  List<Sick> sick = [];
  List<Appointment> appointments = [];
  print('''
********** HOSPITAL SYSTEM **********

1. 🩺  Add a new doctor
2. 🧑‍⚕️  Add a new patient
3. 📅  Book an appointment
4. 📋  Show all doctors
5. 🗂️  Show all patients
6. 🔍  Search for a doctor
7. 🔎  Search for a patient
8. 🏥  Show patients by department
9. 🛌  Show admitted patients only
0. ❌  Exit

**************************************
👉 Please enter your choice:
''');
  while (true) {
    int? choice = int.parse(stdin.readLineSync()!);
    switch (choice) {
      case 1:
        print("🩺  Add a new doctor");
        Doctor newdoctor = Doctor();
        print("pls Enter the name of the doctor ");
        newdoctor.name = stdin.readLineSync()!;

        print("pls Enter the Specialty of the doctor ");
        newdoctor.specialty = stdin.readLineSync()!;

        print("pls Enter available time (From):");
        newdoctor.from = double.parse(stdin.readLineSync()!);

        print("pls Enter available time (To):");
        newdoctor.to = double.parse(stdin.readLineSync()!);

        doctors.add(newdoctor);
        print("✅ Doctor added successfully!\n");
        break;

      case 2:
        print("🧑‍⚕️  Add a new patient ");
        Sick newpatient = Sick();
        print("pls Enter the name of the patient ");
        newpatient.name = stdin.readLineSync()!;

        print("pls Enter the age of the patient ");
        newpatient.age = int.parse(stdin.readLineSync()!);

        print("Pls Enter the Disease");
        newpatient.disease = stdin.readLineSync()!;

        print("Pls Enter name of The doctor who follows up with the patient ");
        newpatient.doctor = stdin.readLineSync()!;

        print("pls enter the ID ");
        newpatient.id = int.parse(stdin.readLineSync()!);

        print("Pls Enter if the patient is admitted or not ");
        print("pls Enter (true) or (false)");
        newpatient.admitted = bool.parse(stdin.readLineSync()!);
        if (newpatient.admitted == true) {
          sick.add(newpatient);
          print("✅ Patient added successfully!\n");
        } else
          print("❌ He wasn't admitted to the hospital ");

        break;

      case 3:
        print("📅  Book an appointment ");
        Appointment app = Appointment(); // object
        print("pls Enter the Doctor Name ");
        app.doctor_name = stdin.readLineSync()!;
        bool found = false;
        while (!found) {
          // if found = true , the while loop dosn't work.
          for (var docname in doctors) {
            if (docname.name == app.doctor_name) {
              found = true;
              break;
            }
          }
          if (!found) {
            // if found = true , the if () dosn't work.
            print("❌ Doctor not found.");
            print("Please re-enter the doctor name:");
            app.doctor_name = stdin.readLineSync()!;
          }
        }

        print("pls Enter the Patient Name ");
        app.patient_name = stdin.readLineSync()!;
        bool p_found = false;
        while (!p_found) {
          // if found = true , the while loop dosn't work.
          for (var paname in sick) {
            if (paname.name == app.patient_name) {
              p_found = true;
              break;
            }
          }
          if (!p_found) {
            // if found = true , the if () dosn't work.
            print("❌ Patient not found.");
            print("Please re-enter the patient name:");
            app.patient_name = stdin.readLineSync()!;
          }
        }

        print("pls Enter the Appointment Date ");
        app.date = stdin.readLineSync()!;

        print("pls Enter the Appointment Time ");
        app.time = double.parse(stdin.readLineSync()!);

        appointments.add(app);
        print("✅ Appointment booked successfully!");

        break;

      case 4:
        print("📋  Show all doctors");
        if (doctors.isEmpty) {
          print("⚠️ No Doctors found.");
        } else {
          for (var doc in doctors) {
            print("===============================");
            print("👨‍⚕️ Name: ${doc.name} ");
            print("🩺 Specialty: ${doc.specialty} ");
            print("⏰ Time: From ${doc.from} To ${doc.to} ");
          }
          print("===============================");
        }
        break;

      case 5:
        print("🗂️  Show all patients");
        if (sick.isEmpty) {
          print("⚠️ No patients found.");
        } else {
          for (var pat in sick) {
            print("===============================");
            print("🧑‍🦽 Name: ${pat.name}");
            print("🎂 Age: ${pat.age}");
            print("🤒 Disease: ${pat.disease}");
            print("🩺 Doctor: ${pat.doctor}");
            print("📌 ID: ${pat.id}");
          }
          print("===============================");
        }
        break;
      case 6:
        print("🔍  Search for a doctor");
        print("pls Enter The Name of The Doctor");
        String? doc_name = stdin.readLineSync()!;
        bool found = false;
        while (!found) {
          for (var doc in doctors) {
            if (doc.name == doc_name) {
              print("✅ Doctor found:");
              print("👨‍⚕️ Name: ${doc.name}");
              print("🩺 Specialty: ${doc.specialty}");
              print("⏰ Time: From ${doc.from} To ${doc.to}");
              found = true;
              break;
            }
          }
          if (!found) {
            print("❌ Doctor not found.");
          }
        }
        break;

      case 7:
        print("🔎  Search for a patient");
        print("pls Enter The Name of The patient");
        String? patient_name = stdin.readLineSync()!;
        bool found = false;
        while (!found) {
          for (var pat in sick) {
            if (pat.name == patient_name) {
              print("===============================");
              print("🧑‍🦽 Name: ${pat.name}");
              print("🎂 Age: ${pat.age}");
              print("🤒 Disease: ${pat.disease}");
              print("🩺 Doctor: ${pat.doctor}");
              print("📌 ID: ${pat.id}");
              found = true;
              break;
            }
          }
          if (!found) {
            print("❌ Doctor not found.");
          }
        }
        break;

      case 8:
        print("🏥  Show patients by department");
        print("pls Enter the department (specialty) to show its patients:");
        String department = stdin.readLineSync()!;
        try {
          var doctor = doctors.firstWhere((d) => d.specialty == department);
          for (var pat in sick) {
            if (pat.doctor == doctor.name) {
              print("===============================");
              print("🧑‍🦽 Name: ${pat.name}");
              print("🎂 Age: ${pat.age}");
              print("🤒 Disease: ${pat.disease}");
              print("📌 ID: ${pat.id}");
            }
          }
          print("===============================");
        } catch (error) {
          print("❌ No doctor found with this specialty.");
        }
        break;

      case 9:
        print("🛌  Show admitted patients only ");
        print("pls Enter the ID of The Patient");
        int? ID = int.parse(stdin.readLineSync()!);
        try {
          var pat_id = sick.firstWhere((id) => ID == id.id);
          print("✅ The patient is currently admitted");
          print("🧑‍🦽 Name: ${pat_id.name}");
          print("🎂 Age: ${pat_id.age}");
          print("🤒 Disease: ${pat_id.disease}");
          print("🩺 Doctor: ${pat_id.doctor}");
          print("📌 ID: ${pat_id.id}");
        } catch (error) {
          print("the patient wasn't admitted to the hospital");
        }
        break;
      case 0:
        print("👋 Thank you for using the Hospital System. Goodbye!");
        exit(0);
      default:
        print("❗ Invalid choice. Please try again.");
    }
  }
}
