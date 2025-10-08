"""
make_csv_pizzadb_auto.py
------------------------
Generatore CSV *zero-config* per lo schema PizzaDB.
- Nessun parametro esterno: esegui `python make_csv_pizzadb_auto.py`.
- Crea una cartella di output timestampata dentro `csv_out/`.
- Rispetta PK / FK / UK e coerenze (OrderTaker attivo, coupon non scaduti).
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
N_SHOPS = 5                # Numero di negozi
N_EMPLOYEES = 50           # Numero di dipendenti
N_CUSTOMERS = 200          # Numero di clienti
N_COUPONS = 15             # Numero di coupon
N_PRODUCTS = 40            # Numero di prodotti
N_ORDERS = 600             # Numero di ordini
MIN_ITEMS_PER_ORDER = 1    # Minimo articoli per ordine
MAX_ITEMS_PER_ORDER = 5    # Massimo articoli per ordine

# Seed per la generazione casuale (riproducibilità)
RANDOM_SEED = 12345  # Cambia per dataset diversi
# Intervallo temporale degli ordini
ORDERS_START = date.today() - relativedelta(months=6)
ORDERS_END   = date.today() - timedelta(days=1)

# Inizializzazione Faker e random
fake = Faker("it_IT")
random.seed(RANDOM_SEED)
Faker.seed(RANDOM_SEED)


# Crea una cartella di output con timestamp
def ts_outdir(base="csv_out"):
    t = datetime.now().strftime("%Y%m%d_%H%M%S")
    p = Path(base) / f"PizzaDB_{t}"
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
    import csv
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


# Genera n negozi con nomi unici
def gen_shops(n):
    shops, used = [], set()
    for i in range(1, n+1):
        base = random.choice(["Pizza","Forno","Bella","Roma","Gusto","Vesuvio","Sapore","DaNino","Traste","Magma"])
        name = f"{base}{i}"[:20]
        while name in used:
            name = (name + random.choice("XYZ"))[:20]
        used.add(name)
        shops.append({"ShopID": i, "ShopName": name})
    return shops


# Genera n dipendenti con nomi e cognomi fittizi
def gen_employees(n):
    return [{"EmployeeID": i, "FirstName": fake.first_name(), "LastName": fake.last_name()} for i in range(1, n+1)]


# Genera la storia lavorativa dei dipendenti (possibili cambi di negozio e date di assunzione/cessazione)
def gen_employee_history(employees, shops):
    histories = []
    hid = count(1)
    shop_ids = [s["ShopID"] for s in shops]
    today = date.today()
    for e in employees:
        # Primo periodo lavorativo
        start1 = today - relativedelta(years=random.randint(1,4), months=random.randint(0,11), days=random.randint(0,27))
        change = random.random() < 0.5  # Possibile cambio negozio
        end1 = start1 + relativedelta(months=random.randint(6,24)) if change else None
        histories.append({
            "EmployeeHistoryID": next(hid),
            "EmployeeID": e["EmployeeID"],
            "ShopID": random.choice(shop_ids),
            "StartDate": start1,
            "TerminationDate": end1,
        })
        # Secondo periodo lavorativo (se c'è stato un cambio)
        if end1 is not None:
            still_active = random.random() < 0.7
            start2 = end1 + timedelta(days=random.randint(1,30))
            end2 = None if still_active else start2 + relativedelta(months=random.randint(3,18))
            histories.append({
                "EmployeeHistoryID": next(hid),
                "EmployeeID": e["EmployeeID"],
                "ShopID": random.choice(shop_ids),
                "StartDate": start2,
                "TerminationDate": end2,
            })
    return histories


# Genera n clienti con dati di contatto fittizi
def gen_customers(n):
    out = []
    for i in range(1, n+1):
        out.append({
            "CustomerID": i,
            "PhoneNumber": fake.phone_number()[:15],
            "Email": fake.unique.email()[:40],
            "LastName": fake.last_name()[:40],
            "StreetAddress": fake.street_address().replace("\\n"," ")[:40],
            "City": fake.city()[:20],
            "StateProvidence": fake.state_abbr()[:10],
            "PostalCode": fake.postcode()[:15],
        })
    return out


# Genera n coupon con nome, descrizione, percentuale di sconto e data di scadenza
def gen_coupons(n):
    out, used = [], set()
    for i in range(1, n+1):
        base = random.choice(["WELCOME","SPRING","VIP","WEEKEND","SAVE","PIZZA","HAPPY","FAMILY","LUNCH","DINNER"])
        suffix = str(random.randint(5,50))
        name = (base + suffix)[:20]
        while name in used:
            name = (name + random.choice("XYZ"))[:20]
        used.add(name)
        pct = random.choice([5,10,12,15,20,25,30])
        exp = date.today() + relativedelta(months=random.randint(1,12), days=random.randint(0,27))
        out.append({
            "CouponID": i,
            "CouponName": name,
            "CouponDescription": fake.sentence(nb_words=8)[:80],
            "PercentDiscount": pct,
            "ExpirationDate": exp,
        })
    return out


# Liste di nomi per prodotti
PIZZA_NAMES = [
    "Margherita","Marinara","Diavola","Capricciosa","Quattro Formaggi",
    "Prosciutto","Funghi","Bufala","Napoli","Ortolana","Calzone",
    "BBQ","Hawaiian","Tirolese","Siciliana","Romana","TonnoCipolla",
    "Amatriciana","Pugliese","Gorgonzola"
]
DRINKS = ["Acqua","Cola","Aranciata","Limonata","Birra","Tè Freddo","Chinotto"]
SIDES  = ["Patatine","Olive","Focaccia","PaneAglio"]
DESS   = ["Tiramisù","PannaCotta","Gelato","Brownie"]


# Genera n prodotti (pizze, bevande, contorni, dolci) con nomi e prezzi casuali
def gen_products(n):
    prods, used, pid = [], set(), 1
    pools = [
        ("PIZZA", PIZZA_NAMES, (5.5, 12.0)),
        ("DRINK", DRINKS, (1.0, 4.0)),
        ("SIDE",  SIDES,  (2.0, 6.0)),
        ("DESS",  DESS,   (3.0, 6.5)),
    ]
    while len(prods) < n:
        ptype, pool, (pmin, pmax) = random.choice(pools)
        base = random.choice(pool)
        name = base[:20]
        i = 1
        while name in used:
            name = (base + str(i))[:20]
            i += 1
        used.add(name)
        price = round(random.uniform(pmin, pmax), 2)
        prods.append({
            "ProductID": pid,
            "ProductName": name,
            "ProductType": ptype,
            "Price": price,
        })
        pid += 1
    return prods


# Crea una struttura per cercare rapidamente la storia lavorativa di ogni dipendente
def build_active_lookup(histories):
    by_emp = {}
    for h in histories:
        by_emp.setdefault(h["EmployeeID"], []).append(h)
    return by_emp


# Verifica se un dipendente è attivo in una certa data
def employee_active_on(by_emp, eid, d: date) -> bool:
    for h in by_emp.get(eid, []):
        if h["StartDate"] <= d and (h["TerminationDate"] is None or h["TerminationDate"] >= d):
            return True
    return False


# Verifica se almeno un dipendente è attivo in una certa data
def some_active_on(by_emp, d: date) -> bool:
    return any(employee_active_on(by_emp, eid, d) for eid in by_emp.keys())


# Seleziona casualmente un dipendente attivo in una certa data
def pick_active_employee(by_emp, d: date):
    eligible = [eid for eid in by_emp.keys() if employee_active_on(by_emp, eid, d)]
    return random.choice(eligible) if eligible else random.choice(list(by_emp.keys()))


# Genera ordini e articoli associati, scegliendo clienti, prodotti, coupon validi e dipendenti attivi come “order taker”
def gen_orders(n_orders, customers, coupons, products, histories):
    orders, items = [], []
    by_emp = build_active_lookup(histories)
    order_id = count(1)
    item_id = count(1)
    prod_ids = [p["ProductID"] for p in products]

    for _ in range(n_orders):
        # Scegli una data casuale per l'ordine
        od = daterange(ORDERS_START, ORDERS_END)
        tries = 0
        # Assicurati che ci sia almeno un dipendente attivo in quella data
        while not some_active_on(by_emp, od) and tries < 30:
            od = daterange(ORDERS_START, ORDERS_END)
            tries += 1
        order_taker = pick_active_employee(by_emp, od)
        cust = random.choice(customers)["CustomerID"]
        # Possibile applicazione di un coupon valido
        if random.random() < 0.35 and coupons:
            valid_c = [c for c in coupons if c["ExpirationDate"] >= od]
            coupon_id = random.choice(valid_c)["CouponID"] if valid_c else None
        else:
            coupon_id = None

        oid = next(order_id)
        orders.append({
            "CustomerOrderID": oid,
            "CustomerID": cust,
            "OrderTakerID": order_taker,
            "OrderDate": od,
            "CouponID": coupon_id,
        })
        # Genera gli articoli dell'ordine
        n_items = random.randint(MIN_ITEMS_PER_ORDER, MAX_ITEMS_PER_ORDER)
        chosen = random.sample(prod_ids, k=min(n_items, len(prod_ids)))
        for pid in chosen:
            items.append({
                "CustomerOrderItemID": next(item_id),
                "CustomerOrderID": oid,
                "ProductID": pid,
                "Quantity": random.randint(1,3),
                "SpecialInstructions": None if random.random() < 0.8 else fake.sentence(nb_words=5)[:60],
            })
    return orders, items


# Funzione principale: genera i dati, scrive i file CSV e stampa il percorso di output
def main():
    outdir = ts_outdir()
    shops      = gen_shops(N_SHOPS)
    employees  = gen_employees(N_EMPLOYEES)
    histories  = gen_employee_history(employees, shops)
    customers  = gen_customers(N_CUSTOMERS)
    coupons    = gen_coupons(N_COUPONS)
    products   = gen_products(N_PRODUCTS)
    orders, items = gen_orders(N_ORDERS, customers, coupons, products, histories)

    # Scrittura dei file CSV
    write_csv(outdir / "Shop.csv", ["ShopID","ShopName"], shops)
    write_csv(outdir / "Employee.csv", ["EmployeeID","FirstName","LastName"], employees)
    write_csv(outdir / "EmployeeHistory.csv", ["EmployeeHistoryID","EmployeeID","ShopID","StartDate","TerminationDate"], histories)
    write_csv(outdir / "Customer.csv", ["CustomerID","PhoneNumber","Email","LastName","StreetAddress","City","StateProvidence","PostalCode"], customers)
    write_csv(outdir / "Coupon.csv", ["CouponID","CouponName","CouponDescription","PercentDiscount","ExpirationDate"], coupons)
    write_csv(outdir / "Product.csv", ["ProductID","ProductName","ProductType","Price"], products)
    write_csv(outdir / "CustomerOrder.csv", ["CustomerOrderID","CustomerID","OrderTakerID","OrderDate","CouponID"], orders)
    write_csv(outdir / "CustomerOrderItem.csv", ["CustomerOrderItemID","CustomerOrderID","ProductID","Quantity","SpecialInstructions"], items)

    # File con l'ordine consigliato di importazione
    with open(outdir / "_IMPORT_ORDER.txt", "w", encoding="utf-8") as f:
        f.write("Ordine consigliato di import:\n")
        for name in ["Shop.csv","Employee.csv","EmployeeHistory.csv","Customer.csv","Coupon.csv","Product.csv","CustomerOrder.csv","CustomerOrderItem.csv"]:
            f.write(f"- {name}\n")
    print(f"✅ CSV generati in: {outdir.resolve()}")


# Esecuzione script: chiama main se eseguito direttamente
if __name__ == "__main__":
    main()
