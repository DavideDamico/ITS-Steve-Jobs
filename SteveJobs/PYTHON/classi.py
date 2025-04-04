class Student:
    nome = ""
    cognome = ""
    matricola = ""

Student.nome = "Mario"
Student.cognome = "Rossi"
Student.matricola = "123456"

print(Student.nome)
print(Student.cognome)
print(Student.matricola)

studente1 = Student()

print()
print("studente1:", studente1.nome, studente1.cognome, studente1.matricola)

studente2 = Student()

studente2.nome = "Luigi"
studente2.cognome = "Verdi"

print()
print("studente2:", studente2.nome, studente2.cognome, studente2.matricola)

