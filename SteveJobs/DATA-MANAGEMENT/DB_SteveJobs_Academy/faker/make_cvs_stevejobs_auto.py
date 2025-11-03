"""
make_csv_stevejobs_auto.py 
-----------------------------------
Generatore CSV per stevejobs con Faker
- Province: Palermo, Catania
- City: Palermo, Catania, Caltagirone
- ModuleName: 5 tipi specifici di corsi
- FormativeUnit: 12 materie specifiche
- Password hashate con bcrypt
- Relazioni complete Student-Course tramite Enrollment

Requisiti: pip install Faker python-dateutil bcrypt
"""

import csv
import random
from pathlib import Path
from datetime import date, datetime, timedelta
from dateutil.relativedelta import relativedelta
from faker import Faker
import bcrypt

fake = Faker("it_IT")

# ============================================
# PARAMETRI DI CONFIGURAZIONE
# ============================================

N_TUTORS = 15                # Numero di tutor
N_TEACHERS_PER_MODULE = 8    # Teacher per ogni tipo di modulo (5 tipi × 8 = 40)
N_STUDENTS = 500             # Numero totale di studenti
MIN_STUDENTS_PER_COURSE = 15 # Minimo studenti per corso
MAX_STUDENTS_PER_COURSE = 30 # Massimo studenti per corso
MIN_COURSES_PER_MODULE = 1   # Minimo corsi per ogni ModuleName
MAX_COURSES_PER_MODULE = 35  # Massimo corsi per ogni ModuleName

RANDOM_SEED = 42
START_YEAR = 2019
CURRENT_YEAR = 2025

# Inizializzazione
random.seed(RANDOM_SEED)
Faker.seed(RANDOM_SEED)

# ============================================
# DATI FISSI
# ============================================

# Province e Città siciliane (solo le 3 sedi)
PROVINCES_DATA = [
    {"ProvinceID": 1, "ProvinceName": "Palermo"},
    {"ProvinceID": 2, "ProvinceName": "Catania"},
]

CITIES_DATA = [
    {"CityID": 1, "ProvinceID": 1, "CityName": "Palermo"},
    {"CityID": 2, "ProvinceID": 2, "CityName": "Catania"},
    {"CityID": 3, "ProvinceID": 2, "CityName": "Caltagirone"},
]

# Stati dei moduli
MODULE_STATES = [
    {"ModuleStateID": 1, "State": "In corso"},
    {"ModuleStateID": 2, "State": "Completato"},
]

# Nomi dei moduli (corsi)
MODULE_NAMES = [
    "Web Developer AI",
    "Industry 4.0",
    "Web e Cybersecurity",
    "Digital Media Design",
    "Web and Mobile Development"
]

# Unità formative (materie) - tutte 1800 ore totali
FORMATIVE_UNITS = [
    "Matematica",
    "Sicurezza sul lavoro",
    "React",
    "Angular",
    "Cloud computing",
    "Data Analysis",
    "Data Management",
    "Sistemi di versioning",
    "PHP",
    "Inglese",
    "Legislazione di settore",
    "Web Architecture & Backend"
]

# ============================================
# UTILITY FUNCTIONS
# ============================================

def ts_outdir(base="csv_out"):
    """Crea cartella output con timestamp"""
    t = datetime.now().strftime("%Y%m%d_%H%M%S")
    p = Path(base) / f"stevejobs_{t}"
    p.mkdir(parents=True, exist_ok=True)
    return p


def daterange(start: date, end: date) -> date:
    """Restituisce data casuale tra start e end"""
    if start > end:
        start, end = end, start
    delta = (end - start).days
    if delta == 0:
        return start
    return start + timedelta(days=random.randint(0, delta))


def write_csv(path, fieldnames, rows):
    """Scrive CSV gestendo date e NULL"""
    with open(path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fieldnames)
        w.writeheader()
        for r in rows:
            out = {}
            for k, v in r.items():
                if hasattr(v, "isoformat"):
                    out[k] = v.isoformat()
                elif v is None:
                    out[k] = "NULL"
                else:
                    out[k] = v
            w.writerow(out)


def hash_password(password: str) -> str:
    """Genera hash bcrypt della password con rounds=4 per velocità"""
    return bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(rounds=4)).decode('utf-8')


def random_birthdate(min_age=18, max_age=35):
    """Genera data di nascita per età tra min_age e max_age"""
    today = date.today()
    age = random.randint(min_age, max_age)
    birth_year = today.year - age
    return date(birth_year, random.randint(1, 12), random.randint(1, 28))


def school_year_string(start_year):
    """Genera stringa anno scolastico (es: 2023/2024) - SEMPRE 1 ANNO"""
    return f"{start_year}/{start_year + 1}"


# ============================================
# GENERATORI DATI
# ============================================

def gen_provinces():
    """Genera province (dati fissi)"""
    return [
        {**p, "IsDeleted": 0}
        for p in PROVINCES_DATA
    ]


def gen_cities():
    """Genera città (dati fissi)"""
    return [
        {**c, "IsDeleted": 0}
        for c in CITIES_DATA
    ]


def gen_module_states():
    """Genera stati moduli (dati fissi)"""
    return [
        {**ms, "IsDeleted": 0}
        for ms in MODULE_STATES
    ]


def gen_formative_units():
    """Genera unità formative (materie)"""
    units = []
    for i, unit_name in enumerate(FORMATIVE_UNITS, 1):
        # Tutte con 1800 ore totali, remainder casuale
        remainder = random.randint(0, 1800)
        # Distribuzione: 40% completate (0), 60% in corso (100-1500)
        if random.random() < 0.4:
            remainder = 0
        else:
            remainder = random.randint(100, 1500)
        
        units.append({
            "FormativeUnitID": i,
            "UnitName": unit_name,
            "TotalHour": 1800,
            "RemainderHour": remainder,
            "IsDeleted": 0,
        })
    return units


def gen_userinfo(n_total):
    """Genera utenti (base per student, teacher, tutor)"""
    users = []
    city_ids = [c["CityID"] for c in CITIES_DATA]
    
    for i in range(1, n_total + 1):
        users.append({
            "UserInfoID": i,
            "CityID": random.choice(city_ids),
            "FirstName": fake.first_name()[:100],
            "LastName": fake.last_name()[:100],
            "BirthDate": random_birthdate(18, 35),
            "Email": fake.unique.email()[:255],
            "PhoneNumber": fake.phone_number()[:20] if random.random() < 0.8 else None,
            "Password": hash_password(fake.password(length=12)),
            "IsDeleted": 0,
        })
    return users


def gen_locations():
    """Genera location per ogni città"""
    locations = []
    postcodes = {
        "Palermo": "90100",
        "Catania": "95100",
        "Caltagirone": "95041"
    }
    
    for i, city in enumerate(CITIES_DATA, 1):
        created = date(START_YEAR, random.randint(1, 12), random.randint(1, 28))
        updated = created + relativedelta(months=random.randint(1, 36))
        
        locations.append({
            "LocationID": i,
            "CityID": city["CityID"],
            "LocationName": city["CityName"],
            "PostCode": postcodes[city["CityName"]],
            "Street": fake.street_address()[:200],
            "PhoneNumber": fake.phone_number()[:20],
            "CreatedAt": created,
            "UpdatedAt": updated,
            "IsDeleted": 0,
        })
    return locations


def gen_students(users, n_students):
    """Genera studenti (primi N utenti)"""
    students = []
    for i in range(1, n_students + 1):
        students.append({
            "StudentID": i,
            "UserInfoID": i,
            "IsDeleted": 0,
        })
    return students


def gen_tutors(users, n_students, n_tutors):
    """Genera tutor (utenti dopo students)"""
    tutors = []
    start_id = n_students + 1
    for i in range(1, n_tutors + 1):
        tutors.append({
            "TutorID": i,
            "UserInfoID": start_id + i - 1,
            "IsDeleted": 0,
        })
    return tutors


def gen_teachers(users, n_students, n_tutors):
    """Genera teacher (5 ModuleName × 3 teacher = 15)"""
    teachers = []
    start_id = n_students + n_tutors + 1
    n_teachers = len(MODULE_NAMES) * N_TEACHERS_PER_MODULE
    
    for i in range(1, n_teachers + 1):
        teachers.append({
            "TeacherID": i,
            "UserInfoID": start_id + i - 1,
            "IsDeleted": 0,
        })
    return teachers


def gen_courses(tutors, locations):
    """Genera corsi (1-35 per ogni ModuleName) - DURATA 1 ANNO"""
    courses = []
    course_id = 1
    tutor_ids = [t["TutorID"] for t in tutors]
    location_ids = [l["LocationID"] for l in locations]
    
    for module_name in MODULE_NAMES:
        n_courses = random.randint(MIN_COURSES_PER_MODULE, MAX_COURSES_PER_MODULE)
        
        for _ in range(n_courses):
            # Anno di inizio casuale tra START_YEAR e CURRENT_YEAR-1 (per avere corso di 1 anno)
            start_year = random.randint(START_YEAR, CURRENT_YEAR - 1)
            school_year = school_year_string(start_year)  # Es: 2023/2024
            
            # CreatedAt: primo giorno dell'anno scolastico (settembre)
            created = date(start_year, 9, random.randint(1, 15))
            # UpdatedAt: durante l'anno (max giugno anno successivo)
            updated = date(start_year + 1, random.randint(1, 6), random.randint(1, 28))
            
            courses.append({
                "CourseID": course_id,
                "TutorID": random.choice(tutor_ids),
                "LocationID": random.choice(location_ids),
                "TotalHour": 1800,
                "SchoolYear": school_year,
                "CreatedAt": created,
                "UpdatedAt": updated,
                "IsDeleted": 0,
                "_ModuleName": module_name,  # Campo helper (non nel DB)
            })
            course_id += 1
    
    return courses


def gen_enrollments(students, courses):
    """Genera iscrizioni studenti ai corsi (max 30 per corso)"""
    enrollments = []
    enrollment_id = 1
    student_ids = [s["StudentID"] for s in students]
    
    # Raggruppa corsi per anno scolastico
    courses_by_year = {}
    for course in courses:
        year = course["SchoolYear"]
        if year not in courses_by_year:
            courses_by_year[year] = []
        courses_by_year[year].append(course)
    
    # Traccia studenti già iscritti per anno
    student_enrollments = {sid: [] for sid in student_ids}
    
    for course in courses:
        # Numero studenti per questo corso
        n_students_course = random.randint(MIN_STUDENTS_PER_COURSE, MAX_STUDENTS_PER_COURSE)
        
        # Seleziona studenti disponibili per questo anno
        available_students = [
            sid for sid in student_ids
            if course["SchoolYear"] not in student_enrollments[sid]
        ]
        
        if len(available_students) < n_students_course:
            selected = available_students
        else:
            selected = random.sample(available_students, n_students_course)
        
        for student_id in selected:
            # Data iscrizione: poco prima dell'inizio corso
            enrollment_date = course["CreatedAt"] - timedelta(days=random.randint(1, 30))
            
            # Completion date: 80% completati, 20% in corso
            if random.random() < 0.8:
                completion_date = course["UpdatedAt"] + timedelta(days=random.randint(1, 180))
            else:
                completion_date = None
            
            enrollments.append({
                "EnrollmentID": enrollment_id,
                "StudentID": student_id,
                "CourseID": course["CourseID"],
                "EnrollmentDate": enrollment_date,
                "CompletionDate": completion_date,
                "IsDeleted": 0,
            })
            
            # Segna studente come iscritto per questo anno
            student_enrollments[student_id].append(course["SchoolYear"])
            enrollment_id += 1
    
    return enrollments


def gen_modules(teachers, formative_units, courses, module_states):
    """Genera moduli (materie) per ogni corso"""
    modules = []
    module_id = 1
    
    # Assegna teacher a ModuleName
    teacher_ids = [t["TeacherID"] for t in teachers]
    teacher_by_module = {}
    for i, module_name in enumerate(MODULE_NAMES):
        start_idx = i * N_TEACHERS_PER_MODULE
        teacher_by_module[module_name] = teacher_ids[start_idx:start_idx + N_TEACHERS_PER_MODULE]
    
    formative_unit_ids = [fu["FormativeUnitID"] for fu in formative_units]
    
    for course in courses:
        module_name = course["_ModuleName"]
        available_teachers = teacher_by_module[module_name]
        
        # Ogni corso ha 3-6 materie diverse
        n_subjects = random.randint(3, 6)
        selected_units = random.sample(formative_unit_ids, n_subjects)
        
        for unit_id in selected_units:
            # StartDate: dopo CreatedAt del corso
            start_date = course["CreatedAt"] + timedelta(days=random.randint(1, 90))
            
            # EndDate: 70% completati (con data), 30% in corso (NULL)
            if random.random() < 0.7:
                end_date = start_date + timedelta(days=random.randint(30, 180))
                state_id = 2  # Completato
            else:
                end_date = None
                state_id = 1  # In corso
            
            modules.append({
                "ModuleID": module_id,
                "TeacherID": random.choice(available_teachers),
                "FormativeUnitID": unit_id,
                "ModuleStateID": state_id,
                "CourseID": course["CourseID"],
                "ModuleName": module_name,
                "StartDate": start_date,
                "EndDate": end_date,
                "IsDeleted": 0,
            })
            module_id += 1
    
    return modules


def gen_votes(enrollments, modules):
    """Genera voti per studenti iscritti ai corsi"""
    votes = []
    vote_id = 1
    
    # Raggruppa moduli per corso
    modules_by_course = {}
    for module in modules:
        course_id = module["CourseID"]
        if course_id not in modules_by_course:
            modules_by_course[course_id] = []
        modules_by_course[course_id].append(module)
    
    for enrollment in enrollments:
        student_id = enrollment["StudentID"]
        course_id = enrollment["CourseID"]
        
        # Ottieni moduli di questo corso
        course_modules = modules_by_course.get(course_id, [])
        
        for module in course_modules:
            # Solo moduli completati possono avere voti
            if module["ModuleStateID"] == 2:  # Completato
                # 90% hanno voti, 10% non ancora valutati
                if random.random() < 0.9:
                    first_vote = random.randint(1, 10)
                    second_vote = random.randint(1, 10)
                    final_vote = round((first_vote + second_vote) / 2, 1)
                    
                    votes.append({
                        "VoteID": vote_id,
                        "StudentID": student_id,
                        "ModuleID": module["ModuleID"],
                        "FirstVote": first_vote,
                        "SecondVote": second_vote,
                        "FinalVote": final_vote,
                        "IsDeleted": 0,
                    })
                    vote_id += 1
            else:
                # Modulo in corso: 30% hanno solo primo voto
                if random.random() < 0.3:
                    first_vote = random.randint(1, 10)
                    
                    votes.append({
                        "VoteID": vote_id,
                        "StudentID": student_id,
                        "ModuleID": module["ModuleID"],
                        "FirstVote": first_vote,
                        "SecondVote": None,
                        "FinalVote": None,
                        "IsDeleted": 0,
                    })
                    vote_id += 1
    
    return votes


# ============================================
# MAIN
# ============================================

def main():
    outdir = ts_outdir()
    
    # FASE 1: Dati base (no FK)
    provinces = gen_provinces()
    cities = gen_cities()
    module_states = gen_module_states()
    formative_units = gen_formative_units()
    
    # FASE 2: Utenti e location
    n_total_users = N_STUDENTS + N_TUTORS + (len(MODULE_NAMES) * N_TEACHERS_PER_MODULE)
    users = gen_userinfo(n_total_users)
    locations = gen_locations()
    
    # FASE 3: Student, Teacher, Tutor
    students = gen_students(users, N_STUDENTS)
    tutors = gen_tutors(users, N_STUDENTS, N_TUTORS)
    n_teachers = len(MODULE_NAMES) * N_TEACHERS_PER_MODULE
    teachers = gen_teachers(users, N_STUDENTS, N_TUTORS)
    
    # FASE 4: Corsi
    courses = gen_courses(tutors, locations)
    enrollments = gen_enrollments(students, courses)
    
    # FASE 5: Moduli e voti
    modules = gen_modules(teachers, formative_units, courses, module_states)
    votes = gen_votes(enrollments, modules)
    
    # SCRITTURA CSV
    write_csv(outdir / "Province.csv", ["ProvinceID", "ProvinceName", "IsDeleted"], provinces)
    
    write_csv(outdir / "City.csv", ["CityID", "ProvinceID", "CityName", "IsDeleted"], cities)
    
    write_csv(outdir / "ModuleState.csv", ["ModuleStateID", "State", "IsDeleted"], module_states)
    
    write_csv(outdir / "FormativeUnit.csv", 
              ["FormativeUnitID", "UnitName", "TotalHour", "RemainderHour", "IsDeleted"], 
              formative_units)
    
    write_csv(outdir / "UserInfo.csv", 
              ["UserInfoID", "CityID", "FirstName", "LastName", "BirthDate", 
               "Email", "PhoneNumber", "Password", "IsDeleted"], 
              users)
    
    write_csv(outdir / "Location.csv", 
              ["LocationID", "CityID", "LocationName", "PostCode", "Street", 
               "PhoneNumber", "CreatedAt", "UpdatedAt", "IsDeleted"], 
              locations)
    
    write_csv(outdir / "Student.csv", ["StudentID", "UserInfoID", "IsDeleted"], students)
    
    write_csv(outdir / "Tutor.csv", ["TutorID", "UserInfoID", "IsDeleted"], tutors)
    
    write_csv(outdir / "Teacher.csv", ["TeacherID", "UserInfoID", "IsDeleted"], teachers)
    
    # Rimuovi campo helper _ModuleName prima di scrivere
    courses_clean = [{k: v for k, v in c.items() if k != "_ModuleName"} for c in courses]
    write_csv(outdir / "Course.csv", 
              ["CourseID", "TutorID", "LocationID", "TotalHour", 
               "SchoolYear", "CreatedAt", "UpdatedAt", "IsDeleted"], 
              courses_clean)
    
    write_csv(outdir / "Enrollment.csv", 
              ["EnrollmentID", "StudentID", "CourseID", "EnrollmentDate", 
               "CompletionDate", "IsDeleted"], 
              enrollments)
    
    write_csv(outdir / "Module.csv", 
              ["ModuleID", "TeacherID", "FormativeUnitID", "ModuleStateID", 
               "CourseID", "ModuleName", "StartDate", "EndDate", "IsDeleted"], 
              modules)
    
    write_csv(outdir / "Vote.csv", 
              ["VoteID", "StudentID", "ModuleID", "FirstVote", 
               "SecondVote", "FinalVote", "IsDeleted"], 
              votes)
    
    # File ordine import
    with open(outdir / "_IMPORT_ORDER.txt", "w", encoding="utf-8") as f:
        f.write("=" * 70 + "\n")
        f.write("ORDINE CONSIGLIATO DI IMPORT PER stevejobs\n")
        f.write("=" * 70 + "\n\n")
        f.write("IMPORTANTE: Importa i file CSV in phpMyAdmin nell'ordine seguente\n")
        f.write("per evitare conflitti con le Foreign Key.\n\n")
        f.write("FASE 1 - Tabelle senza/con poche Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("1. Province.csv\n")
        f.write("2. City.csv            (dipende da Province)\n")
        f.write("3. ModuleState.csv\n")
        f.write("4. FormativeUnit.csv\n")
        f.write("5. UserInfo.csv        (dipende da City)\n")
        f.write("6. Location.csv        (dipende da City)\n\n")
        f.write("FASE 2 - Tabelle con FK a UserInfo:\n")
        f.write("-" * 70 + "\n")
        f.write("7. Student.csv         (dipende da UserInfo)\n")
        f.write("8. Tutor.csv           (dipende da UserInfo)\n")
        f.write("9. Teacher.csv         (dipende da UserInfo)\n\n")
        f.write("FASE 3 - Corsi e relazioni:\n")
        f.write("-" * 70 + "\n")
        f.write("10. Course.csv         (dipende da Tutor, Location)\n")
        f.write("11. Enrollment.csv     (dipende da Student, Course)\n")
        f.write("12. Module.csv         (dipende da Teacher, FormativeUnit, ModuleState, Course)\n")
        f.write("13. Vote.csv           (dipende da Student, Module)\n\n")
        f.write("=" * 70 + "\n")
        f.write("NOTE IMPORTANTI:\n")
        f.write("-" * 70 + "\n")
        f.write("- Le password sono già hashate con bcrypt\n")
        f.write("- I valori 'NULL' nei CSV devono essere interpretati come NULL SQL\n")
        f.write("- Ogni studente può iscriversi a massimo 1 corso per anno scolastico\n")
        f.write("- I corsi hanno tra 15 e 30 studenti\n")
        f.write("- I voti FinalVote sono la media di FirstVote e SecondVote\n")
        f.write("=" * 70 + "\n")


if __name__ == "__main__":
    try:
        main()
        print("✓ Script completato con successo!")
    except Exception as e:
        print(f"✗ ERRORE: {e}")
        import traceback
        traceback.print_exc()