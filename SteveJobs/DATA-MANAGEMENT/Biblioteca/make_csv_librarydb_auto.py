"""
make_csv_librarydb_auto.py
---------------------------
Generatore CSV *zero-config* per lo schema LibraryDB.
- Nessun parametro esterno: esegui `python make_csv_librarydb_auto.py`.
- Crea una cartella di output timestampata dentro `csv_out/`.
- Rispetta PK / FK e coerenze del database Library.
Requisiti: pip install Faker python-dateutil
"""
# Import delle librerie necessarie
import csv
from pathlib import Path
import random
from datetime import date, datetime, timedelta
from dateutil.relativedelta import relativedelta
from faker import Faker
from itertools import count

fake = Faker("it_IT")

# Parametri di configurazione per la quantità di dati da generare
N_USERS = 150              # Numero di utenti base
N_EMPLOYEES = 20           # Numero di dipendenti (subset di users)
N_CUSTOMERS = 100          # Numero di clienti (subset di users)
N_AUTHORS = 50             # Numero di autori
N_CATEGORIES = 15          # Numero di categorie
N_SUPPLIERS = 10           # Numero di fornitori
N_BOOKS = 200              # Numero di libri
N_REVIEWS = 80             # Numero di recensioni
N_BOOKINFOS = 250          # Numero di BookInfo (copie/edizioni)
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


# Genera libri
def gen_books(n):
    books = []
    languages = ["Italiano", "Inglese", "Francese", "Spagnolo", "Tedesco"]
    
    for i in range(1, n+1):
        pub_year = date.today() - relativedelta(years=random.randint(0, 50))
        
        books.append({
            "BookID": i,
            "Title": fake.sentence(nb_words=random.randint(2, 6)).rstrip('.')[:200],
            "Description": fake.text(max_nb_chars=500)[:500] if random.random() < 0.8 else None,
            "PublicationYear": pub_year,
            "Language": random.choice(languages)[:30],
            "Summary": fake.text(max_nb_chars=1000)[:1000] if random.random() < 0.7 else None,
            "IsAvailable": random.choice([1, 1, 1, 0]),  # 75% disponibili
            "IsDeleted": 0,
        })
    return books


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


# Genera BookInfo (copie/edizioni dei libri)
def gen_bookinfos(books, suppliers, authors, categories, reviews, n):
    bookinfos = []
    book_ids = [b["BookID"] for b in books]
    supplier_ids = [s["SupplierID"] for s in suppliers]
    author_ids = [a["AuthorID"] for a in authors]
    category_ids = [c["CategoryID"] for c in categories]
    review_ids = [r["ReviewID"] for r in reviews]
    
    for i in range(1, n+1):
        # MODIFICA: SupplierID è sempre obbligatorio (NOT NULL)
        supplier = random.choice(supplier_ids)
        # ReviewID può essere NULL
        review = random.choice(review_ids) if random.random() < 0.4 else None
        
        bookinfos.append({
            "BookInfoID": i,
            "BookID": random.choice(book_ids),
            "SupplierID": supplier,  # Sempre presente
            "AuthorID": random.choice(author_ids),
            "ReviewID": review,
            "CategoryID": random.choice(category_ids),
            "Copy": random.randint(1, 10),
        })
    return bookinfos


# Genera RentalDetails e Rentals
def gen_rentals(employees, customers, bookinfos, n):
    rental_details = []
    rentals = []
    
    employee_ids = [e["EmployeeID"] for e in employees]
    customer_ids = [c["CustomerID"] for c in customers]
    bookinfo_ids = [b["BookInfoID"] for b in bookinfos]
    
    for i in range(1, n+1):
        employee_id = random.choice(employee_ids)
        customer_id = random.choice(customer_ids)
        bookinfo_id = random.choice(bookinfo_ids)
        
        # RentalDetail
        rental_details.append({
            "RentalDetailID": i,
            "EmployeeID": employee_id,
            "CustomerID": customer_id,
            "BookInfoID": bookinfo_id,
        })
        
        # Rental
        start = daterange(RENTALS_START, RENTALS_END)
        still_rented = random.random() < 0.3  # 30% ancora in prestito
        termination = None if still_rented else start + timedelta(days=random.randint(7, 45))
        
        rentals.append({
            "RentalID": i,
            "EmployeeID": employee_id,
            "CustomerID": customer_id,
            "RentalDetailID": i,
            "StartDate": start,
            "TerminationDate": termination,
        })
    
    return rental_details, rentals


# Funzione principale
def main():
    outdir = ts_outdir()
    
    # Genera dati base (tabelle senza FK)
    users = gen_users(N_USERS)
    
    categories = gen_categories(N_CATEGORIES)
    
    suppliers = gen_suppliers(N_SUPPLIERS)
    
    authors = gen_authors(N_AUTHORS)
    
    books = gen_books(N_BOOKS)
    
    # Genera dati con una FK
    employees = gen_employees(users, N_EMPLOYEES)
    
    customers = gen_customers(users, N_EMPLOYEES, N_CUSTOMERS)
    
    reviews = gen_reviews(customers, N_REVIEWS)
    
    # Genera dati con più FK
    bookinfos = gen_bookinfos(books, suppliers, authors, categories, reviews, N_BOOKINFOS)
    
    rental_details, rentals = gen_rentals(employees, customers, bookinfos, N_RENTALS)
    
    # Scrittura CSV
    write_csv(outdir / "User.csv", ["UserID","FirstName","LastName","Email","Address","Phone","IsDeleted"], users)
    write_csv(outdir / "Category.csv", ["CategoryID","Name","CreationDate","UpdationDate"], categories)
    write_csv(outdir / "Supplier.csv", ["SupplierID","Name","Address","Phone","IsDeleted"], suppliers)
    write_csv(outdir / "Author.csv", ["AuthorID","FirstName","LastName","Birth","Bio","IsDeleted"], authors)
    write_csv(outdir / "Book.csv", ["BookID","Title","Description","PublicationYear","Language","Summary","IsAvailable","IsDeleted"], books)
    write_csv(outdir / "Employee.csv", ["EmployeeID","UserID","Birth","TypeOfContract","StartDate","TerminationDate","WorkHour","ExtraHour","IsDeleted"], employees)
    write_csv(outdir / "Customer.csv", ["CustomerID","UserID","IsDeleted"], customers)
    write_csv(outdir / "Review.csv", ["ReviewID","CustomerID","Rating","Message","CreationDate","UpdationDate","IsDeleted"], reviews)
    write_csv(outdir / "BookInfo.csv", ["BookInfoID","BookID","SupplierID","AuthorID","ReviewID","CategoryID","Copy"], bookinfos)
    write_csv(outdir / "RentalDetail.csv", ["RentalDetailID","EmployeeID","CustomerID","BookInfoID"], rental_details)
    write_csv(outdir / "Rental.csv", ["RentalID","EmployeeID","CustomerID","RentalDetailID","StartDate","TerminationDate"], rentals)
    
    # File con l'ordine consigliato di importazione
    with open(outdir / "_IMPORT_ORDER.txt", "w", encoding="utf-8") as f:
        f.write("=" * 70 + "\n")
        f.write("ORDINE CONSIGLIATO DI IMPORT PER LibraryDB\n")
        f.write("=" * 70 + "\n\n")
        f.write("IMPORTANTE: Importa i file CSV in phpMyAdmin nell'ordine seguente\n")
        f.write("per evitare conflitti con le Foreign Key.\n\n")
        f.write("FASE 1 - Tabelle senza Foreign Key (indipendenti):\n")
        f.write("-" * 70 + "\n")
        f.write("1. User.csv\n")
        f.write("2. Category.csv\n")
        f.write("3. Supplier.csv\n")
        f.write("4. Author.csv\n")
        f.write("5. Book.csv\n\n")
        f.write("FASE 2 - Tabelle con una Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("6. Employee.csv        (dipende da User)\n")
        f.write("7. Customer.csv        (dipende da User)\n")
        f.write("8. Review.csv          (dipende da Customer)\n\n")
        f.write("FASE 3 - Tabelle con più Foreign Key:\n")
        f.write("-" * 70 + "\n")
        f.write("9. BookInfo.csv        (dipende da Book, Supplier, Author, Review, Category)\n")
        f.write("10. RentalDetail.csv   (dipende da Employee, Customer, BookInfo)\n")
        f.write("11. Rental.csv         (dipende da Employee, Customer, RentalDetail)\n\n")
        f.write("=" * 70 + "\n")
        f.write("NOTE:\n")
        f.write("- Durante l'import, assicurati che il campo 'NULL' venga interpretato\n")
        f.write("  come valore NULL nel database.\n")
        f.write("- Se usi phpMyAdmin, seleziona 'NULL' come valore per i campi vuoti\n")
        f.write("  nelle opzioni di importazione.\n")
        f.write("- Le colonne ID sono AUTO_INCREMENT, quindi non dovresti avere problemi.\n")
        f.write("- IMPORTANTE: SupplierID in BookInfo è sempre obbligatorio (NOT NULL).\n")
        f.write("=" * 70 + "\n")
    
    print(f"✓ CSV generati con successo in: {outdir}")
    print(f"✓ SupplierID in BookInfo: sempre presente (NOT NULL)")
    
if __name__ == "__main__":
    main()