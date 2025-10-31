````md
# Comandi Git Fondamentali

## 1. Git init
**A cosa serve:** Crea un nuovo repository Git all’interno di una cartella, impostandola come progetto tracciato e generando la directory nascosta `.git` che conterrà tutte le informazioni di versione.

```bash
git init nuovo-progetto
````

## 2. Git config

**A cosa serve:** Imposta le preferenze personali di Git, come nome, email o editor da utilizzare nei messaggi di commit. Le configurazioni possono essere applicate globalmente o solo per un singolo repository.

```bash
git config --global user.email "mario.rossi@example.com"
```

## 3. Git add

**A cosa serve:** Inserisce i file selezionati nell’area di staging, segnalandoli a Git come pronti per essere salvati nel prossimo commit.

```bash
git add src/app.js assets/logo.png
```

## 4. Git commit

**A cosa serve:** Registra in modo permanente le modifiche presenti nello staging area, creando un nuovo punto di salvataggio nella cronologia del progetto con un messaggio esplicativo.

```bash
git commit -m "Implementata la logica del form di contatto"
```

## 5. Git clone

**A cosa serve:** Duplica un repository remoto sul proprio computer, includendo tutti i file, i branch e la cronologia del progetto.

```bash
git clone https://github.com/utente/app-web.git
```

## 6. Git status

**A cosa serve:** Mostra un riepilogo dello stato del repository locale, indicando quali file sono stati modificati, aggiunti, rimossi o non tracciati.

```bash
git status
```

## 7. Git log --oneline --all --graph

**A cosa serve:** Fornisce una panoramica sintetica della cronologia dei commit, rappresentando graficamente le ramificazioni e le fusioni di tutti i branch.

```bash
git log --oneline --all --graph
```

## 8. Git restore --staged

**A cosa serve:** Toglie un file dall’area di staging senza annullare le modifiche nel working directory, utile per rimuovere per errore file preparati per il commit.

```bash
git restore --staged src/main.js
```

## 9. Git remote add

**A cosa serve:** Collega il repository locale a uno remoto, assegnandogli un nome per facilitarne la gestione durante le operazioni di push e pull.

```bash
git remote add origin https://github.com/utente/app-demo.git
```

## 10. Git branch

**A cosa serve:** Permette di creare, elencare o gestire i branch di sviluppo del progetto. È utile per lavorare su nuove funzionalità senza modificare il ramo principale.

```bash
git branch feature-dashboard
```
