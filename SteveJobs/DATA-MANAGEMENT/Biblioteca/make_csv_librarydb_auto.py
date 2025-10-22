"""
make_csv_librarydb_auto.py 
-----------------------------------
Generatore CSV per LibraryDB con campi TotalCopies e ConservationStatus.
- Aggiunti campi per Vista 6 (disponibilità) e Vista 9 (conservazione).
- Nessun parametro esterno: esegui `python make_csv_librarydb_auto.py`.
- Crea una cartella di output timestampata dentro `csv_out/`.
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
N_USERS = 150              # Numero di utenti base
N_EMPLOYEES = 20           # Numero di dipendenti (subset di users)
N_CUSTOMERS = 100          # Numero di clienti (subset di users)
N_AUTHORS = 50             # Numero di autori
N_CATEGORIES = 15          # Numero di categorie
N_SUPPLIERS = 10           # Numero di fornitori
N_BOOKINFOS = 200          # Numero di BookInfo (info base libri)
N_BOOKS = 250              # Numero di Book (copie fisiche con FK)
N_REVIEWS = 80             # Numero di recensioni
N_RENTALS = 150            # Numero di noleggi

# Seed per la generazione casuale (riproducibilità)
RANDOM_SEED = 12345  # Cambia per dataset diversi
# Intervallo temporale
RENTALS_START = date.today() - relativedelta(months=12)
RENTALS_END   = date.today() - timedelta(days=1)

# Inizializzazione Faker e random
fake = Faker("it_IT")
random.seed(RANDOM_SEED)
Faker.seed(RANDOM_SEED)


# Crea una cartella di output con timestamp
def ts_outdir(base="csv_out"):
    t = datetime.now().strftime("%Y%m%d_%H%M%S")
    p = Path(base) / f"LibraryDB_{t}"
    p.mkdir(parents=True, exist_ok=True)
    return p


# Restituisce una data casuale tra start e end
def daterange(start: date, end: date) -> date:
    if start > end:
        start, end = end, start
    delta = (end - start).days
    return start + timedelta(days=random.randint(0, delta))


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


# Genera n utenti con dati personali
def gen_users(n):
    users = []
    for i in range(1, n+1):
        users.append({
            "UserID": i,
            "FirstName": fake.first_name()[:50],
            "LastName": fake.last_name()[:50],
            "Email": fake.unique.email()[:100],
            "Address": fake.address().replace("\n", ", ")[:100],
            "Phone": fake.phone_number()[:20],
            "IsDeleted": 0,
        })
    return users


# Genera categorie di libri
def gen_categories(n):
    base_categories = [
        "Narrativa", "Giallo", "Thriller", "Fantasy", "Fantascienza",
        "Romanzo storico", "Biografia", "Saggistica", "Filosofia", "Poesia",
        "Teatro", "Fumetti", "Bambini", "Cucina", "Arte",
        "Storia", "Scienza", "Tecnologia", "Viaggi", "Self-help"
    ]
    categories = []
    used = set()
    
    for i in range(1, n+1):
        if i <= len(base_categories):
            name = base_categories[i-1]
        else:
            name = random.choice(base_categories) + f" {i}"
        
        while name in used:
            name = random.choice(base_categories) + f" {random.randint(1, 999)}"
        used.add(name)
        
        creation = date.today() - relativedelta(years=random.randint(1, 10))
        updation = creation + relativedelta(months=random.randint(1, 24)) if random.random() < 0.3 else None
        
        categories.append({
            "CategoryID": i,
            "Name": name[:50],
            "CreationDate": creation,
            "UpdationDate": updation,
        })
    return categories


# Genera fornitori
def gen_suppliers(n):
    suppliers = []
    used = set()
    
    for i in range(1, n+1):
        base = random.choice(["Libri", "Book", "Editore", "Distribuzione", "Mondadori", "Feltrinelli", "Einaudi"])
        name = f"{base} {fake.company()}"[:100]
        
        while name in used:
            name = f"{base} {fake.company()} {i}"[:100]
        used.add(name)
        
        suppliers.append({
            "SupplierID": i,
            "Name": name,
            "Address": fake.address().replace("\n", ", ")[:100],
            "Phone": fake.phone_number()[:20],
            "IsDeleted": 0,
        })
    return suppliers


# Genera autori
def gen_authors(n):
    authors = []
    for i in range(1, n+1):
        birth = date.today() - relativedelta(years=random.randint(30, 90))
        
        authors.append({
            "AuthorID": i,
            "FirstName": fake.first_name()[:50],
            "LastName": fake.last_name()[:50],
            "Birth": birth,
            "Bio": fake.text(max_nb_chars=500)[:500] if random.random() < 0.7 else None,
            "IsDeleted": 0,
        })
    return authors


# Genera BookInfo 
def gen_bookinfos(n):
    bookinfos = []
    languages = ["Italiano", "Inglese", "Francese", "Spagnolo", "Tedesco"]
    conservation_statuses = ["Nuovo", "Come Nuovo", "Buono", "Usurato", "Danneggiato"]
    
    for i in range(1, n+1):
        pub_year = date.today() - relativedelta(years=random.randint(0, 50))
        
      
        rand = random.random()
        if rand < 0.6:
            total_copies = random.randint(1, 3)
        elif rand < 0.9:
            total_copies = random.randint(4, 7)
        else:
            total_copies = random.randint(8, 15)
        

        rand = random.random()
        if rand < 0.20:
            conservation = "Nuovo"
        elif rand < 0.50:
            conservation = "Come Nuovo"
        elif rand < 0.85:
            conservation = "Buono"
        elif rand < 0.97:
            conservation = "Usurato"
        else:
            conservation = "Danneggiato"
        
        bookinfos.append({
            "BookInfoID": i,
            "Title": fake.sentence(nb_words=random.randint(2, 6)).rstrip('.')[:200],
            "Description": fake.text(max_nb_chars=500)[:500] if random.random() < 0.8 else None,
            "PublicationYear": pub_year,
            "Language": random.choice(languages)[:30],
            "Summary": fake.text(max_nb_chars=1000)[:1000] if random.random() < 0.7 else None,
            "IsAvailable": random.choice([1, 1, 1, 0]),  # 75% disponibili
            "IsDeleted": 0,
            "TotalCopies": total_copies,
            "ConservationStatus": conservation,
        })
    return bookinfos


# Genera dipendenti (subset di users)
def gen_employees(users, n):
    employees = []
    user_ids = [u["UserID"] for u in users[:n]]
    
    contracts = ["Full-time", "Part-time", "Tempo determinato", "Tempo indeterminato"]
    
    for i, user_id in enumerate(user_ids, 1):
        start = date.today() - relativedelta(years=random.randint(1, 10))
        still_active = random.random() < 0.85  # 85% ancora attivi
        termination = None if still_active else start + relativedelta(months=random.randint(6, 48))
        birth = date.today() - relativedelta(years=random.randint(25, 65))
        
        employees.append({
            "EmployeeID": i,
            "UserID": user_id,
            "Birth": birth,
            "TypeOfContract": random.choice(contracts)[:50],
            "StartDate": start,
            "TerminationDate": termination,
            "WorkHour": random.choice([20, 30, 35, 40]),
            "ExtraHour": random.randint(0, 10) if random.random() < 0.3 else None,
            "IsDeleted": 0,
        })
    return employees


# Genera clienti (subset di users diverso da employees)
def gen_customers(users, n_employees, n):
    customers = []
    # Usa gli utenti dopo i primi n_employees
    user_ids = [u["UserID"] for u in users[n_employees:n_employees+n]]
    
    for i, user_id in enumerate(user_ids, 1):
        customers.append({
            "CustomerID": i,
            "UserID": user_id,
            "IsDeleted": 0,
        })
    return customers


# Genera recensioni
def gen_reviews(customers, n):
    reviews = []
    customer_ids = [c["CustomerID"] for c in customers]
    
    for i in range(1, n+1):
        creation = date.today() - relativedelta(months=random.randint(1, 18))
        updation = creation + relativedelta(days=random.randint(1, 30)) if random.random() < 0.2 else None
        
        reviews.append({
            "ReviewID": i,
            "CustomerID": random.choice(customer_ids),
            "Rating": random.randint(1, 5),
            "Message": fake.text(max_nb_chars=500)[:500] if random.random() < 0.8 else None,
            "CreationDate": creation,
            "UpdationDate": updation,
            "IsDeleted": 0,
        })
    return reviews


# Genera Book (copie fisiche con tutte le FK)
def gen_books(bookinfos, suppliers, authors, reviews, n):
    books = []
    bookinfo_ids = [b["BookInfoID"] for b in bookinfos]
    supplier_ids = [s["SupplierID"] for s in suppliers]
    author_ids = [a["AuthorID"] for a in authors]
    review_ids = [r["ReviewID"] for r in reviews]
    
    for i in range(1, n+1):
        # ReviewID può essere NULL (circa 40% hanno recensione)
        review = random.choice(review_ids) if random.random() < 0.4 else None
        
        books.append({
            "BookID": i,
            "BookInfoID": random.choice(bookinfo_ids),
            "SupplierID": random.choice(supplier_ids),
            "AuthorID": random.choice(author_ids),
            "ReviewID": review,
            "Copy": random.randint(1, 10),
        })
    return books


# Genera RentalDetails e Rentals
def gen_rentals(employees, customers, books, n):
    rental_details = []
    rentals = []
    
    employee_ids = [e["EmployeeID"] for e in employees]
    customer_ids = [c["CustomerID"] for c in customers]
    book_ids = [b["BookID"] for b in books]
    
    for i in range(1, n+1):
        employee_id = random.choice(employee_ids)
        customer_id = random.choice(customer_ids)
        book_id = random.choice(book_ids)
        
        # RentalDetail con QuantityOfBook
        rental_details.append({
            "RentalDetailID": i,
            "RentalID": i,  # Corrisponde al Rental
            "BookID": book_id,
            "QuantityOfBook": random.randint(1, 3),
        })
        
        # Rental
        start = daterange(RENTALS_START, RENTALS_END)
        still_rented = random.random() < 0.3  # 30% ancora in prestito
        termination = None if still_rented else start + timedelta(days=random.randint(7, 45))
        
        rentals.append({
            "RentalID": i,
            "EmployeeID": employee_id,
            "CustomerID": customer_id,
            "StartDate": start,
            "TerminationDate": termination,
        })
    
    return rental_details, rentals


# Funzione principale
def main():
    outdir = ts_outdir()
    
    print("=" * 70)
    print("GENERAZIONE DATI LibraryDB con TotalCopies e ConservationStatus")
    print("=" * 70)
    print()
    
    # FASE 1: Genera dati base (tabelle senza FK)
    print("FASE 1 - Tabelle senza Foreign Key")
    print("-" * 70)
    print("- Generazione User...")
    users = gen_users(N_USERS)
    
    print("- Generazione Category...")
    categories = gen_categories(N_CATEGORIES)
    
    print("- Generazione Supplier...")
    suppliers = gen_suppliers(N_SUPPLIERS)
    
    print("- Generazione Author...")
    authors = gen_authors(N_AUTHORS)
    
    print("- Generazione BookInfo (con TotalCopies e ConservationStatus)...")
    bookinfos = gen_bookinfos(N_BOOKINFOS)
    
    # FASE 2: Genera dati con una FK
    print()
    print("FASE 2 - Tabelle con una Foreign Key")
    print("-" * 70)
    print("- Generazione Employee...")
    employees = gen_employees(users, N_EMPLOYEES)
    
    print("- Generazione Customer...")
    customers = gen_customers(users, N_EMPLOYEES, N_CUSTOMERS)
    
    print("- Generazione Review...")
    reviews = gen_reviews(customers, N_REVIEWS)
    
    # FASE 3: Genera dati con più FK
    print()
    print("FASE 3 - Tabelle con più Foreign Key")
    print("-" * 70)
    print("- Generazione Book...")
    books = gen_books(bookinfos, suppliers, authors, reviews, N_BOOKS)
    
    print("- Generazione RentalDetail e Rental...")
    rental_details, rentals = gen_rentals(employees, customers, books, N_RENTALS)
    
    # Scrittura CSV
    print()
    print("=" * 70)
    print("SCRITTURA FILE CSV")
    print("=" * 70)
    
    write_csv(outdir / "User.csv", ["UserID","FirstName","LastName","Email","Address","Phone","IsDeleted"], users)
    print(f"✓ User.csv ({len(users)} record)")
    
    write_csv(outdir / "Category.csv", ["CategoryID","Name","CreationDate","UpdationDate"], categories)
    print(f"✓ Category.csv ({len(categories)} record)")
    
    write_csv(outdir / "Supplier.csv", ["SupplierID","Name","Address","Phone","IsDeleted"], suppliers)
    print(f"✓ Supplier.csv ({len(suppliers)} record)")
    
    write_csv(outdir / "Author.csv", ["AuthorID","FirstName","LastName","Birth","Bio","IsDeleted"], authors)
    print(f"✓ Author.csv ({len(authors)} record)")
    
    write_csv(outdir / "BookInfo.csv", 
              ["BookInfoID","Title","Description","PublicationYear","Language","Summary",
               "IsAvailable","IsDeleted","TotalCopies","ConservationStatus"], 
              bookinfos)
    print(f"✓ BookInfo.csv ({len(bookinfos)} record) [AGGIORNATO con TotalCopies e ConservationStatus]")
    
    write_csv(outdir / "Employee.csv", ["EmployeeID","UserID","Birth","TypeOfContract","StartDate","TerminationDate","WorkHour","ExtraHour","IsDeleted"], employees)
    print(f"✓ Employee.csv ({len(employees)} record)")
    
    write_csv(outdir / "Customer.csv", ["CustomerID","UserID","IsDeleted"], customers)
    print(f"✓ Customer.csv ({len(customers)} record)")
    
    write_csv(outdir / "Review.csv", ["ReviewID","CustomerID","Rating","Message","CreationDate","UpdationDate","IsDeleted"], reviews)
    print(f"✓ Review.csv ({len(reviews)} record)")
    
    write_csv(outdir / "Book.csv", ["BookID","BookInfoID","SupplierID","AuthorID","ReviewID","Copy"], books)
    print(f"✓ Book.csv ({len(books)} record)")
    
    write_csv(outdir / "RentalDetail.csv", ["RentalDetailID","RentalID","BookID","QuantityOfBook"], rental_details)
    print(f"✓ RentalDetail.csv ({len(rental_details)} record)")
    
    write_csv(outdir / "Rental.csv", ["RentalID","EmployeeID","CustomerID","StartDate","TerminationDate"], rentals)
    print(f"✓ Rental.csv ({len(rentals)} record)")
    
    # File con l'ordine consigliato di importazione
    with open(outdir / "_IMPORT_ORDER.txt", "w", encoding="utf-8") as f:
        f.write("=" * 70 + "\n")
        f.write("ORDINE CONSIGLIATO DI IMPORT PER LibraryDB\n")
        f.write("(Schema aggiornato con TotalCopies e ConservationStatus)\n")
        f.write("=" * 70 + "\n\n")
        f.write("IMPORTANTE: Importa i file CSV in phpMyAdmin nell'ordine seguente\n")
        f.write("per evitare conflitti con le Foreign Key.\n\n")
        f.write("FASE 1 - Tabelle senza Foreign Key (indipendenti):\n")
        f.write("-" * 70 + "\n")
        f.write("1. User.csv\n")
        f.write("2. Category.csv\n")
        f.write("3. Supplier.csv\n")
        f.write("4. Author.csv\n")
        f.write("5. BookInfo.csv        [AGGIORNATO: include TotalCopies e ConservationStatus]\n\n")
        f.write("FASE 2 - Tabelle con una Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("6. Employee.csv        (dipende da User)\n")
        f.write("7. Customer.csv        (dipende da User)\n")
        f.write("8. Review.csv          (dipende da Customer)\n\n")
        f.write("FASE 3 - Tabelle con più Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("9. Book.csv            (dipende da BookInfo, Supplier, Author, Review)\n")
        f.write("10. Rental.csv         (dipende da Employee, Customer)\n")
        f.write("11. RentalDetail.csv   (dipende da Rental, Book)\n\n")
        f.write("=" * 70 + "\n")
        f.write("NUOVI CAMPI AGGIUNTI:\n")
        f.write("-" * 70 + "\n")
        f.write("BookInfo.TotalCopies:\n")
        f.write("  - Numero totale di copie fisiche disponibili\n")
        f.write("  - Usato per Vista 6 (disponibilità libri)\n")
        f.write("  - Distribuzione: 60% 1-3 copie, 30% 4-7 copie, 10% 8-15 copie\n\n")
        f.write("BookInfo.ConservationStatus:\n")
        f.write("  - Stato di conservazione del libro\n")
        f.write("  - Usato per Vista 9 (catalogo con stato conservazione)\n")
        f.write("  - Valori: Nuovo (20%), Come Nuovo (30%), Buono (35%),\n")
        f.write("    Usurato (12%), Danneggiato (3%)\n\n")
        f.write("=" * 70 + "\n")
        f.write("NOTE:\n")
        f.write("- Durante l'import, assicurati che il campo 'NULL' venga interpretato\n")
        f.write("  come valore NULL nel database.\n")
        f.write("- Prima di importare i CSV, esegui lo script SQL di modifica schema\n")
        f.write("  per aggiungere i nuovi campi TotalCopies e ConservationStatus.\n")
        f.write("=" * 70 + "\n")
    
    print()
    print("=" * 70)
    print(f"✓ COMPLETATO! File generati in: {outdir}")
    print("=" * 70)
   
if __name__ == "__main__":
    main()