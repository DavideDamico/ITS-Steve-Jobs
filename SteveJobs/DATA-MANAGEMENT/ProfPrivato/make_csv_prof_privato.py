"""
make_csv_prof_privato.py
-------------------------
Generatore CSV per il database prof_privato (SENZA tabella Payer).
- Nessun parametro esterno: esegui `python make_csv_prof_privato.py`.
- Crea una cartella di output timestampata dentro `csv_out/`.
- Rispetta PK / FK e coerenze del database prof_privato.
Requisiti: pip install Faker python-dateutil
"""
import csv
from pathlib import Path
import random
from datetime import date, datetime, timedelta
from dateutil.relativedelta import relativedelta
from faker import Faker

fake = Faker("it_IT")

# Parametri di configurazione
N_STUDENTS = 80
N_CATEGORIES = 4
N_SUBJECTS = 7
N_LESSONS = 200

# Seed per riproducibilità
RANDOM_SEED = 12345
LESSONS_START = date.today() - relativedelta(months=6)
LESSONS_END = date.today() + timedelta(days=30)

random.seed(RANDOM_SEED)
Faker.seed(RANDOM_SEED)


def ts_outdir(base="csv_out"):
    t = datetime.now().strftime("%Y%m%d_%H%M%S")
    p = Path(base) / f"prof_privato_{t}"
    p.mkdir(parents=True, exist_ok=True)
    return p


def daterange(start: date, end: date) -> date:
    if start > end:
        start, end = end, start
    delta = (end - start).days
    return start + timedelta(days=random.randint(0, delta))


def random_time():
    return random.choice(['15:00:00', '16:30:00', '18:00:00'])


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


def gen_lessons(students, subjects, categories, n):
    lessons = []
    student_ids = [s["StudentID"] for s in students]
    subject_ids = [s["SubjectID"] for s in subjects]
    category_ids = [c["CategoryID"] for c in categories]
    lesson_types = ["Online", "In Presenza"]
    
    lesson_id = 1
    
    # Assegna almeno 1 lezione per studente
    print(f"  - Assegnazione 1 lezione per studente ({len(student_ids)} lezioni)...")
    for student_id in student_ids:
        lesson_date = daterange(LESSONS_START, LESSONS_END)
        
        lessons.append({
            "LessonID": lesson_id,
            "StudentID": student_id,
            "SubjectID": random.choice(subject_ids),
            "PaymentID": None,
            "CategoryID": random.choice(category_ids),
            "StartDate": lesson_date,
            "StartTime": random_time(),
            "LessonType": random.choice(lesson_types),
        })
        lesson_id += 1
    
    # Distribuisci le lezioni rimanenti
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
    
    lessons.sort(key=lambda x: x["StartDate"])
    return lessons


def gen_payments_from_lessons(lessons, categories, students):
    """
    Genera pagamenti collegati direttamente agli studenti.
    Ogni pagamento copre 1 o più lezioni dello stesso studente.
    Circa il 70% delle lezioni viene pagata.
    """
    payments = []
    payment_methods = ["Contanti", "Bonifico", "PayPal", "Carta di Credito", "Satispay"]
    
    cat_prices = {c["CategoryID"]: c["Price"] for c in categories}
    
    from collections import defaultdict
    lessons_by_student = defaultdict(list)
    for lesson in lessons:
        lessons_by_student[lesson["StudentID"]].append(lesson)
    
    payment_id = 1
    
    print(f"  - Generazione pagamenti per {len(lessons_by_student)} studenti...")
    
    for student_id, student_lessons in lessons_by_student.items():
        student_lessons.sort(key=lambda x: x["StartDate"])
        
        # 70% delle lezioni vengono pagate
        num_to_pay = int(len(student_lessons) * 0.7)
        lessons_to_pay = student_lessons[:num_to_pay]
        
        # Raggruppa in batch (1-5 lezioni per pagamento)
        i = 0
        while i < len(lessons_to_pay):
            batch_size = random.randint(1, min(5, len(lessons_to_pay) - i))
            batch = lessons_to_pay[i:i+batch_size]
            
            total_amount = sum(cat_prices[lesson["CategoryID"]] for lesson in batch)
            
            # Data pagamento: 0-7 giorni prima della prima lezione
            payment_date = batch[0]["StartDate"] - timedelta(days=random.randint(0, 7))
            if payment_date > date.today():
                payment_date = date.today()
            
            payments.append({
                "PaymentID": payment_id,
                "StudentID": student_id,  # COLLEGATO ALLO STUDENTE
                "Amount": round(total_amount, 2),
                "PaymentMethod": random.choice(payment_methods),
                "PaymentDate": payment_date,
            })
            
            # Assegna PaymentID alle lezioni
            for lesson in batch:
                lesson["PaymentID"] = payment_id
            
            payment_id += 1
            i += batch_size
    
    print(f"  - Generati {len(payments)} pagamenti")
    paid = sum(1 for l in lessons if l['PaymentID'] is not None)
    print(f"  - Lezioni pagate: {paid}/{len(lessons)} ({paid/len(lessons)*100:.1f}%)")
    
    return payments


def main():
    outdir = ts_outdir()
    
    print("Generazione dati in corso...")
    
    # FASE 1: Tabelle base
    print("\n[FASE 1] Tabelle indipendenti")
    print("- Generazione Student...")
    students = gen_students(N_STUDENTS)
    
    print("- Generazione Category...")
    categories = gen_categories(N_CATEGORIES)
    
    print("- Generazione Subject...")
    subjects = gen_subjects(N_SUBJECTS)
    
    # FASE 2: Lezioni
    print("\n[FASE 2] Generazione Lezioni")
    print(f"- Generazione {N_LESSONS} lezioni per {N_STUDENTS} studenti...")
    lessons = gen_lessons(students, subjects, categories, N_LESSONS)
    
    # FASE 3: Pagamenti (collegati a Student)
    print("\n[FASE 3] Generazione Pagamenti")
    payments = gen_payments_from_lessons(lessons, categories, students)
    
    # SCRITTURA FILE
    print("\n[SCRITTURA FILE]")
    write_csv(outdir / "Student.csv", 
              ["StudentID","FirstName","LastName","Address","City","PhoneNumber"], 
              students)
    write_csv(outdir / "Category.csv", 
              ["CategoryID","CategoryStudent","Price"], 
              categories)
    write_csv(outdir / "Subject.csv", 
              ["SubjectID","SubjectName"], 
              subjects)
    write_csv(outdir / "Payment.csv", 
              ["PaymentID","StudentID","Amount","PaymentMethod","PaymentDate"], 
              payments)
    write_csv(outdir / "Lesson.csv", 
              ["LessonID","StudentID","SubjectID","PaymentID","CategoryID","StartDate","StartTime","LessonType"], 
              lessons)
    
    # STATISTICHE
    print("\n" + "="*70)
    print("STATISTICHE DATASET GENERATO")
    print("="*70)
    print(f"Studenti totali: {len(students)}")
    print(f"Lezioni totali: {len(lessons)}")
    print(f"Pagamenti totali: {len(payments)}")
    
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
    
    # File istruzioni import
    with open(outdir / "_IMPORT_ORDER.txt", "w", encoding="utf-8") as f:
        f.write("=" * 70 + "\n")
        f.write("ORDINE CONSIGLIATO DI IMPORT PER prof_privato\n")
        f.write("=" * 70 + "\n\n")
        f.write("IMPORTANTE: Importa i file CSV in phpMyAdmin nell'ordine seguente\n")
        f.write("per evitare conflitti con le Foreign Key.\n\n")
        f.write("FASE 1 - Tabelle senza Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("1. Student.csv\n")
        f.write("2. Category.csv\n")
        f.write("3. Subject.csv\n\n")
        f.write("FASE 2 - Tabelle con una Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("4. Payment.csv         (dipende da Student)\n\n")
        f.write("FASE 3 - Tabelle con più Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("5. Lesson.csv          (dipende da Student, Subject, Payment, Category)\n\n")
        f.write("=" * 70 + "\n")
        f.write("NOTE IMPORTANTI:\n")
        f.write("-" * 70 + "\n")
        f.write("- Durante l'import, assicurati che 'NULL' venga interpretato come NULL.\n")
        f.write("- PaymentID in Lesson può essere NULL (~30% lezioni non pagate).\n")
        f.write("- Le colonne ID sono AUTO_INCREMENT.\n")
        f.write("- Ogni Payment è ora collegato direttamente allo Student.\n\n")
        f.write("=" * 70 + "\n")
        f.write("STATISTICHE DATASET:\n")
        f.write("-" * 70 + "\n")
        f.write(f"- Studenti: {N_STUDENTS}\n")
        f.write(f"- Categorie: {N_CATEGORIES}\n")
        f.write(f"- Materie: {N_SUBJECTS}\n")
        f.write(f"- Pagamenti: {len(payments)}\n")
        f.write(f"- Lezioni: {N_LESSONS}\n\n")
        f.write("- Periodo lezioni: ultimi 6 mesi + 30 giorni futuri\n")
        f.write("- Tipi di lezione: Online, In Presenza\n")
        f.write("- Metodi di pagamento: Contanti, Bonifico, PayPal, Carta, Satispay\n")
        f.write("=" * 70 + "\n")
    
    print(f"\n✓ Generazione completata!")
    print(f"✓ File CSV creati in: {outdir}")
    print(f"✓ Leggi {outdir / '_IMPORT_ORDER.txt'} per l'ordine di importazione")


if __name__ == "__main__":
    main()