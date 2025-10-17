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
N_CATEGORIES = 4           # Numero di categorie (Scuola Media, Liceo, Università, Preparazione Esami)
N_SUBJECTS = 7            # Numero di materie
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


# Restituisce un orario casuale per le lezioni (SOLO 15:00, 16:30, 18:00)
def random_time():
    return random.choice(['15:00:00', '16:30:00', '18:00:00'])

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


# Genera categorie 
def gen_categories(n):
    base_categories = [
        ("Scuola Media", 15.00),
        ("Liceo", 25.00),
        ("Università", 35.00),
        ("Preparazione Esami", 50.00),
    ]
    
    categories = []
    for i in range(1, n+1):
        if i <= len(base_categories):
            name, price = base_categories[i-1]
        else:
            name = f"Categoria {i}"
            price = round(random.uniform(15.0, 50.0), 2)
        
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
        "Italiano", "Filosofia", "Informatica"
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

def gen_lessons(students, subjects, categories, n):
    """
    Genera lezioni assicurandosi che:
    - Ogni studente abbia almeno 1 lezione
    - Le lezioni rimanenti siano distribuite casualmente
    """
    lessons = []
    student_ids = [s["StudentID"] for s in students]
    subject_ids = [s["SubjectID"] for s in subjects]
    category_ids = [c["CategoryID"] for c in categories]
    lesson_types = ["Online", "In Presenza"]
    
    lesson_id = 1
    
    # FASE 1: Assegna almeno 1 lezione per studente
    print(f"  - Assegnazione 1 lezione per studente ({len(student_ids)} lezioni)...")
    for student_id in student_ids:
        lesson_date = daterange(LESSONS_START, LESSONS_END)
        
        lessons.append({
            "LessonID": lesson_id,
            "StudentID": student_id,
            "SubjectID": random.choice(subject_ids),
            "PaymentID": None,  # Sarà assegnato dopo
            "CategoryID": random.choice(category_ids),
            "StartDate": lesson_date,
            "StartTime": random_time(),
            "LessonType": random.choice(lesson_types),
        })
        lesson_id += 1
    
    # FASE 2: Distribuisci le lezioni rimanenti casualmente
    remaining_lessons = n - len(student_ids)
    if remaining_lessons > 0:
        print(f"  - Distribuzione {remaining_lessons} lezioni rimanenti...")
        for _ in range(remaining_lessons):
            lesson_date = daterange(LESSONS_START, LESSONS_END)
            
            lessons.append({
                "LessonID": lesson_id,
                "StudentID": random.choice(student_ids),
                "SubjectID": random.choice(subject_ids),
                "PaymentID": None,
                "CategoryID": random.choice(category_ids),
                "StartDate": lesson_date,
                "StartTime": random_time(),
                "LessonType": random.choice(lesson_types),
            })
            lesson_id += 1
    
    # Ordina le lezioni per data
    lessons.sort(key=lambda x: x["StartDate"])
    
    return lessons

def gen_payments_from_lessons(lessons, categories, payers):
    """
    Genera pagamenti basati sulle lezioni effettive.
    Ogni pagamento può coprire 1 o più lezioni dello stesso studente.
    Circa il 30% delle lezioni rimane non pagata.
    """
    payments = []
    payment_methods = ["Contanti", "Bonifico", "PayPal", "Carta di Credito", "Satispay"]
    
    # Crea dizionario CategoryID -> Price
    cat_prices = {c["CategoryID"]: c["Price"] for c in categories}
    
    # Raggruppa lezioni per studente
    from collections import defaultdict
    lessons_by_student = defaultdict(list)
    for lesson in lessons:
        lessons_by_student[lesson["StudentID"]].append(lesson)
    
    payment_id = 1
    payer_ids = [p["PayerID"] for p in payers]
    
    print(f"  - Generazione pagamenti per {len(lessons_by_student)} studenti...")
    
    for student_id, student_lessons in lessons_by_student.items():
        # Ordina le lezioni dello studente per data
        student_lessons.sort(key=lambda x: x["StartDate"])
        
        # Decidi quante lezioni pagare (70% delle lezioni sono pagate)
        num_to_pay = int(len(student_lessons) * 0.7)
        lessons_to_pay = student_lessons[:num_to_pay]
        
        # Raggruppa le lezioni pagate in batch (1-5 lezioni per pagamento)
        i = 0
        while i < len(lessons_to_pay):
            # Numero di lezioni in questo pagamento
            batch_size = random.randint(1, min(5, len(lessons_to_pay) - i))
            batch = lessons_to_pay[i:i+batch_size]
            
            # Calcola il totale del pagamento
            total_amount = sum(cat_prices[lesson["CategoryID"]] for lesson in batch)
            
            # Data di pagamento: tra 0 e 7 giorni prima della prima lezione del batch
            payment_date = batch[0]["StartDate"] - timedelta(days=random.randint(0, 7))
            # Assicurati che non sia nel futuro
            if payment_date > date.today():
                payment_date = date.today()
            
            # Crea il pagamento
            payments.append({
                "PaymentID": payment_id,
                "PayerID": random.choice(payer_ids),
                "Amount": round(total_amount, 2),
                "PaymentMethod": random.choice(payment_methods),
                "PaymentDate": payment_date,
            })
            
            # Assegna il PaymentID a tutte le lezioni del batch
            for lesson in batch:
                lesson["PaymentID"] = payment_id
            
            payment_id += 1
            i += batch_size
    
    print(f"  - Generati {len(payments)} pagamenti")
    print(f"  - Lezioni pagate: {sum(1 for l in lessons if l['PaymentID'] is not None)}/{len(lessons)}")
    
    return payments


# Funzione principale
def main():
    outdir = ts_outdir()
    
    print("Generazione dati in corso...")
    
    # FASE 1: Genera dati base (tabelle senza FK)
    print("\n[FASE 1] Tabelle indipendenti")
    print("- Generazione Student...")
    students = gen_students(N_STUDENTS)
    
    print("- Generazione Category...")
    categories = gen_categories(N_CATEGORIES)
    
    print("- Generazione Subject...")
    subjects = gen_subjects(N_SUBJECTS)
    
    print("- Generazione Payer...")
    payers = gen_payers(N_PAYERS)
    
    # FASE 2: Genera lezioni (senza ancora i pagamenti)
    print("\n[FASE 2] Generazione Lezioni")
    print(f"- Generazione {N_LESSONS} lezioni per {N_STUDENTS} studenti...")
    lessons = gen_lessons(students, subjects, categories, N_LESSONS)
    
    # FASE 3: Genera pagamenti basati sulle lezioni
    print("\n[FASE 3] Generazione Pagamenti")
    payments = gen_payments_from_lessons(lessons, categories, payers)
    
    # Scrittura CSV
    print("\n[SCRITTURA FILE]")
    write_csv(outdir / "Student.csv", ["StudentID","FirstName","LastName","Address","City","PhoneNumber"], students)
    write_csv(outdir / "Category.csv", ["CategoryID","CategoryStudent","Price"], categories)
    write_csv(outdir / "Subject.csv", ["SubjectID","SubjectName"], subjects)
    write_csv(outdir / "Payer.csv", ["PayerID","FirstName","LastName","Address","City","PhoneNumber","Email"], payers)
    write_csv(outdir / "Payment.csv", ["PaymentID","PayerID","Amount","PaymentMethod","PaymentDate"], payments)
    write_csv(outdir / "Lesson.csv", ["LessonID","StudentID","SubjectID","PaymentID","CategoryID","StartDate","StartTime","LessonType"], lessons)
    
    # Statistiche finali
    print("\n" + "="*70)
    print("STATISTICHE DATASET GENERATO")
    print("="*70)
    print(f"Studenti totali: {len(students)}")
    print(f"Lezioni totali: {len(lessons)}")
    print(f"Pagamenti totali: {len(payments)}")
    
    # Calcola studenti per numero di lezioni
    from collections import Counter
    lessons_per_student = Counter(l["StudentID"] for l in lessons)
    print(f"\nDistribuzione lezioni per studente:")
    print(f"  - Con 1 lezione: {sum(1 for c in lessons_per_student.values() if c == 1)}")
    print(f"  - Con 2-5 lezioni: {sum(1 for c in lessons_per_student.values() if 2 <= c <= 5)}")
    print(f"  - Con 6+ lezioni: {sum(1 for c in lessons_per_student.values() if c >= 6)}")
    
    paid_lessons = sum(1 for l in lessons if l["PaymentID"] is not None)
    print(f"\nLezioni pagate: {paid_lessons}/{len(lessons)} ({paid_lessons/len(lessons)*100:.1f}%)")
    
    total_revenue = sum(p["Amount"] for p in payments)
    print(f"Fatturato totale: €{total_revenue:.2f}")
    print("="*70)
    
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
   