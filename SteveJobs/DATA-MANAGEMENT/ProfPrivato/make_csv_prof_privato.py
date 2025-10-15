"""
make_csv_prof_privato.py
-------------------------
Generatore CSV per il database prof_privato.
- Nessun parametro esterno: esegui `python make_csv_prof_privato.py`.
- Crea una cartella di output timestampata dentro `csv_out/`.
- Rispetta PK / FK e coerenze del database prof_privato.
Requisiti: pip install Faker python-dateutil
"""
# Import delle librerie necessarie
import csv
from pathlib import Path
import random
from datetime import date, datetime, timedelta
from dateutil.relativedelta import relativedelta
from faker import Faker

fake = Faker("it_IT")

# Parametri di configurazione per la quantità di dati da generare
N_STUDENTS = 80            # Numero di studenti
N_CATEGORIES = 8           # Numero di categorie (es. Scuola Media, Liceo, Università)
N_SUBJECTS = 15            # Numero di materie
N_PAYERS = 100             # Numero di paganti (può essere > studenti, genitori diversi)
N_PAYMENTS = 150           # Numero di pagamenti
N_LESSONS = 200            # Numero di lezioni

# Seed per la generazione casuale (riproducibilità)
RANDOM_SEED = 12345  # Cambia per dataset diversi
# Intervallo temporale
LESSONS_START = date.today() - relativedelta(months=6)
LESSONS_END   = date.today() + timedelta(days=30)  # Include lezioni future

# Inizializzazione Faker e random
fake = Faker("it_IT")
random.seed(RANDOM_SEED)
Faker.seed(RANDOM_SEED)


# Crea una cartella di output con timestamp
def ts_outdir(base="csv_out"):
    t = datetime.now().strftime("%Y%m%d_%H%M%S")
    p = Path(base) / f"prof_privato_{t}"
    p.mkdir(parents=True, exist_ok=True)
    return p


# Restituisce una data casuale tra start e end
def daterange(start: date, end: date) -> date:
    if start > end:
        start, end = end, start
    delta = (end - start).days
    return start + timedelta(days=random.randint(0, delta))


# Restituisce un orario casuale per le lezioni (es. 14:00 - 20:00)
def random_time():
    hour = random.choice([14, 15, 16, 17, 18, 19, 20])
    minute = random.choice([0, 30])
    return f"{hour:02d}:{minute:02d}:00"


# Scrive una lista di dizionari su file CSV, gestendo date e valori nulli
def write_csv(path, fieldnames, rows):
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


# Genera studenti
def gen_students(n):
    students = []
    cities = ["Padova", "Venezia", "Verona", "Vicenza", "Treviso", "Rovigo", "Belluno"]
    
    for i in range(1, n+1):
        students.append({
            "StudentID": i,
            "FirstName": fake.first_name()[:50],
            "LastName": fake.last_name()[:50],
            "Address": fake.street_address()[:100],
            "City": random.choice(cities)[:50],
            "PhoneNumber": fake.phone_number()[:20],
        })
    return students


# Genera categorie (es. Scuola Media, Liceo Scientifico, Università)
def gen_categories(n):
    base_categories = [
        ("Scuola Media", 15.00),
        ("Liceo Scientifico", 20.00),
        ("Liceo Classico", 20.00),
        ("Liceo Linguistico", 18.00),
        ("Istituto Tecnico", 18.00),
        ("Università - Materie Base", 25.00),
        ("Università - Materie Avanzate", 30.00),
        ("Preparazione Esami", 35.00),
        ("Recupero Debiti", 22.00),
        ("Lezione di Gruppo", 12.00),
    ]
    
    categories = []
    for i in range(1, n+1):
        if i <= len(base_categories):
            name, price = base_categories[i-1]
        else:
            name = f"Categoria {i}"
            price = round(random.uniform(15.0, 35.0), 2)
        
        categories.append({
            "CategoryID": i,
            "CategoryStudent": name[:50],
            "Price": price,
        })
    return categories


# Genera materie
def gen_subjects(n):
    base_subjects = [
        "Matematica", "Fisica", "Chimica", "Biologia",
        "Italiano", "Latino", "Greco", "Storia", "Filosofia",
        "Inglese", "Francese", "Spagnolo", "Tedesco",
        "Informatica", "Economia", "Diritto",
        "Scienze della Terra", "Arte", "Musica", "Educazione Fisica"
    ]
    
    subjects = []
    used = set()
    
    for i in range(1, n+1):
        if i <= len(base_subjects):
            name = base_subjects[i-1]
        else:
            name = random.choice(base_subjects) + f" Avanzata"
        
        while name in used:
            name = random.choice(base_subjects) + f" {random.randint(1, 99)}"
        used.add(name)
        
        subjects.append({
            "SubjectID": i,
            "SubjectName": name[:50],
        })
    return subjects


# Genera paganti (genitori o studenti stessi)
def gen_payers(n):
    payers = []
    cities = ["Padova", "Venezia", "Verona", "Vicenza", "Treviso", "Rovigo", "Belluno"]
    
    for i in range(1, n+1):
        
        payers.append({
            "PayerID": i,
            "FirstName": fake.first_name()[:50],
            "LastName": fake.last_name()[:50],
            "Address": fake.street_address()[:100],
            "City": random.choice(cities)[:50],
            "PhoneNumber": fake.phone_number()[:20],
            "Email": fake.unique.email()[:60],
        })
    return payers


# Genera pagamenti
def gen_payments(payers, n):
    payments = []
    payer_ids = [p["PayerID"] for p in payers]
    payment_methods = ["Contanti", "Bonifico", "PayPal", "Carta di Credito", "Satispay"]
    
    for i in range(1, n+1):
        payment_date = daterange(LESSONS_START, date.today())
        amount = round(random.uniform(15.0, 150.0), 2)  # Pagamenti da 15 a 150 euro
        
        payments.append({
            "PaymentID": i,
            "PayerID": random.choice(payer_ids),
            "Amount": amount,
            "PaymentMethod": random.choice(payment_methods)[:30],
            "PaymentDate": payment_date,
        })
    return payments


# Genera lezioni
def gen_lessons(students, subjects, payments, categories, n):
    lessons = []
    student_ids = [s["StudentID"] for s in students]
    subject_ids = [s["SubjectID"] for s in subjects]
    payment_ids = [p["PaymentID"] for p in payments]
    category_ids = [c["CategoryID"] for c in categories]
    lesson_types = ["Individuale", "Gruppo", "Online", "A Domicilio"]
    
    for i in range(1, n+1):
        lesson_date = daterange(LESSONS_START, LESSONS_END)
        
        # PaymentID può essere NULL (circa 30% non ancora pagate)
        payment = random.choice(payment_ids) if random.random() < 0.7 else None
        
        lessons.append({
            "LessonID": i,
            "StudentID": random.choice(student_ids),
            "SubjectID": random.choice(subject_ids),
            "PaymentID": payment,
            "CategoryID": random.choice(category_ids),
            "StartDate": lesson_date,
            "StartTime": random_time(),
            "LessonType": random.choice(lesson_types)[:30],
        })
    return lessons


# Funzione principale
def main():
    outdir = ts_outdir()
    
    print("Generazione dati in corso...")
    
    # FASE 1: Genera dati base (tabelle senza FK)
    print("- Generazione Student...")
    students = gen_students(N_STUDENTS)
    
    print("- Generazione Category...")
    categories = gen_categories(N_CATEGORIES)
    
    print("- Generazione Subject...")
    subjects = gen_subjects(N_SUBJECTS)
    
    print("- Generazione Payer...")
    payers = gen_payers(N_PAYERS)
    
    # FASE 2: Genera dati con una FK
    print("- Generazione Payment...")
    payments = gen_payments(payers, N_PAYMENTS)
    
    # FASE 3: Genera dati con più FK
    print("- Generazione Lesson...")
    lessons = gen_lessons(students, subjects, payments, categories, N_LESSONS)
    
    # Scrittura CSV
    print("\nScrittura file CSV...")
    write_csv(outdir / "Student.csv", ["StudentID","FirstName","LastName","Address","City","PhoneNumber"], students)
    write_csv(outdir / "Category.csv", ["CategoryID","CategoryStudent","Price"], categories)
    write_csv(outdir / "Subject.csv", ["SubjectID","SubjectName"], subjects)
    write_csv(outdir / "Payer.csv", ["PayerID","FirstName","LastName","Address","City","PhoneNumber","Email"], payers)
    write_csv(outdir / "Payment.csv", ["PaymentID","PayerID","Amount","PaymentMethod","PaymentDate"], payments)
    write_csv(outdir / "Lesson.csv", ["LessonID","StudentID","SubjectID","PaymentID","CategoryID","StartDate","StartTime","LessonType"], lessons)
    
    # File con l'ordine consigliato di importazione
    with open(outdir / "_IMPORT_ORDER.txt", "w", encoding="utf-8") as f:
        f.write("=" * 70 + "\n")
        f.write("ORDINE CONSIGLIATO DI IMPORT PER prof_privato\n")
        f.write("=" * 70 + "\n\n")
        f.write("IMPORTANTE: Importa i file CSV in phpMyAdmin nell'ordine seguente\n")
        f.write("per evitare conflitti con le Foreign Key.\n\n")
        f.write("FASE 1 - Tabelle senza Foreign Key (indipendenti):\n")
        f.write("-" * 70 + "\n")
        f.write("1. Student.csv\n")
        f.write("2. Category.csv\n")
        f.write("3. Subject.csv\n")
        f.write("4. Payer.csv\n\n")
        f.write("FASE 2 - Tabelle con una Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("5. Payment.csv         (dipende da Payer)\n\n")
        f.write("FASE 3 - Tabelle con più Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("6. Lesson.csv          (dipende da Student, Subject, Payment, Category)\n\n")
        f.write("=" * 70 + "\n")
        f.write("NOTE IMPORTANTI:\n")
        f.write("-" * 70 + "\n")
        f.write("- Durante l'import, assicurati che il campo 'NULL' venga interpretato\n")
        f.write("  come valore NULL nel database.\n")
        f.write("- Se usi phpMyAdmin, seleziona l'opzione per gestire i NULL durante\n")
        f.write("  l'importazione.\n")
        f.write("- Le colonne ID sono AUTO_INCREMENT, quindi verranno generate\n")
        f.write("  automaticamente dal database.\n")
        f.write("- PaymentID in Lesson può essere NULL (circa 30% delle lezioni non\n")
        f.write("  hanno ancora un pagamento associato).\n")
        f.write("- Email in Payer può essere NULL (circa 30% dei paganti non hanno email).\n\n")
        f.write("=" * 70 + "\n")
        f.write("STATISTICHE DATASET:\n")
        f.write("-" * 70 + "\n")
        f.write(f"- Studenti: {N_STUDENTS}\n")
        f.write(f"- Categorie: {N_CATEGORIES}\n")
        f.write(f"- Materie: {N_SUBJECTS}\n")
        f.write(f"- Paganti: {N_PAYERS}\n")
        f.write(f"- Pagamenti: {N_PAYMENTS}\n")
        f.write(f"- Lezioni: {N_LESSONS}\n\n")
        f.write("- Periodo lezioni: ultimi 6 mesi + 30 giorni futuri\n")
        f.write("- Tipi di lezione: Individuale, Gruppo, Online, A Domicilio\n")
        f.write("- Metodi di pagamento: Contanti, Bonifico, PayPal, Carta, Satispay\n")
        f.write("=" * 70 + "\n")
    
    print(f"\n✓ Generazione completata!")
    print(f"✓ File CSV creati in: {outdir}")
    print(f"✓ Leggi {outdir / '_IMPORT_ORDER.txt'} per l'ordine di importazione")

if __name__ == "__main__":
    main()