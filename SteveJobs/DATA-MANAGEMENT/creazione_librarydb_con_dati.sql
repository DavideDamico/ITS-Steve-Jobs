-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Ott 14, 2025 alle 14:34
-- Versione del server: 10.4.32-MariaDB
-- Versione PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarydb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `author`
--

CREATE TABLE `author` (
  `AuthorID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Birth` date DEFAULT NULL,
  `Bio` varchar(500) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `author`
--

INSERT INTO `author` (`AuthorID`, `FirstName`, `LastName`, `Birth`, `Bio`, `IsDeleted`) VALUES
(1, 'Gaetano', 'Zaccardo', '1971-10-14', 'Giustizia sorprendere treno poeta. Presidente ecco causa accompagnare e.\nMarito addirittura insistere isola. Cielo sposare spingere fine correre.\nGrado proposta prato porta. Vestire moglie addosso davanti civiltà mente conto. Rompere principio dimenticare moglie uno.\nAvvertire trarre coprire. Secolo tranquillo comunicazione infine. Studio carne estero sotto lui bianco partecipare onore.\nAmpio insegnare contro bene. Gioco io giardino automobile.', 0),
(2, 'Maurizio', 'Zetticci', '1962-10-14', 'Caffè ammettere serie inizio provocare avvocato durare. Principale ragazzo ognuno lontano oggi li necessario lasciare. Morte scoppiare potere labbro animale.\nDisporre animale alzare ma pagare. Tempo grazie opporre carattere divenire articolo.\nProva tacere regno uscire scherzare. Raccontare contento ridurre industria.\nInizio presidente tutto aumentare caso.\nComune scoppiare servizio coprire. Proposito necessità battere condizione. Libero numero pericolo buono.', 0),
(3, 'Ronaldo', 'Leblanc', '1937-10-14', NULL, 0),
(4, 'Cassandra', 'Foà', '1944-10-14', 'Vostro stabilire roba rivolgere stringere. Mandare capello realtà qualche quarto contenere.\nCondurre proporre a scoprire villa seguito probabilmente. Verde perciò dietro scappare appunto signora polizia campo. Valore partire tenere puro riprendere medico.\nAmare bello affare interesse andare colpire bisognare. Passato cominciare oramai guerra seguire. Studiare compiere annunciare importante procedere prevedere base. Notte forse promettere giù città trovare.', 0),
(5, 'Severino', 'Chiaramonte', '1988-10-14', NULL, 0),
(6, 'Maria', 'Comisso', '1982-10-14', NULL, 0),
(7, 'Ugo', 'Galtarossa', '1947-10-14', 'Fiore buttare pure sognare estate neanche nemmeno sole. Salvare dire morire contatto soltanto preoccupare serio.\nSera oramai stella civile opinione rosso. Gusto passare nessuno ordinare. Fiume giustizia un ripetere. Poesia numero recente corsa aggiungere presidente grado idea.\nDentro suo periodo no quindi. Finalmente aiutare scappare abbastanza religioso attaccare che.\nEffetto capo gusto assistere assistere bambino erba. Crescere baciare sviluppo atteggiamento.', 0),
(8, 'Luciano', 'Spinelli', '1984-10-14', 'Cortile altro continuo scienza assumere caldo chiave. Contrario foglia vista battere.\nPelle egli meglio privato città compagnia. Povero scomparire intanto posto dolce.\nVendere prodotto pianura conseguenza scrivere. Cattolico causa speciale mostrare riconoscere trasformare ritenere.\nComprare proprio perché spegnere qualsiasi estremo parlare parola. Messa latino poeta meritare isola consentire compagno.', 0),
(9, 'Monica', 'Boito', '1968-10-14', 'In mestiere ricerca tecnico posare peccato. Affatto pure bestia nessuno discutere. Camminare libero gioco qualità meglio oggetto.\nSignora primo andare molto persona riguardare servire pesare. Vita rispetto tirare professore evitare. Certamente osservare sopra croce inoltre affermare camera.\nPassare corrente temere né. Mancare operazione potere. Portare cantare popolazione trasformare cominciare famoso grosso crisi.\nNazionale sperare naturalmente vino offrire ammettere.', 0),
(10, 'Coriolano', 'Biagiotti', '1987-10-14', 'Eppure ma decisione conseguenza accordo poco epoca. Risultare misura elevare minuto posto. Accadere marito meno compagno determinare.\nGodere qua sentimento celebrare qualcuno fatto. Procedere vincere bere attuale. Serie con terreno nascondere anzi film.\nNazionale condurre svolgere disposizione. Assicurare camminare estremo figurare sud solo.\nRaccontare presidente folla rosso riprendere presenza. Ieri epoca mattino. Organizzare aggiungere invece isola tacere possedere fermo aria.', 0),
(11, 'Greca', 'Rastelli', '1985-10-14', 'Conservare pieno colpa lasciare. Mezzo studiare passione lira ferire aria.\nValore lato ammettere distanza bosco. Nero sedere paese assai.\nOnore nudo funzione ferire occhio felice angolo. Crisi centro corsa. Sera peso povero lui guardare.\nDiventare seguire punta atteggiamento vivere impossibile campagna. Entro sotto ciascuno nave. Piano prendere giudicare spettacolo classe paura. Sedere piacere presso motivo difficile.', 0),
(12, 'Milo', 'Abatantuono', '1940-10-14', NULL, 0),
(13, 'Gianpietro', 'Errigo', '1986-10-14', NULL, 0),
(14, 'Flora', 'Interiano', '1973-10-14', 'Attuale prima importanza fratello. Sorgere controllo repubblica aiuto elettrico.\nConsiglio materia esporre davanti.\nOrganizzare ottenere magari erba regno confessare intanto stampa. Buono né amare notare.\nAttaccare determinare dividere rivoluzione principio. Descrivere elettrico bambino ma servire.\nBadare toccare visita corpo monte posto dirigere. Frutto se magari sorprendere università.\nFuggire cattolico rifiutare spiegare indietro. Dipendere piangere fra uno sviluppo tra.', 0),
(15, 'Aldo', 'Alfieri', '1985-10-14', 'Scusare dinanzi condurre esprimere contatto. Sostenere decisione sonno soltanto.\nGridare stamattina dove presente ufficiale nulla. Enorme modo trattare motivo argomento. Vostro troppo almeno.\nOppure mattina allontanare. Svegliare processo controllo italiano pubblicare spirito importante. Ferire conoscenza rapido contro.\nOpinione mangiare arte a accadere. Annunciare popolo posto tedesco generale.', 0),
(16, 'Rosalia', 'Polizzi', '1995-10-14', 'Civiltà crescere sorgere pazzo. Profondo ammettere presentare giugno.\nCostringere diretto prendere metà oggi serie comunque.\nScoppiare attorno quasi quindi sicuro domenica. Pubblicare croce fratello coscienza moglie sonno.\nGrigio distinguere basso privato. Adesso cui avanti spettacolo incontrare enorme.\nOppure liberare riprendere stampa messa comprare motivo. Dipendere perfino ministro colore caro.\nStoria vasto angolo inverno origine. Inglese accogliere viaggio don già comprare vestire.', 0),
(17, 'Pierina', 'Cainero', '1950-10-14', 'Vero dentro assistere fissare bocca. Bravo comodo anima zitto ottenere. Opinione pezzo gridare destro.\nSegnare internazionale quasi limitare scoprire. Porto intendere suonare sede. Base grigio dovere costituire rompere luna stringere.\nPovero rivedere giorno senza. Misura prevedere dolce occasione neanche.\nAncora non sostenere aiutare. Offendere stasera sentire pranzo lingua. Matrimonio rivolgere periodo presenza.', 0),
(18, 'Berenice', 'Palmisano', '1971-10-14', NULL, 0),
(19, 'Ranieri', 'Catalano', '1937-10-14', 'Espressione valere spegnere volto verità stesso piangere.\nLeggere numero riva onore. Indietro mercato circa preciso basso.\nVoce pelle limitare piangere loro trattare sede.\nOrecchio dolore periodo subito silenzio avvertire.\nScusare volere indicare collo età. Giudizio assistere aiuto vivo stanza sposare. Meno fede fornire maggiore contro.\nMilione mi maestro meglio strano piazza ragazzo testa. Signora importare parlare diventare spesso segreto lotta. Uscire fame occorrere spingere messa.', 0),
(20, 'Rosaria', 'Ligorio', '1995-10-14', NULL, 0),
(21, 'Emilio', 'Angeli', '1972-10-14', 'Pietra teatro principale riconoscere. Vostro largo eppure immaginare rientrare trovare inoltre linea. Tranquillo tavolo peccato nobile animale grazie.\nMessa pelle pianura passo erba cittadino divenire. Centro calcio mentre oramai o destro trascinare. Diretto dedicare conservare aiuto odore condurre questo. Restare raccontare prova scrittore.\nSituazione passato lotta cavallo. Assoluto crescere scendere sud romano affrontare.', 0),
(22, 'Emma', 'Angeli', '1963-10-14', NULL, 0),
(23, 'Benedetto', 'Cianciolo', '1965-10-14', 'Suo quadro minuto sapere.\nPregare appena direzione. Inglese esempio dunque bestia intendere aria. Aspetto politica uguale voglia grigio arte.\nCasa studio crisi crisi prevedere. Permettere vino battere gioco. Male bestia bagno sognare chi sicurezza essere.\nMale direzione elemento città sacrificio affatto. Roba dire controllo semplice insomma crisi. Privato qualunque atto ne rivelare sacro principio.\nPeso cattivo strada pranzo invitare continuo mestiere. Voce proprio ah.', 0),
(24, 'Ludovico', 'Campanella', '1995-10-14', 'Ritornare disposizione stanza ognuno base fatica. Conseguenza conoscenza esperienza atteggiamento porto. Idea chiedere pietra svegliare storico senza internazionale. Difesa enorme politica decidere ordinare niente ripetere.\nRiva rimanere svegliare tranquillo. Ordine dolce oppure difficile militare mangiare trarre suonare.\nPadre osservare italiano storico ritornare chiave.', 0),
(25, 'Alphons', 'Avogadro', '1975-10-14', NULL, 0),
(26, 'Flavio', 'Morandini', '1969-10-14', NULL, 0),
(27, 'Claudio', 'Maglio', '1960-10-14', 'Circa attenzione scrivere città potere idea sala. Difficile condizione proposta creare diventare. Secondo sereno problema servizio sede.\nStudio rappresentare appunto istituto ricchezza grado ammazzare. Imporre bastare rappresentare cucina.\nLegge lontano guidare veramente tuttavia soldato o. Importante insistere presidente voce.\nBisognare conto ospedale bambina popolo. Inverno provincia linea straniero niente. Regno chiaro sorprendere pronto amore.', 0),
(28, 'Ninetta', 'Pastine', '1946-10-14', 'Moglie eccetera dentro più bestia ciascuno. Nome gente assai fortuna capire gioco insieme.\nColore repubblica vero periodo soltanto egli massimo. Personale necessità dimenticare repubblica piuttosto lei nessuno. Giù rivedere fiume forte circa.\nLegare bestia sbagliare assumere fuggire. Noto destro vero quanto opinione effetto. Descrivere comprare lo caratteristico animo zona.', 0),
(29, 'Giustino', 'Cortese', '1988-10-14', 'Commissione ridurre ammettere ammettere. Tra popolo ritenere nero madre direzione. Mestiere conto perciò divenire stabilire. No sorprendere chilometro personale luce pietra.\nDinanzi amare causa scena affrontare. Incontrare avvocato malattia costruzione proposito caldo. Compagnia preferire possedere peso filo.\nMadre scomparire perfetto regione. Leggere uso ordinare secolo. Tuttavia semplice rivolgere domanda offrire meno.', 0),
(30, 'Rodolfo', 'Spallanzani', '1990-10-14', 'No bambino costringere mentre fondare movimento partito. Voce là mostrare erba ascoltare ritenere distinguere.\nFinire finché posizione metro. Impedire scrivere diritto elemento operazione nord dipendere.\nAssai freddo forza insomma lei figurare continuare. Accettare politico vi significare quanto.\nTacere iniziare realtà ne prevedere posizione. Svegliare futuro sforzo sede notare ogni.\nPreferire neanche pianura situazione cortile. Occhio parecchio romano. Infatti triste poiché fatto chissà.', 0),
(31, 'Baccio', 'Trotta', '1938-10-14', NULL, 0),
(32, 'Barbara', 'Biagi', '1981-10-14', 'Oh notevole distanza silenzio ricchezza interesse appoggiare poeta. Occhio tentare occasione chiesa abbandonare. Giornata in avvertire riferire particolare un nulla.\nAiutare territorio rappresentare passione pane significare paese soldato. Fiore cantare largo presente necessità dipendere. Segretario qua osservare proposta certamente. Secondo chiedere adesso attorno quindi distanza.\nDomandare pranzo offrire rappresentare. Opera sottile autore nero lei parete addirittura.', 0),
(33, 'Martino', 'Ammaniti', '1985-10-14', 'Vento entro ricchezza perfino.\nArticolo tenere solito latino riconoscere udire. Avvertire occhio grave aria oramai. Base posizione anche difficile.\nVia lavoro pubblico niente avvocato soldato. Mano dito straniero uguale parte.\nSviluppo opinione peggio avanzare risultato. Principale tanto parete dolce subito sorridere comunicazione. Largo potenza maestro domanda cioè fame gesto.', 0),
(34, 'Sergius', 'Bompiani', '1961-10-14', 'Papà atto studiare signorina.\nChiudere studio considerare possedere lì. Neanche diverso europeo dubbio. Oggetto limitare pelle tavola periodo.\nLinea mandare sistema attesa caldo. Divenire tedesco venire vestire organizzare qualsiasi.\nFiglia necessario tra sbagliare ridere sperare materia. Materia occorrere osservare seguire automobile forma.\nLo viso città esistere basso. Rientrare chilometro reale pezzo. Idea in espressione serie.', 0),
(35, 'Orazio', 'Filippini', '1951-10-14', 'Smettere davvero osservare monte. Guardare latino gruppo pane procedere famoso.\nNudo porta sole ragazza rosso alzare. Giardino giudizio tuttavia lontano bastare campagna sognare.\nProduzione caratteristico titolo rendere storia. Mare attore soprattutto forma chiamare tacere cantare.\nRappresentare determinare dormire gente. Sì braccio sì.\nMancare là famiglia esperienza francese. Qualcuno sorridere chiudere cuore discutere.', 0),
(36, 'Sandra', 'Gagliano', '1995-10-14', 'Giusto scrittore e salutare creare perfetto offendere. Qualsiasi ognuno vario commissione cura.\nPomeriggio volere peso risolvere conto sforzo. Lavorare superare facile già dio.\nTono assicurare silenzio popolazione viso fantasia fiducia normale. Osservare terreno risultare conoscenza notizia. Svegliare servire preoccupare invece avvenire pietà fede.\nAssai li casa medio luce uno corrente.', 0),
(37, 'Gianna', 'Corradi', '1939-10-14', 'Rapido li termine tentare togliere. Camera atteggiamento il particolare.\nPadrone attore animo immagine colore nemmeno maniera. Signore profondo luce mio intendere caffè. Eccetera normale aprire desiderio famoso causa.\nLegare guidare vincere. Apparire seguire avanzare giovanotto sposare diretto lui.\nPreparare istituto sonno accadere perfino importare posto collo. Camera risultato senso regione. Spegnere serie desiderio alcuno.\nCorrente muovere fede.', 0),
(38, 'Marcella', 'Finotto', '1957-10-14', NULL, 0),
(39, 'Graziella', 'Martucci', '1941-10-14', 'Atto militare bisogno sede colpo già tacere. Togliere programma volto superiore.\nAvvenire bianco battere posto capitare facile considerare avanti. Donna energia dopo tacere raggiungere.\nFilm domenica sede. Muro accadere giugno mi assistere pezzo.\nPoeta unico appoggiare unire dito rispondere attenzione.\nNaturalmente articolo vero il interessare prevedere volontà. Battaglia pubblicare inverno largo preoccupare dire vedere. Parlare migliore passare centrale tanto situazione.', 0),
(40, 'Ippazio', 'Cesarotti', '1963-10-14', NULL, 0),
(41, 'Gianfrancesco', 'Cagnin', '1991-10-14', NULL, 0),
(42, 'Ricciotti', 'Majewski', '1966-10-14', 'Religioso bestia e mondo fresco lo. Personaggio stella limite estero eccellenza però simile congresso. Piede stamattina stazione amico contrario vincere essere.\nPresidente pazzo prossimo relazione occorrere erba. Mente eppure genere grave greco. Ringraziare cercare vestito arrestare questione treno.\nMente idea guerra strumento volto guardia villa. Mamma bene grado giovanotto. Argomento parlare senza origine.', 0),
(43, 'Annalisa', 'Cattaneo', '1980-10-14', NULL, 0),
(44, 'Fedele', 'Ioppi', '1984-10-14', 'Finalmente seguire spazio amico istante voi. Mostrare morte carta fabbrica industria.\nFunzione parecchio francese giovane vero nero erba. Campagna dottore parte signorina contrario.\nMano pericoloso possibile. Stella tentare scomparire croce.\nMerito chilometro togliere escludere che dito caldo. Passo sottile straniero se. Qualsiasi breve soluzione industriale dire.\nPiano perfetto dolore comprare. Punta lotta spalla perfino.', 0),
(45, 'Elena', 'Ciani', '1974-10-14', 'Differenza evitare tono ponte sostenere. Avvertire segno religioso. Tratto sonno armare società fiducia.\nRiva bambino fra qualcosa permettere. Sereno pomeriggio abitare militare fresco organizzare pensare.\nSolo commercio confronto pelle. Come politico rifiutare fino speciale. Aprire assistere maggiore elettrico industria appena abitare ecco.\nElettrico luogo abito titolo svolgere. Meglio mi conto tu casa esistere comporre.', 0),
(46, 'Sandro', 'Martinelli', '1984-10-14', 'Sorridere proposito ordinare appartenere. Termine frase rapporto onore passare trarre.\nRegno terzo passo parlare. Volare costituire metà. Tardi strano rapido consentire terreno guardare rispetto contro.\nEnergia comunicazione appoggiare film raccogliere aggiungere parete. Base seguire preferire. Parere cominciare né guerra fine riempire accanto.\nUfficio bianco disposizione. Coscienza davanti ringraziare giusto baciare. Dolore imparare ritrovare nobile moderno.', 0),
(47, 'Arnulfo', 'Battisti', '1952-10-14', NULL, 0),
(48, 'Ronaldo', 'Mondadori', '1938-10-14', 'Colpire maestro milione. Uomo stazione mandare sbagliare bello faccia.\nAumentare pieno marito legge neppure parlare processo elettrico. Parola neanche attorno intorno inoltre esame.\nGreco organizzare processo punta poiché. Piacere concludere triste. Tavola smettere comunque.\nAtteggiamento sicurezza aria russo innamorare. Vino attraversare egli fermo resto proposito significare.', 0),
(49, 'Laura', 'Avogadro', '1969-10-14', 'Paese pelle naturale mancare contadino valle sicuro. Segreto perciò voce provincia stato verde rapido. Mondo descrivere aspettare porta subito colpo imporre.\nSi uso considerare giardino impossibile. Là materia medico soldato trarre parecchio.\nMateria mostrare oggetto posare estendere altro giallo. Sistema fondo cominciare.\nSorella superare pomeriggio battaglia fumare. Come povero tono metro improvviso bellezza. Elevare cantare fermare finalmente.', 0),
(50, 'Gustavo', 'Durante', '1969-10-14', 'Università pensiero malattia probabilmente filo comodo. Dove speciale aspettare elemento riguardare. Stella grave determinare attendere.\nSala fine signora semplice odore opinione comprendere. Collina aiutare noi. Vicino togliere chiudere.\nAncora speciale commercio occhio. Ne tardi giù libro teatro.\nPorre entro bastare completamente lettera misura distinguere possibilità.\nDirettore davanti soluzione grado medesimo.', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `book`
--

CREATE TABLE `book` (
  `BookID` int(11) NOT NULL,
  `BookInfoID` int(11) NOT NULL,
  `SupplierID` int(11) NOT NULL,
  `AuthorID` int(11) NOT NULL,
  `ReviewID` int(11) DEFAULT NULL,
  `Copy` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `book`
--

INSERT INTO `book` (`BookID`, `BookInfoID`, `SupplierID`, `AuthorID`, `ReviewID`, `Copy`) VALUES
(1, 74, 7, 47, NULL, 1),
(2, 164, 9, 48, NULL, 4),
(3, 116, 3, 30, NULL, 8),
(4, 76, 5, 8, 26, 6),
(5, 9, 6, 29, NULL, 5),
(6, 191, 2, 49, 33, 5),
(7, 147, 6, 12, NULL, 1),
(8, 136, 4, 47, NULL, 7),
(9, 61, 7, 31, NULL, 1),
(10, 94, 4, 2, 34, 5),
(11, 174, 9, 46, NULL, 9),
(12, 125, 9, 20, 65, 7),
(13, 54, 6, 48, 79, 4),
(14, 169, 10, 9, NULL, 3),
(15, 21, 1, 30, 12, 2),
(16, 15, 1, 31, 6, 4),
(17, 17, 4, 33, NULL, 3),
(18, 173, 8, 12, NULL, 8),
(19, 65, 6, 41, NULL, 6),
(20, 76, 3, 17, NULL, 7),
(21, 45, 2, 8, NULL, 10),
(22, 159, 10, 30, NULL, 7),
(23, 58, 8, 34, NULL, 8),
(24, 84, 9, 26, NULL, 9),
(25, 27, 9, 49, NULL, 8),
(26, 167, 1, 9, NULL, 6),
(27, 161, 1, 46, NULL, 7),
(28, 34, 9, 45, 31, 3),
(29, 51, 7, 18, NULL, 3),
(30, 155, 10, 28, 54, 6),
(31, 121, 4, 36, 50, 9),
(32, 132, 4, 28, NULL, 6),
(33, 59, 10, 5, NULL, 2),
(34, 11, 1, 22, 16, 9),
(35, 131, 6, 11, NULL, 3),
(36, 34, 8, 9, NULL, 1),
(37, 24, 3, 20, NULL, 5),
(38, 109, 2, 37, 72, 10),
(39, 55, 9, 5, NULL, 1),
(40, 84, 1, 16, NULL, 3),
(41, 110, 8, 6, NULL, 10),
(42, 150, 7, 31, NULL, 10),
(43, 114, 5, 7, NULL, 8),
(44, 190, 4, 32, NULL, 9),
(45, 179, 2, 41, 8, 1),
(46, 3, 4, 30, 58, 7),
(47, 142, 10, 45, 8, 3),
(48, 106, 4, 5, NULL, 5),
(49, 3, 8, 38, NULL, 6),
(50, 128, 10, 9, 59, 4),
(51, 66, 10, 26, NULL, 9),
(52, 116, 6, 6, NULL, 9),
(53, 14, 1, 30, NULL, 6),
(54, 75, 4, 17, NULL, 2),
(55, 169, 5, 20, NULL, 10),
(56, 161, 3, 5, 3, 6),
(57, 149, 10, 4, 34, 10),
(58, 11, 6, 1, NULL, 6),
(59, 193, 8, 2, 67, 9),
(60, 156, 10, 6, NULL, 3),
(61, 43, 9, 24, 39, 2),
(62, 180, 9, 10, 53, 1),
(63, 71, 6, 8, NULL, 6),
(64, 102, 5, 29, 29, 5),
(65, 190, 2, 2, NULL, 6),
(66, 135, 8, 16, NULL, 5),
(67, 95, 7, 36, NULL, 6),
(68, 110, 9, 13, NULL, 2),
(69, 91, 8, 49, NULL, 2),
(70, 45, 6, 48, NULL, 10),
(71, 75, 3, 27, NULL, 5),
(72, 35, 1, 18, NULL, 5),
(73, 107, 2, 2, NULL, 5),
(74, 195, 1, 30, NULL, 5),
(75, 190, 8, 25, NULL, 4),
(76, 41, 1, 41, 39, 9),
(77, 17, 5, 19, NULL, 6),
(78, 156, 2, 27, NULL, 4),
(79, 24, 4, 5, NULL, 9),
(80, 175, 3, 19, 54, 10),
(81, 26, 3, 17, NULL, 4),
(82, 189, 4, 36, 23, 9),
(83, 121, 5, 4, 15, 8),
(84, 32, 9, 36, 1, 8),
(85, 157, 2, 19, NULL, 7),
(86, 42, 2, 23, NULL, 1),
(87, 102, 10, 22, NULL, 3),
(88, 1, 6, 14, NULL, 3),
(89, 175, 6, 12, NULL, 6),
(90, 27, 1, 2, 36, 2),
(91, 195, 10, 1, NULL, 8),
(92, 151, 10, 29, 22, 3),
(93, 179, 6, 26, 68, 10),
(94, 131, 1, 25, NULL, 2),
(95, 189, 7, 20, NULL, 7),
(96, 180, 10, 25, NULL, 2),
(97, 77, 10, 10, 37, 8),
(98, 153, 1, 6, NULL, 4),
(99, 166, 6, 27, 33, 10),
(100, 173, 4, 45, NULL, 8),
(101, 8, 3, 28, NULL, 3),
(102, 186, 10, 32, NULL, 4),
(103, 94, 7, 12, NULL, 4),
(104, 59, 3, 45, 55, 1),
(105, 163, 10, 42, 3, 6),
(106, 129, 5, 4, 36, 5),
(107, 35, 5, 8, NULL, 6),
(108, 75, 9, 40, NULL, 10),
(109, 52, 5, 43, NULL, 3),
(110, 103, 9, 48, NULL, 9),
(111, 63, 2, 32, 75, 3),
(112, 154, 4, 21, 21, 3),
(113, 23, 9, 1, 14, 4),
(114, 145, 7, 42, NULL, 9),
(115, 149, 7, 40, NULL, 10),
(116, 2, 9, 44, 71, 4),
(117, 112, 3, 26, 58, 5),
(118, 184, 5, 6, 43, 10),
(119, 124, 5, 11, NULL, 5),
(120, 199, 8, 34, NULL, 10),
(121, 82, 7, 1, 6, 4),
(122, 181, 7, 25, NULL, 10),
(123, 11, 4, 22, NULL, 6),
(124, 174, 2, 50, NULL, 9),
(125, 143, 6, 45, 45, 8),
(126, 197, 3, 43, NULL, 4),
(127, 41, 6, 48, NULL, 1),
(128, 160, 2, 3, 47, 1),
(129, 182, 3, 19, NULL, 10),
(130, 94, 5, 27, NULL, 3),
(131, 79, 1, 49, NULL, 8),
(132, 147, 5, 2, NULL, 2),
(133, 53, 10, 30, NULL, 10),
(134, 176, 6, 48, 69, 7),
(135, 5, 1, 16, NULL, 9),
(136, 67, 10, 4, 43, 9),
(137, 39, 8, 30, NULL, 3),
(138, 90, 7, 19, 70, 7),
(139, 91, 3, 27, 34, 9),
(140, 17, 1, 46, 62, 2),
(141, 88, 2, 13, 10, 1),
(142, 6, 10, 16, 78, 10),
(143, 58, 9, 20, 72, 2),
(144, 141, 6, 25, NULL, 2),
(145, 69, 7, 21, 55, 4),
(146, 92, 7, 18, NULL, 9),
(147, 183, 5, 1, NULL, 8),
(148, 195, 3, 14, 9, 10),
(149, 13, 3, 43, NULL, 7),
(150, 33, 9, 50, NULL, 3),
(151, 34, 3, 40, NULL, 1),
(152, 163, 10, 32, 45, 6),
(153, 60, 8, 44, 73, 1),
(154, 13, 7, 3, NULL, 6),
(155, 146, 6, 8, NULL, 5),
(156, 171, 10, 5, NULL, 4),
(157, 134, 3, 6, NULL, 4),
(158, 55, 1, 19, NULL, 1),
(159, 82, 4, 9, NULL, 4),
(160, 117, 3, 27, 61, 8),
(161, 23, 3, 14, 33, 3),
(162, 181, 1, 17, 41, 9),
(163, 155, 5, 46, 31, 9),
(164, 132, 7, 42, 10, 3),
(165, 91, 6, 14, NULL, 1),
(166, 14, 1, 46, NULL, 8),
(167, 113, 5, 35, NULL, 3),
(168, 80, 2, 33, NULL, 3),
(169, 158, 8, 47, 68, 3),
(170, 194, 7, 35, 38, 4),
(171, 145, 7, 18, 31, 4),
(172, 5, 4, 46, NULL, 5),
(173, 99, 7, 26, 37, 4),
(174, 144, 7, 38, NULL, 9),
(175, 42, 5, 14, NULL, 2),
(176, 72, 9, 10, NULL, 4),
(177, 42, 6, 42, NULL, 5),
(178, 150, 4, 25, 37, 10),
(179, 6, 4, 3, 11, 7),
(180, 87, 3, 7, NULL, 1),
(181, 169, 5, 12, 23, 8),
(182, 194, 6, 42, 19, 8),
(183, 3, 5, 5, 76, 2),
(184, 15, 7, 33, 17, 2),
(185, 120, 3, 21, NULL, 1),
(186, 66, 5, 36, 41, 6),
(187, 88, 6, 32, NULL, 4),
(188, 168, 8, 3, NULL, 10),
(189, 145, 4, 30, NULL, 9),
(190, 176, 3, 27, 61, 8),
(191, 142, 3, 38, NULL, 6),
(192, 129, 9, 1, NULL, 3),
(193, 59, 6, 13, NULL, 8),
(194, 46, 5, 11, 19, 4),
(195, 130, 5, 1, 72, 10),
(196, 46, 10, 17, NULL, 2),
(197, 143, 8, 17, 77, 7),
(198, 162, 9, 20, NULL, 8),
(199, 122, 7, 32, 29, 1),
(200, 27, 9, 45, NULL, 9),
(201, 107, 6, 42, 61, 9),
(202, 66, 10, 48, NULL, 7),
(203, 125, 1, 2, 35, 10),
(204, 20, 8, 22, 34, 1),
(205, 22, 6, 27, 25, 8),
(206, 54, 2, 1, NULL, 3),
(207, 167, 2, 12, NULL, 9),
(208, 41, 7, 2, NULL, 9),
(209, 165, 9, 45, 70, 8),
(210, 159, 8, 45, NULL, 8),
(211, 93, 2, 16, NULL, 9),
(212, 189, 7, 3, NULL, 1),
(213, 124, 6, 15, NULL, 6),
(214, 40, 6, 26, NULL, 10),
(215, 164, 7, 10, NULL, 6),
(216, 25, 6, 21, NULL, 6),
(217, 152, 4, 36, NULL, 8),
(218, 170, 4, 37, NULL, 5),
(219, 86, 2, 45, NULL, 8),
(220, 180, 2, 50, 32, 2),
(221, 55, 5, 14, 11, 2),
(222, 31, 1, 9, NULL, 7),
(223, 143, 7, 30, NULL, 5),
(224, 94, 10, 42, NULL, 2),
(225, 138, 4, 15, NULL, 7),
(226, 1, 5, 38, NULL, 7),
(227, 100, 5, 47, 69, 10),
(228, 155, 6, 1, 9, 9),
(229, 87, 9, 1, NULL, 3),
(230, 2, 10, 31, 10, 5),
(231, 81, 2, 41, 29, 4),
(232, 73, 4, 22, NULL, 1),
(233, 195, 6, 12, 57, 6),
(234, 183, 9, 20, NULL, 9),
(235, 37, 6, 11, NULL, 6),
(236, 39, 9, 38, 26, 5),
(237, 78, 1, 24, 15, 3),
(238, 77, 9, 36, 31, 2),
(239, 116, 7, 26, 15, 7),
(240, 179, 8, 16, 53, 9),
(241, 36, 6, 15, 2, 6),
(242, 179, 8, 48, NULL, 3),
(243, 37, 8, 12, 67, 8),
(244, 66, 1, 28, 62, 10),
(245, 106, 6, 26, 61, 7),
(246, 100, 3, 8, NULL, 6),
(247, 42, 9, 21, 3, 3),
(248, 84, 7, 29, 36, 10),
(249, 190, 6, 18, NULL, 9),
(250, 100, 3, 2, NULL, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `bookinfo`
--

CREATE TABLE `bookinfo` (
  `BookInfoID` int(11) NOT NULL,
  `Title` varchar(200) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `PublicationYear` date DEFAULT NULL,
  `Language` varchar(30) DEFAULT NULL,
  `Summary` varchar(1000) DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT 1,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `bookinfo`
--

INSERT INTO `bookinfo` (`BookInfoID`, `Title`, `Description`, `PublicationYear`, `Language`, `Summary`, `IsAvailable`, `IsDeleted`) VALUES
(1, 'Massimo costituire arma oltre rosso mentre', 'Gusto collina cattivo serie. Sacro passione attività. Servizio sorriso problema.\nSistema intero maniera tutto giocare guerra bosco. Straordinario giudicare riguardare riprendere rivedere fiume animale. Parola ricordo animale semplice affrontare.\nInvitare indietro morte quadro scomparire zona. Soluzione come campo bisognare indicare. Comprendere cadere temere scrittore giugno piantare.\nRiportare intero succedere. Proporre linea scusare viaggio fresco.', '2021-10-14', 'Tedesco', 'Attaccare gamba faccia stagione ragazzo. Memoria sicurezza porre intanto fresco futuro circa. Essa accadere resistere io formare. Imparare chiaro tratto guerra alto albergo.\nMuro principio matrimonio pubblico colore controllo. Commercio insieme simile vasto rivolgere. Prato innamorare politico serie.\nDividere ritrovare fenomeno chilometro. Grazia opinione cuore perfino programma trovare governo.\nViaggio intero costa fortuna dividere nascere militare. Parlare sonno distruggere politica. Descrivere soluzione stringere durare.\nDividere chiedere minuto luna politico. Chi forma divertire mancare spegnere. Fianco morte preciso crescere leggere toccare.\nLibertà recare meritare moglie lavorare popolazione aprire aprire. Probabilmente giovanotto appena gesto origine chiaro fiore possedere.\nVolare secolo lingua. Distruggere badare gente rispetto uso.\nErba vista valore popolazione compiere. O cercare chiamare speranza fuggire nudo regno proposta. Serio unico attore immaginare battere cittadino.', 1, 0),
(2, 'Albero importanza elevare', 'Umano caldo paese stagione proposta accorgersi cui. Forte semplice relazione folla. Intanto onore usare fianco.\nBaciare conseguenza aspettare animo lago crisi. Riva affrontare proposito rifiutare bruciare lingua. Tra pagare perché soprattutto sguardo.\nSistema forma chiesa minuto fuoco. Insieme stato bisognare attività. Pensiero buttare giudicare notare aumentare inizio.\nPossedere regno preparare armare scopo. Nuovo cuore perdere. Riempire parete vestito segretario primo fede entrare.', '1992-10-14', 'Francese', 'Sorridere voglia assai vendere. Ricerca risolvere tardi ritenere anche scendere limite fumare.\nPrendere rapporto venire spirito. Avvocato religioso trattare piantare.\nDestro niente posare frase compagnia accogliere chiaro. Sera fiore lasciare sì. Usare processo accogliere ascoltare valore accettare togliere corsa.\nChilometro produzione limite. Attore parete braccio cittadino.\nScorrere ci cosa resto ringraziare piantare fuggire. Qualunque fissare niente tempo.\nCambiare leggere soltanto dimenticare prezzo. Da vero povero. Ritornare lira condurre tedesco quale colpo differenza. Comprendere appoggiare giusto sposare risolvere abbandonare.\nAncora palazzo presenza disposizione albergo università anche. Uscire privato finestra rientrare nulla lontano ampio.\nNotevole nazionale carta offrire muro. Regione nudo richiedere chiedere chiave.\nSoprattutto utile grande centro freddo parete macchina.', 1, 0),
(3, 'Se cantare impressione', 'Spegnere papà neppure ospedale. Li figura guidare giudicare scoppiare. Duro giro simile felice militare fianco.\nControllo svolgere speranza accendere. Estremo diffondere compagno appoggiare parecchio partire esso.\nPronto piangere probabilmente istituto. Ricerca piano interessante valere. Fabbrica nostro davanti accordo giro.\nPrendere porre neanche aggiungere roba pranzo. Attenzione nascere riuscire figurare società.', '2009-10-14', 'Tedesco', 'Bosco egli compagnia richiedere compagno. Davvero nostro freddo voglia pena personale continuo. Aiutare nave roba monte resto latino appoggiare.\nGiornata battere oppure tirare speciale appunto. Bestia stasera temere cane limite niente sociale.\nAnima mattina confessare lei realtà. Finire esercito signorina regione provocare.\nAvvertire desiderio raccontare bocca giro imporre porre. Naturale fortuna bruciare medesimo. Parlare fabbrica chilometro ultimo vuoto.\nPassato persona domani duro attore. Fissare decidere ampio sereno sistema passo creare. Successo domandare stampa elemento.\nPreciso proposito studiare centrale ministro pianura. Signorina fretta esperienza ricco tagliare aprire. Folla autorità oggetto età tipo voi.\nOrdine fermo costringere metro. Pietra diventare costringere romano naturale pericolo. Diritto elettrico nostro ferire mio innamorare.\nEuropeo neanche sapere presto teatro uguale. Rivolgere credere gruppo. Massimo consentire nero grosso centro volto soprattutto.', 1, 0),
(4, 'Pensiero contro', 'Domandare base giustizia. Assumere romano essere romano pietà presenza.\nAlto libro uso desiderio inglese dentro salutare. Notevole durare minore non colpire vuoto risultato entro. Cane espressione italiano autorità accompagnare. Inglese campagna svolgere pubblico.\nSpesa qualità signora costringere madre buono fiore capello. Desiderio intendere guardia domenica ne. Lato europeo circa. Buio ricchezza porre vedere maestro denaro significare.', '1985-10-14', 'Italiano', 'Palazzo ragazzo stare mettere egli. Accorgersi appoggiare attraversare energia.\nDescrivere giudizio autorità povero osservare. Trattare base domandare scopo piazza. Condizione ministro facile assai ringraziare esistere caldo.\nLo certamente potenza risultare tono parola piccolo. Mancare vedere mano visita restare continuare stamattina. Grazia unire strano pieno allora accettare lago.\nRivelare pieno industria bianco spegnere caratteristico. Estendere decisione ciò presso. Restare oggetto religioso consiglio.\nUtile valle accanto parete nazione mio. Aiutare suo atto tenere discorso conseguenza.\nSangue finire vostro piantare indietro. Cuore materia epoca risolvere. Ufficio attraversare ma attività punto accogliere chiaro lui.\nDopo conservare organizzare. Mancare pubblicare prezzo riportare sole perfino mestiere.\nAlmeno descrivere fornire altro tuttavia lago chiedere. Legge abbastanza testa quasi.', 0, 0),
(5, 'Avvertire grazia anima', 'Nord resistere numero valere male parecchio comodo. Disposizione militare tempo pelle.\nTrovare economico volare sonno sorridere troppo.\nPaese vario fame oltre riuscire eppure.\nChiave conseguenza chiudere strano largo uomo distinguere. Meno avvocato erba attività stazione apparire. Marito ufficiale madre sacrificio godere.\nParticolare base opporre nudo bosco rientrare considerare potere. Recare mancare ufficiale segretario corso risposta bocca. Poeta macchina almeno commissione.', '1982-10-14', 'Spagnolo', 'Scena coraggio improvviso questione origine gamba genere. Arte tono tempo verso dentro.\nScegliere orecchio ritrovare indicare utile. Pensare numeroso colpire nord stamattina mattino straordinario.\nCielo avvocato fantasia ferire controllo attore. Accorgersi uccidere superiore costa.\nEssere muro lungo povero personaggio voglia. Felice pazzo fumare ponte ma resistere. A passare aumentare proporre spesa tuo regno lungo.\nPrezzo latino famoso notte raccontare. Ritrovare vista contatto insieme bocca chi. Bellezza diffondere ancora cristiano signore macchina.\nDirigere qualsiasi formare stella dove. Gioco dovere ferire onore rapporto.\nArma titolo sforzo. Fermo trascinare partecipare russo. Roba contenere particolare uccidere ci dire punta. Magari procedere lanciare promettere domandare zia importante completamente.\nInternazionale dove prezzo concedere destino segretario. Linea qua giallo azione riguardare. Affare altro gioia inoltre ministro diritto riprendere.', 1, 0),
(6, 'Arma provvedere dimenticare', 'Produzione giù lato lei. Sorriso fra nero mondo.\nFretta giudicare escludere vostro donna.\nInoltre offendere fatto libertà. Atteggiamento adesso segreto tanto andare.\nComodo azzurro signorina chissà almeno sino scappare.\nDiffondere immagine leggere cadere escludere. Zia o osservare aprire giornata o oggetto tuttavia.\nCapello tra probabilmente porta dubbio. Eh bruciare centro nascere quanto.', '1978-10-14', 'Francese', 'Accogliere attività fenomeno domandare dormire. Esempio disposizione cuore vino cane bosco.\nPranzo dietro in denaro.\nEsso gridare americano piazza breve direttore durare sentire. Processo aspetto mangiare signorina autorità scusare maggio condurre. Opinione evitare permettere autorità spegnere periodo uguale. Esempio spegnere numeroso causa ricordo salire esempio.\nAutomobile considerare direttore impressione tuttavia come. Suonare lì contrario soluzione accendere nessuno. Nazione erba periodo.\nCorso raggiungere passione faccia rappresentare animo abitare. Per accadere attento atteggiamento.\nRendere cattolico vino nemmeno dolore. Effetto piccolo svegliare aumentare.\nCambiare io rispondere mente ordinare. Stazione largo osservare con grazia qua notte. Evitare riva ombra contadino.\nLì recare bosco vino. Costituire soltanto vario luce. Rapporto normale dente circa tagliare questione fianco.\nSicuro automobile soprattutto esame. Niente abitare meno costringere.', 1, 0),
(7, 'Direzione realtà', NULL, '2003-10-14', 'Italiano', 'Labbro difesa contare prima esporre attento medesimo ragazzo.\nPresso mestiere vendere vestire nascere stella. Vento sperare attività scoprire spesa immaginare. Problema punto massa da ridere.\nPrezzo momento rispetto figurare. Parlare pagina estendere mi mentre. Restare settimana futuro russo giusto richiedere anima studiare. Ombra animale niente mezzo.\nLegare autore mettere scorrere. Vi erba ragazza triste segreto fra. Pure spesso prova proposta altro facile.\nNero aiutare rispondere lì quale. Escludere preoccupare sentimento famoso.\nOrigine affermare parlare stare ufficio. Fiume soldato estendere addirittura sognare riempire mettere. Concetto ritornare espressione ascoltare aiutare proposta.\nRealtà perché quasi sogno onore ma.\nEsporre milione distinguere vita riunire ricerca. Avvenire permettere valle riguardare. Capace credere prendere capire affermare.\nGrazia malattia domanda istituto ciò volare ragione. Fiore presentare figlio organizzare fabbrica questo.', 1, 0),
(8, 'Camera parlare paura', 'Nostro giù caro congresso madre. Principio non volta operazione moglie produrre. Appartenere aria gusto invitare verità preciso. Imporre sicuro e volere.\nDirezione croce intanto piangere posto nostro.\nSereno comporre simile. Medesimo popolo latte succedere. Quindi avanti dare greco mattino mare.\nOpera normale diritto egli cattolico. Bisogno stanco morire prato frase punta richiedere chissà. Superare secondo piacere festa arma azzurro soffrire.', '2000-10-14', 'Francese', 'Direttore occorrere ferire ragione volare. Ancora costruire nemmeno nascere lato piangere esso.\nVincere atteggiamento vicino soluzione fuoco tale contrario unico. Ministro aria rivelare tutto.\nUnire commissione coscienza. Casa metro accendere capace.\nFuturo qualunque ragazza chi consiglio invitare. Pure sviluppo fatica immaginare animo. Teatro affatto subito scena valere nemmeno. Provocare peggio ci riportare.\nAttimo riprendere appartenere. Quello mantenere erba spesso quindi.\nVincere veramente storico risolvere accompagnare capace spalla. Caso distanza giungere e. Sacro decidere dividere sposare rapporto porre risposta.\nPerfino macchina sedere tuo tentare resistere. Materia mostrare ragazza riuscire significare significare largo.\nDiscorso costruzione aiutare vostro stesso. Sistema quello inoltre italiano non monte parete. Perché riempire addosso contento tuttavia.\nNumeroso tecnico casa piazza.', 1, 0),
(9, 'Prodotto meglio male', NULL, '1979-10-14', 'Italiano', 'Foglia accogliere raccogliere volontà assai possedere notare. Intero appunto vincere energia chi capire. Tempo particolare pranzo sentire vestito.\nSuccesso bello bocca piacere quello. Partito rivoluzione via.\nFiore macchina proprio piano indietro impedire. Continuo opinione esso albero vivo ragione durante.\nPassare fuggire significare ambiente. Neanche pubblico dirigere libertà linea.\nLimitare tranquillo ma pietra volere dormire.\nNascondere oh attaccare vuoto riportare. Vestire nulla studiare elemento guidare causa civiltà.\nAttorno nuovo albergo campagna niente utile. Battaglia esprimere seguire camera. Preciso riempire serio esso costruire bellezza.\nProposito meritare società mentre se. Perfino povero eh qualsiasi qualunque.\nCattivo qualcosa resto biondo veramente forte. Punto perdere sviluppo rispetto.\nEvitare coraggio voltare lontano richiedere. Cortile compiere vino avvocato nascondere ottenere muovere. Nulla bellezza amore scuola medico fianco fatto.', 1, 0),
(10, 'Peso presto', 'Solo sinistro cattolico gridare cucina numero bere. Innamorare poiché posare azione quadro maggio secondo normale. Vita città reale perciò industriale.\nDifficoltà suo provincia intero questo. Pelle creare smettere semplice cui accordo né calcio. Braccio repubblica ridurre piazza stare.\nLei gettare fra lontano uccidere vecchio. Affermare strano sacrificio brutto mercato medico cavallo tale. Lato fra dunque aggiungere antico circa anzi mentre.', '1975-10-14', 'Inglese', 'Ombra lui limite. Maggiore ragione famoso mercato straniero.\nSacrificio neanche trarre cercare effetto strada insieme fortuna.\nNeanche articolo coscienza popolo fianco amico essa. Peccato forma conoscenza tecnico pronto.\nEstero capace ferro udire dentro serie simile intenzione. Epoca piazza gruppo bruciare coraggio grosso fiducia.\nStamattina riportare lotta tavolo.\nSotto folla inglese godere chiesa funzione. Fermare sicuro verità. Dottore nemmeno proposito autore perché eppure buio moglie.\nPeriodo commercio sentimento intorno fenomeno ufficiale. Dubbio lui invitare città. Cura giù mattino braccio.\nGesto linea vista giovanotto presenza militare affermare. Salvare libero abbandonare.\nFuturo titolo bastare preferire nemico ragione punto albero. Credere li tardi biondo.\nScorrere scappare paura industriale mondo. Spettacolo che si campo indietro. Modo azione assistere.', 1, 0),
(11, 'Speciale studiare elevare ascoltare', 'Maniera freddo amare luogo energia ascoltare. Poeta attesa appoggiare qualcosa esame risultato costruzione.\nMateria formare religioso metro. Esprimere cioè favore lato raccontare togliere povero e. Fretta descrivere puro notte montagna.\nEvitare dio tu guidare insistere. Carne tacere giorno luna dentro pietra parete particolare.\nRoba un sopra ufficiale. Resistere quanto difficoltà stella cattivo.\nPolitico fuoco stampa. Alto morte opera conservare sorgere. Meritare bastare e tentare.', '2011-10-14', 'Italiano', 'Economico anzi fede caro riempire. Pane particolare destro domanda ogni fabbrica. Origine lago figlia merito servire differenza vedere.\nPrincipe figura pezzo cortile per filo russo. Biondo il insistere occasione lavorare servizio dio. Simile finire nemico concludere recente.\nSignorina o mandare quindi modo potere. Su industria porto luna.\nFigura fiducia sangue inoltre ognuno. Istante pericolo linea invece. Giungere energia domenica trasformare. Giallo realtà disporre stasera circa umano notizia quadro.\nSereno là straniero notizia biondo presente. Ricordare corsa dare lettera. Età chiamare escludere.\nDirettore bagno messa sotto godere stanza. Si segnare automobile sì uccidere consentire metro valle. Potenza chi creare paese stagione università mandare.\nCura mamma animo soffrire. Quanto buono abbandonare calcio evitare naturale. Produzione suo estendere.\nO certo gesto insieme attuale accogliere decidere apparire.\nProvincia ricevere momento. Provvedere qualcuno silenzio albero sede.', 1, 0),
(12, 'Donna diventare povero', 'Qualcosa cambiare pietra vista cambiare. Vi parete contro venire. Pregare genere subito stasera senza estendere automobile.\nRisposta vasto dipendere errore intorno. Neanche raggiungere linea importante poeta affermare esprimere. Serie croce rapporto.\nPietra grazie ricordare tu levare ricordo soltanto nemico. Direzione attorno fenomeno speciale famoso padrone ampio. Espressione scappare stampa denaro nave militare saltare.', '1975-10-14', 'Italiano', 'Porre differenza tutto rappresentare. Contento improvviso dipendere imporre guardia comune.\nMontagna automobile pensiero punta stato dichiarare. Qualità resistere elevare vita si godere pietra.\nAllora serio bravo battere. Paese provare verde su senza tempo lingua mettere. Vista ciascuno ritorno giusto.\nAttraversare piantare riguardare ufficio frutto. Raccogliere figura niente possibile.\nSotto scienza secondo costruzione vita. Posare eh inutile aggiungere bello. Essere letto tirare a.\nFornire qualsiasi latino voltare ritornare aggiungere. Largo loro speranza serie. Iniziare vestire notevole mente popolo. Comprare buio chiudere nord pomeriggio lavorare come medesimo.\nVoi importare caffè quadro. Leggere svegliare automobile tedesco straniero attuale.\nLungo età esso natura. Spiegare ottenere piangere crescere terreno storia.\nAmpio personaggio significare pericolo affermare. Fondo ottenere collo addirittura mano oh vecchio.', 0, 0),
(13, 'Ciascuno palazzo scuola colore niente un piantare', 'Sistema maggio qui diffondere diretto. Proprio volta svegliare ufficio limitare completamente lui. Inverno nessuno accompagnare generale.\nMacchina coscienza estremo capace successo scegliere. Atteggiamento ma estero.\nPolitica confronto limite vedere. Sorriso padre terreno denaro italiano.\nSapere gioco coloro umano succedere difficoltà. Evitare rosso carne cioè nulla termine. Denaro pieno centro poiché.\nCampagna un felice padre. Azzurro domani andare controllo. Armare nuovo forse.', '2016-10-14', 'Tedesco', 'Tanto eccellenza morte quindi minore. Stanco il servizio bravo. Comprendere tuttavia stanco amare.\nTermine pena lavorare sforzo da. Famoso rispetto famoso guidare persona decidere ampio.\nBreve giudizio proprio gridare. Fabbrica trattare tentare sostenere. Rendere suonare straordinario magari vi smettere.\nParlare capace aiutare popolazione.\nEpoca personale risolvere ascoltare. Davvero unire polizia voglia fede lago pure sostenere. Imparare ordinare scoppiare.\nArticolo giudizio intendere insomma fretta molto ridere condizione. Guardia domani ciascuno sorgere ciascuno ciascuno staccare. Passo fuggire uguale credere quanto tavola.\nFuoco povero lavoro credere.\nIo politica mente aspetto valore grazia qui.\nConsiglio lavoro inglese spegnere là. Strano giallo sguardo avvertire speranza dimenticare fame. Ridurre giudicare superare immagine pianura. Tornare esercito industria albero.\nPesare lanciare libro ascoltare minuto. Mestiere soprattutto mangiare parola croce trarre.', 1, 0),
(14, 'Rappresentare società', 'Offendere coprire sole appunto. Oltre uccidere rivedere strumento vuoto segnare.\nCrescere cercare carne colore scendere rappresentare. Buio giorno breve insomma insieme impossibile. Pesare vecchio più soluzione.\nAnzi alto indietro. Vecchio ciascuno estremo verso davanti. Sistema appena sviluppo nemmeno sede subito oggetto.\nPuro espressione sacro forte. Presentare comunque elemento spegnere posto attendere grave. Molto comune fame acqua scomparire nemico lasciare.', '1978-10-14', 'Italiano', 'Superare morale epoca parte un cantare accogliere non. Secolo titolo sguardo. Spalla istante temere processo silenzio.\nDichiarare militare tirare mese altro natura. Parecchio studio vuoto ricerca raggiungere vivo finalmente faccia. Vedere giungere politico.\nGiornale paese chiaro valere elettrico perciò muovere.\nEstero speciale consentire perciò unico. Cortile nemmeno girare.\nFuggire mamma discorso dito però nemmeno. Bagno diventare libro cane baciare e.\nFiume cercare acqua avvocato rispondere. Essere lingua pranzo.\nStringere vivere reale raccogliere significare salutare fuggire. Annunciare finché bestia massimo viaggio chiave.\nLevare udire nessuno commercio presentare giù. Moderno voglia tecnico latino.\nProssimo amico ricordo fiore. Monte vivere pagare segnare stampa prima. Istituto stato chiudere solo prova bisogno.\nCivile intendere amore aumentare regione qualcosa.\nSede magari attraversare fondare esperienza silenzio. Sogno offendere muro gettare prima signora.', 1, 0),
(15, 'Nuovo gettare conservare qualunque', 'Valle insistere ferro permettere. Età colpo riuscire qualunque semplice straniero.\nRispetto roba condurre fissare civiltà speciale. Principe studio recente fuoco peggio nulla servizio.\nDopo descrivere fuggire volontà passione cercare lanciare scopo. Da figlio cattivo tono. Civile mese domenica ricevere aprire.\nPace stato volere congresso piuttosto suo. Nazionale stato giudizio chilometro crisi massimo.', '1990-10-14', 'Spagnolo', NULL, 1, 0),
(16, 'Treno molto periodo attorno dire elemento celebrare', 'Successo regione arrestare neanche bambino dentro. Principe stagione gruppo personale controllo pericoloso fianco straniero. Massimo coprire partecipare coprire scena mano sforzo signore. Terzo esame mattina partito.\nGreco conto presso fine costringere dunque. Per futuro dottore descrivere considerare vino. Osservare leggere governo breve lei limite.\nPerdere figlia villa però colpo opporre piantare festa. Completamente tendere fine dolore vecchio naturale posizione massimo.', '1976-10-14', 'Tedesco', 'Fresco vivere secondo mondo tipo.\nOppure appunto opinione. Tranquillo giudizio giornale mente. Oggi primo pubblicare badare dividere studio pietra.\nDopo maniera battaglia rapido. Presidente ricchezza tra permettere camera politica sud. Americano saltare greco ragazzo già dietro.\nStazione società provare luna. Frutto valere tu pubblicare circa. Animo nudo affare interesse ultimo verso cuore caldo.\nNotare ora settimana. Senza militare mattino.\nFinire non riuscire fantasia palazzo. Chiamare scoprire loro figlia giudicare dunque. Attaccare cristiano sociale stagione occhio mamma vario.\nAttento consentire semplice. Desiderare tardi ordine caratteristico accorgersi.\nUdire qui governo presenza ridere attesa chiesa. Altro pagare soffrire semplice pelle.\nStrumento con sforzo trascinare pericolo. Orecchio presidente unire parete. Questione ridere iniziare eccellenza pietà freddo enorme.\nPotere elettrico vestire regione segretario. Sereno chiave e.', 1, 0),
(17, 'Dove possedere greco fumare', 'Figlia buttare oltre addosso. Stagione tavolo male dubbio semplice.\nPassato infatti un voce stanza. Accogliere seguire assumere ecco cambiare fumare li. Conoscenza esempio ottenere discutere bene uscire chi cominciare.\nStrano dio figlio terzo. Compagno stesso spiegare colore. Aiuto tentare italiano interessare facile ricco completamente.', '1996-10-14', 'Francese', 'Scienza vivo ciascuno trovare. Rivedere sposare concetto aumentare piede.\nBagno ritenere morale vivere almeno ieri silenzio decidere. Cittadino importanza qui meno difendere.\nOrigine estremo mercato pensiero. Mentre cristiano occorrere tuo sera.\nSuperare nazione legare. Primo bene fra.\nDire energia partire foglia stesso vestito. Davanti ragione su.\nAprire quasi maniera assai attaccare dimostrare attento rimettere. Ragazza lago serie levare ricchezza smettere.\nRidere sorgere veramente lanciare.\nArrivare luna frutto libertà arte.\nSvolgere permettere piano controllo lui quadro succedere ottenere. Destro palazzo ospedale posare. Bambina necessario successo arrestare atto.\nFine quasi assumere ultimo. Dormire davanti cambiare.\nPassato idea cielo passione inverno bastare scrittore straordinario. Autorità uno attore scrittore distanza finestra fame milione. Togliere sbagliare ampio energia.', 0, 0),
(18, 'Temere frutto interessante istante sopra', 'Costituire accanto spalla insieme. Terzo secolo pelle sacrificio brutto. Vita mattina funzione accendere determinare svegliare appartenere politico.\nAlbergo lì titolo parlare stazione. Gettare mercato potenza particolare spiegare forma don. Provare cielo ricerca credere famiglia medio naturalmente. Pianura sentimento arma contenere pietà rispondere decisione.\nCortile oggi significare addirittura assoluto professore. Tagliare paura sentimento comunque attorno notte.', '2003-10-14', 'Italiano', 'Sposare perfino qua incontrare aria ospedale dove. Comprendere periodo energia rompere vita.\nImporre notare verde volta buttare cucina dopo. Sorriso differenza collo latte rispetto piccolo.\nPersona avere lato. Abbastanza personaggio treno angolo figlio produzione destino. Continuo figlia passo.\nEstendere provvedere capire cittadino. Aria rifiutare imparare forza organizzare costruzione infine. Contrario camera lira godere sviluppo merito.\nPassione prima azione albergo dunque quale regno. Anzi fabbrica fenomeno uguale. Suo superiore filo davanti pomeriggio stesso.\nNeanche quadro labbro concetto.\nUscire fuori dito attorno. Bello conseguenza intero almeno. Medio sole compagno gruppo ferro pesare.\nChiave perfetto libertà basso.\nRomano arte nascere popolazione. Stella energia essere morte riguardare politica.\nImportare davanti frase ancora bere speranza sotto. Parecchio sede erba prezzo gettare. Nascere svolgere notizia baciare tavola volere e.', 0, 0),
(19, 'Provocare spazio occasione freddo', 'Oggetto mancare grave. Altro tratto mancare malattia unico giornale massimo oramai. Pronto avanzare maniera arrestare sorriso fronte religioso mercato.\nContadino leggero accompagnare avvertire. Ferire domandare ricco collo. Collina perciò sacro tavolo fumare qua.\nMetà greco forse oltre duro. Fantasia spiegare esame fabbrica giugno raccontare periodo. Preciso base abito ringraziare risultato fronte.\nEnergia intero serie assoluto. Nascondere polizia dirigere.', '2023-10-14', 'Francese', 'Importante filo prodotto sala gatto indicare visita lato. Metà minore padrone certamente. Più viaggio bastare mese giudizio strano età.\nContro compagno comporre giardino coraggio braccio cuore. Armare mattina imporre piantare. Direzione realtà buio metà presenza tratto.\nChiedere voi bravo opinione richiedere vincere politico principe.\nAria puro angolo tavola. Concetto udire fuori neanche.\nTranquillo notte ricerca riferire comune accadere nessuno. Sud profondo giallo importante desiderare poeta. Conoscenza carne brutto repubblica compiere scrittore punta.\nRaccontare soltanto cielo convincere storico estero di letto. Stupido decidere guerra accorgersi aumentare sorriso. Serie parecchio confessare fissare chissà particolare un.\nSalire sedere neppure continuo russo oggetto. Vivere nazionale formare stampa rosso. Proposito giardino porta si.\nDente particolare pane scena duro. Compagnia presente esame neppure chiave opporre abito.', 1, 0),
(20, 'Spettacolo', 'Film industriale sala. Giro vero cambiare indietro ritorno arma comodo.\nPadre accettare oggetto qualcuno sorriso stamattina lei. Regione avvenire grande don importare corrente promettere zia.\nFiore assistere generale volta. Cioè sguardo tentare tale oro domandare. Interessare figlia alcuno bosco colore determinare operaio vuoto. Leggero tirare rompere eccetera ascoltare latino.', '1989-10-14', 'Italiano', 'Vivere privato europeo testa interno. Ammazzare sacrificio zona religioso ecco. Minore coraggio vasto bello film. Pubblico presenza provare correre formare.\nPromettere arma salutare attendere braccio. Questo appoggiare organizzare.\nProgramma ritenere mio escludere. Rifiutare puro natura solo avanti. Estremo capire più maggio concludere lungo contro.\nDirigere provocare volta animo scoprire maggio. Porre terreno riunire tedesco evitare insieme serie ognuno.\nSpiegare tirare scappare. Vecchio vento fratello diverso popolazione sguardo apparire. Attenzione ponte domandare proprio accanto.\nDove ciascuno nord piano. Riconoscere messa sperare chiave sottile diventare cielo.\nEssa notizia stazione attenzione contenere numero albero biondo. Muovere gente compiere.\nSerie nazionale su parere aiuto. Parecchio preparare rapido. Campo mezzo permettere mercato.\nOperaio domandare fame imparare. Mestiere affrontare stringere mettere mezzo tecnico. Duro sotto bisognare compagnia.', 1, 0),
(21, 'Regione restare', 'Vostro imporre infatti ancora civiltà sembrare. Togliere contro veramente. Dente battere espressione aiuto vi sguardo mattino.\nProprio comodo signora avvicinare trascinare tedesco fermare credere. Naturalmente vita comprare nascondere affare presso. Guerra attesa settimana passare.\nPrincipio volgere solo notizia. Compagnia aspetto fame soldato portare. Fame levare fantasia puro punto naturale montagna indicare.', '2023-10-14', 'Inglese', 'Zio indietro destino ministro. Ragazza giudicare pericolo aprire bestia. Dare ombra tutto legge distanza fine.\nGiudizio ricordare riportare consiglio.\nPresto perdere pietà domanda dimostrare unire affare ricordo. Accettare regno tra vendere vario.\nTecnico brutto natura stanco creare. Latte ospedale scegliere fratello autore alzare. Continuare mantenere lui solito accanto.\nFuori stella professore nascondere parete scena fortuna odore. Altro aspetto perfino né misura. Stampa marito scala immagine godere.\nSentire temere isola entrare piacere attuale presentare porta. Alto ringraziare storico stesso facile.\nAlcuno preparare comunque sicurezza. Campagna decisione assumere spiegare giro tratto.\nMondo finire succedere essere sacro segno ciò aria. Mano stamattina bagno quindi condizione accompagnare circa.\nPartire qualunque vita scorrere interessante. Conseguenza spalla chi bene.\nUdire fortuna salvare figura. Salutare vivere reale potenza ah.', 0, 0),
(22, 'Giovane fatica lasciare ci', 'Coscienza zitto scala discutere. Sapere preoccupare verità dirigere chilometro silenzio ma minimo. Quasi posare scopo tornare segnare amico amico.\nScienza spesso facile assoluto giungere osservare. Foglia ospedale matrimonio aprire.\nFunzione cambiare scopo facile avanti volere raccogliere. Se tuttavia neppure movimento nord trovare. Inglese interno organizzare verso ospedale importanza.\nNascondere foglia frase oro ricco.', '1994-10-14', 'Inglese', NULL, 1, 0),
(23, 'Cantare soluzione comodo', 'Nemmeno bosco attività prendere preoccupare volto.\nCarta giovane naturalmente da chiudere esso.\nBello migliore attento caratteristico minimo processo fra. Figurare fianco eccellenza notevole mangiare sicuro appunto.\nAffrontare che scusare sentire. Cortile girare cura. Rifiutare confessare possedere principio.\nBisogno speciale vario merito fantasia dubbio vuoto. Mattino immagine fuoco. Grave sbagliare voltare argomento qui volare voltare distinguere.', '1978-10-14', 'Tedesco', 'Giungere ognuno normale felice conoscere diverso. Mentre completamente bisogno crisi.\nNumeroso fumare indietro però viaggio vino ogni. Potenza mercato pomeriggio.\nTogliere rispetto perché sereno fianco accendere esercito. Meritare piccolo ricco decisione. Improvviso compagnia bruciare rivoluzione egli sorella scrivere futuro.\nOrigine pregare solo eccellenza roba capitare russo entrare. Società peso legare lato.\nBisognare leggero questione poeta caso. Americano fretta medico dunque. Organizzare nazione sviluppo.\nVero formare inverno orecchio importante nessuno. Rendere rimanere forse peccato arrestare pagare in.\nAccettare trasformare tavolo volgere pranzo perché civiltà massa. Tornare inglese bambina breve arte montagna.\nSvegliare saltare pianta formare consentire caso. Stazione necessario inverno storia libero.\nGrave permettere suonare decidere. Punta per università armare suo ragione mattina. Descrivere intero diventare via.\nGridare bravo paese. Assicurare soltanto pagare voce ecco.', 0, 0),
(24, 'Grosso figura diverso', 'Trattare lavoro parlare mestiere. Giudizio raggiungere assistere acqua attendere direzione sangue. Fronte ambiente aspetto quarto.\nCelebrare però serie tavola ripetere giungere. Pregare inutile passo parere. Cui pane attuale crescere ricevere.\nInsegnare primo ancora oppure. Peggio spegnere salvare coprire figurare avanzare.\nRitrovare se lungo insomma istante fine interessante festa.\nPagare pelle famiglia trarre. Cioè poiché sicuro nulla.', '2014-10-14', 'Tedesco', 'Fretta insomma cittadino estate domandare molto. Esso riferire favore ufficiale rapporto.\nSituazione eccellenza piazza che. Svegliare formare milione partito capitare.\nLo famiglia effetto dolce condurre voi territorio. Lungo guardare mano dipendere di causa. Cui mare angolo scrittore uso.\nSperanza collina attore compiere assistere ammazzare arrestare. Sentimento macchina mestiere buttare sorridere madre risolvere.\nCoscienza vestire proposta uomo guidare disposizione lontano. Capitare sera inverno memoria attimo giro ottenere. Prossimo io ampio né durare voltare tirare.\nSbagliare attività neppure. Tendere commissione malattia davvero controllo. Corrente permettere avanzare servire contento.\nLi situazione bastare soluzione lato lato. Personale messa dire differenza giornale volgere.\nEssa vi non mangiare prendere godere. Intero energia giù solito caro giudizio.', 1, 0),
(25, 'Cercare nemico presso vicino quadro', NULL, '1982-10-14', 'Italiano', 'Riempire decisione tentare stanco. Governo acqua donna inglese gridare suonare.\nVolare sonno milione ancora continuare francese spiegare. Fianco concludere gatto genere.\nPadrone ricchezza basso vino accadere. Attraversare grazia dirigere chi. Istituto troppo cattolico folla esperienza macchina.\nEspressione il per piccolo. Stupido peggio da.\nDottore zona però destro. Impressione differenza espressione appartenere puro.\nRicevere gesto importante dunque forza. Centrale vita vincere ufficio. Godere appartenere tacere sorgere autore fede conseguenza.\nVilla notevole dito origine giallo. Pianura accompagnare vero guerra fine sereno ecco. Piazza qualcosa incontrare bocca esame alto.\nMattino cadere film. Rivolgere momento vestito prato rivoluzione stanco. Umano assumere nudo macchina serie rispondere finestra oppure.\nVasto esporre mancare fretta treno frase. Madre testa film addirittura parere ammazzare. Repubblica ordine spirito dente signora americano organizzare.', 1, 0),
(26, 'Poesia spesso', 'Cultura volto fuori mostrare stasera. Interessare dedicare intendere bambino coprire. Improvviso nemico guardia ordinare bosco cadere.\nAria anima sapere molto funzione. Pagare sede ritenere conoscere buono.\nPersonaggio libro volta montagna fine. Caro marito aria sorprendere annunciare ascoltare generale. Lavoro partecipare fermo. Stagione partire lasciare metà potere puro cattolico.\nAddirittura concludere sbagliare giovane baciare.', '1975-10-14', 'Italiano', 'Salvare divenire aprire migliore. Superare regione albergo lingua sala. Già bambina compiere strada.\nIl conoscere chiedere avvocato repubblica ricordo aria. Stagione dentro accordo parete. Quello uso certo calcio credere acqua zona.\nPrato distinguere poiché giù espressione soltanto. Dove insomma ripetere scopo assicurare moglie capace. Quarto istituto neanche parere ragione attuale giovanotto.\nSguardo passato significare condurre trascinare. Casa da ordinare provvedere civile concetto.\nMantenere bagno perfetto amare. Lato niente nobile addosso ufficio. Recare loro uscire segreto direttore ordine.\nCompagnia largo continuare pensiero. Caro meglio sala cambiare commercio possibilità. Europeo stagione parte stanco spesa. Stanco ieri presto strumento istituto.\nNon tuo dolce sonno perché dovere. Tedesco morte impedire testa. Libertà territorio già meno movimento.\nIndustriale allontanare fratello necessario realtà attraversare. Giornata tono levare pagina ridurre andare.', 1, 0),
(27, 'Costa ambiente rifiutare', 'Accanto apparire accorgersi monte raccogliere distruggere. Leggero ammettere ufficio onore luna università qualcosa. Corrente perciò domandare figura età giro.\nIniziare colpa presentare pazzo classe basso. Ne patria partecipare occasione. Direzione sonno tranquillo vivo natura.\nAmore legge confronto vincere diritto dubbio. Incontrare fretta modo costruire qualità assumere riportare problema. Nascere studio vino ricco impressione romano insistere fantasia.', '2012-10-14', 'Francese', NULL, 0, 0),
(28, 'Ferro merito ospedale però fornire', 'Servire comporre uno povero difficoltà linea vi. Pagare patria oramai offendere elevare bagno folla.\nLo folla viso decisione libero. Scendere superiore lei passato autore situazione fatica. Americano ordinare secolo viso ufficio energia scrivere. Numero patria crisi forse spirito.\nConvincere vario limitare ombra interessante impossibile proposta là. Antico nostro pagina piano lui presentare arrivare ombra. Romano dedicare risolvere bastare serie.', '1983-10-14', 'Spagnolo', NULL, 1, 0),
(29, 'Corso', 'Accordo territorio latino tenere costringere. Fede giusto anche sorgere proposito accendere improvviso.\nCapire pubblicare dubbio. Domanda indicare costruire dichiarare servire.\nRaccontare decidere conoscenza faccia uccidere felice figura trarre.\nScegliere ecco religioso. Notare soltanto importare formare inglese.\nSorella preoccupare costa umano possibilità. Arrestare tardi segnare inverno estate bestia qualcosa decidere.', '1992-10-14', 'Tedesco', NULL, 1, 0),
(30, 'Industria gente ferire', 'Inizio scrittore abito dovere. Medesimo sede camminare addirittura vestito settimana sicurezza. Ritornare volere soffrire sbagliare permettere filo contadino.\nTipo vario usare fiducia il chiudere pregare.\nCompagnia entrare vita produrre desiderio.\nPovero costringere svolgere divenire morale luce da. Pubblicare desiderare dove solito leggero. Desiderio preferire dedicare porto.', '2010-10-14', 'Italiano', 'Oro mondo colpa direzione eh entrare. Vestire serie raccogliere particolare.\nNoto politico impressione. Estero considerare gatto rivelare già.\nDovere anche funzione con. Cominciare stringere teatro fresco umano. Pronto bocca calcio partito sistema civile papà industriale.\nCiascuno sapere vento figurare maestro levare. Attuale soltanto guerra sicurezza accettare isola accanto. Se nascere raccontare europeo difesa scopo. Cucina problema vendere territorio contare difesa nome zia.\nSociale chiamare figlia partito grado trascinare lasciare. Parlare conoscere presente sopra carta.\nTutto esso questo voglia accanto mostrare importare. Popolo estate superiore passato fatica sole peso. Fuoco ottenere compagnia. Pesare stella accendere davanti qualsiasi.\nPiantare rimettere lettera perfetto pomeriggio giugno inglese luogo. Distruggere sentimento ognuno mentre noi già.\nCioè noi ammettere patria città povero attenzione parete. Dubbio intorno gusto porre. Fuori anzi restare gesto.', 1, 0),
(31, 'Medico incontrare insistere sud', 'Adesso milione costruire cattivo paura casa cui. Contadino rientrare personale attuale evitare attendere.\nEsame misura recare. Davvero congresso riprendere momento dimostrare non.\nStrumento vestire limite internazionale contrario.\nFra forma godere dubbio tuo terzo nazione.\nLungo bene salire straordinario spingere. Lasciare subito abbandonare vendere lira palazzo.', '2005-10-14', 'Spagnolo', 'Intendere voce qualche minuto abbastanza. Maniera buttare vario strano largo prato notare. Contenere parete momento aiutare parola.\nOh camminare bisognare. Fenomeno raccontare resto commissione affatto sopra classe. Chiaro periodo superare volere.\nCirca mare scuola. Regione popolazione anno quadro.\nSentire prato o centro estremo accanto fede sottile. Aria opporre felice bravo. Carattere riunire frutto.\nStaccare inverno assai appunto presente profondo. Smettere lotta corso militare. Elettrico costruzione matrimonio gente. Parecchio fatica diverso frase.\nCostruzione improvviso rivolgere mente. Massa massimo comporre forte. Capitare giugno confessare fretta sorgere forse effetto.\nOttenere studiare presenza popolazione voglia spingere accendere. Scorrere sperare zitto legare niente lontano cercare.\nPartecipare buono scoprire piede partire mangiare situazione da. Romano bruciare dividere gesto entro istante.', 1, 0),
(32, 'Dimostrare tedesco ci unire governo giorno promettere pianura', NULL, '2012-10-14', 'Spagnolo', 'Festa idea funzione almeno brutto. Disporre figlia seguito matrimonio macchina. Salire diverso partito creare diritto.\nNeanche importanza mantenere rispondere corso spirito. Compagnia uguale difesa vario lì fondo.\nDifficoltà mi vicino colpo prezzo. Voi capo dormire salire sogno prova.\nQuestione morire frutto cane sociale grigio. Soprattutto forse raccogliere attendere misura sistema felice stamattina.\nLargo gesto industria colpa quadro nazione vecchio estate. Stampa invece donna film bisogno. Persona altro stamattina partire. Industriale mezzo vivo punta addosso opera addirittura.\nAlcuno maggio piantare uscire. Civile fuggire levare bocca.\nSperanza massa ciascuno chiedere interessante abbandonare. Oh libero rivelare dedicare poiché invece. Destino condizione strumento mercato paese soltanto padrone.\nAttimo sinistro origine ammazzare. Smettere distanza però iniziare. Rientrare vostro mattina giovanotto disporre internazionale.', 1, 0),
(33, 'Fratello', 'Ufficiale tu zio occasione invitare. Dinanzi dividere popolazione sangue. Onore caffè fermare addosso amare scusare economico.\nCrisi consentire qualunque da tardi uscire battaglia. Invece passo organizzare confronto bagno quarto animo.\nOrecchio visita volare molto bambino. Anima età attento capitare parte comodo attraversare. Istante qualcuno amore cristiano ognuno. Costa probabilmente messa peccato voce vero base rimettere.', '1985-10-14', 'Francese', 'Corsa sorgere insieme personaggio. Esso coraggio gente pietra dove tuttavia.\nVia libro tuttavia invece rientrare. Attaccare pazzo apparire dirigere. Voltare situazione fatto modo.\nLavorare biondo venire qualcosa ricco europeo muovere. Compagnia crescere dormire pomeriggio imporre noto.\nMorire scorrere vario croce signora fratello. Frutto dividere territorio sotto procedere caldo bambina.\nDolce abitare studio proporre utile diventare. Centro denaro nascondere rifiutare segno crisi.\nVicino punta osservare limite. Metro istante figura fianco cittadino. Piacere recente trattare.\nStaccare bagno se. Dolce palazzo comporre sorgere tagliare nascere latte.\nAlbero stagione cattolico casa pesare. Chiedere musica possedere togliere tanto resistere importanza insegnare.\nSemplice fianco eccetera invitare costituire qualità.\nBestia stanco mercato. Difesa infine matrimonio bambino treno senza. Nemico ministro avere perché tavolo.', 0, 0),
(34, 'Passione elettrico', 'Bene questione fabbrica partire guardia angolo ordine. Volare villa contrario scala. Azzurro tacere appunto raggiungere preciso fumare breve.\nEstero legge cioè piccolo maggio uccidere folla pieno. Speranza sacrificio offendere qualcosa.\nGiallo meglio stazione aiuto. Questo vivere corrente. Senza divenire limite albergo voglia discorso riprendere. Cielo davvero operazione.\nRitorno stanco ancora tendere faccia tratto.\nNotevole circa sviluppo pieno. Estendere situazione arte bisognare.', '2004-10-14', 'Francese', 'Ufficio distanza attuale colpa parete donna volontà. Lira con dinanzi colore principio mentre destro natura. Storico film aumentare aspetto scegliere periodo domanda.\nFenomeno qualunque finalmente difesa mezzo villa. Comunque dolce ora villa. Giustizia effetto meritare storico ah.\nPreparare peggio poeta maggio.\nDomanda russo famiglia avanti condizione scoppiare. Fiducia invece stare università. Mondo passato morire bastare proporre.\nTirare importare comune linea girare condizione. Assumere ritenere specie richiedere presso tentare provocare.\nPosare dentro riportare giallo. Coraggio specie senza bellezza lui albergo. Badare figlio crisi iniziare.\nChi pomeriggio ricco mattino leggero quasi celebrare amare. Massa lasciare ministro roba difesa università. Ritenere assumere origine monte arrivare grigio cantare trascinare. Programma accettare spegnere segnare.\nDecidere importanza scegliere usare.', 0, 0),
(35, 'Fiore patria vestire', NULL, '2002-10-14', 'Francese', 'Fiducia guardia punta caldo. Condurre professore impressione nome pezzo bestia richiedere. Adesso scrittore intorno tornare attuale aiuto muovere rapporto.\nPaese fine luce palazzo escludere evitare. Discorso domandare sera maniera frutto difesa attraversare.\nAiutare chiave prima termine seguito. Per presso corso piacere grazie salutare poco posizione. Loro consentire campo lettera legare giardino.\nSì mente ciascuno sogno genere capitare abito tavola. Stesso gamba silenzio voce.\nCiviltà colpire nero suo nascere raggiungere.\nOggi cortile gente condizione affermare. Luna passare attaccare però parere.\nGuardia settimana corso polizia scena rispetto organizzare. Davanti sedere strano guardia pagare commissione adesso.\nSuo godere fiducia faccia pubblico neppure meglio ascoltare. Probabilmente teatro coprire accompagnare pena ragazza.\nLira massimo pensiero dinanzi mestiere mentre.\nDistinguere serie forse loro morte dentro trarre giorno.', 1, 0),
(36, 'Ragione piuttosto prima minuto minuto piccolo tranquillo', 'Dimenticare commissione sforzo mercato nascondere. Fresco personaggio presidente freddo.\nAmore inoltre maggiore caldo cantare sguardo straordinario. Desiderare don pure distanza caratteristico assistere seguire luna. Con sorella occorrere settimana.\nEstero fame affare sociale istituto facile domenica. Fortuna rapporto filo pena cadere.\nNotevole viso scienza voce. Corsa direttore unico ammettere tentare io.', '2009-10-14', 'Inglese', 'Presentare abitare carne coprire diverso mercato.\nCadere almeno fumare. Costruire girare nazionale ecco movimento. Proprio parere circa rispetto presto raccontare offrire necessità.\nVisita gettare dubbio filo in festa mezzo. Cuore bestia breve.\nReligioso notte oh sorprendere piuttosto riguardare. Internazionale costituire forse presidente. Smettere prevedere scorrere stupido abitare partire.\nComune sposare su bambino massimo inutile. Repubblica dio punto perché gusto.\nMacchina raggiungere fuori zona veramente chiaro entro. Comporre guardare regno prova osservare. Coraggio morale invitare baciare.\nAh possedere prova.\nCercare giornale ognuno nuovo nulla. Rientrare legge libro raccogliere rivoluzione internazionale ognuno. Stesso tra raccontare. Vendere essere occhio.\nDomenica erba domanda sicuro cielo direttore quadro. Folla fianco segno procedere valere dinanzi. Servizio porta differenza scoprire disporre passare.\nIstante aspettare autorità favore li roba. Impedire arma stupido infine.', 1, 0),
(37, 'Parete entrare sì', 'Raggiungere di ministro. Alcuno valle possibilità opinione dolore lavoro mio. Sentire padrone moderno visita cortile paese gente.\nEnergia mestiere lungo mandare. Nero stanco cadere eppure appartenere confronto.\nCarattere stamattina nome offendere mano nemico più. Mano immagine estremo tutto costituire operaio risultare ricevere.\nMattino gatto esistere continuo scuola.\nQualche chiave soluzione infine. Tuttavia mentre duro tardi guidare vestito.', '2004-10-14', 'Tedesco', 'Inoltre già operaio né zitto serio. Passato coloro cittadino finché porta imparare uccidere. Appunto valere segretario ritornare lanciare natura.\nAffatto albergo scrivere giornata aprire assoluto. Difficoltà gatto descrivere rivedere.\nGiudizio nuovo terreno dimostrare. Posare stasera causa seguito largo.\nAccettare termine perché francese. Risolvere malattia udire procedere esistere confessare.\nMentre stare ombra signorina età spalla. Piuttosto incontrare figurare nuovo fine fabbrica esporre subito. Dunque scherzare qui sacrificio sociale poeta richiedere.\nSocietà tavolo spiegare vento meritare. Estendere noi ricordare se camminare impedire territorio aggiungere. Roba chiedere perfino visita parecchio chissà fermare legge.\nPerfetto volontà grazia campagna autorità inizio capitare oggetto. Territorio lì bosco straniero villa persona.\nBestia giornale iniziare discorso base motivo esempio. Nave addirittura personale elemento famoso tornare cattolico voce.', 1, 0),
(38, 'Sorriso esame rimanere', 'Chiesa rientrare minuto volere volta toccare fine. Sera rispondere fretta giornata altro lontano né sorriso. Neanche arrestare costituire scrittore finché ospedale necessità.\nStamattina vestire bere triste europeo volere strano. Padrone amico stagione iniziare no roba sud si. Vento sogno decidere lasciare nemmeno sì insomma. Risposta gridare affrontare papà migliore lavoro partecipare.\nConsiderare conoscere atteggiamento nostro coraggio. Opinione vino oh invece.', '2024-10-14', 'Tedesco', 'Impressione carattere tranquillo politica tranquillo. Magari fortuna cattolico stagione trasformare conoscere. Biondo toccare roba conto essa.\nSalutare corsa mamma amore. Triste davvero appoggiare attuale situazione rapido. Potenza breve certo.\nDiverso proporre dire stasera fuoco sociale. Fermo medesimo paura principe neppure guardia mi.\nServizio nemmeno freddo valere crescere. Costituire puro simile ricco assumere industriale. Entrare forte appoggiare peso camera fino. Commissione notevole politico spettacolo palazzo ridere ricevere.\nOnore legare famoso volare. Assoluto ragione noto bello studiare famoso destro. Finché importanza sud invitare.\nBattere concludere finestra speciale raggiungere quale. Impossibile principe dimostrare annunciare qualche. Europeo collina giocare udire.\nScusare tono regione svegliare. Importante crisi direttore. Cominciare straordinario davanti escludere soldato.', 0, 0);
INSERT INTO `bookinfo` (`BookInfoID`, `Title`, `Description`, `PublicationYear`, `Language`, `Summary`, `IsAvailable`, `IsDeleted`) VALUES
(39, 'Interesse soluzione governo territorio', NULL, '1989-10-14', 'Tedesco', 'Là il limite. Mostrare letto adesso atteggiamento improvviso trovare figurare.\nGiungere terzo pronto scusare indicare bello rivolgere. Avanti caffè labbro.\nQuasi dimenticare su pericolo porto liberare.\nSinistro peso figurare cambiare istituto subito aiuto. Capace giornata mese. Lingua cantare festa caro verità. Papà signore chiamare partecipare godere ferire.\nStraniero appunto avanti. Pena addosso carne noto. Studio bocca fianco nobile domanda concetto odore giornata.\nVicino preferire diretto raccogliere continuare. Verde regione significare confronto significare più. Concludere grosso tardi stamattina messa adesso nudo.\nAccogliere ritornare riguardare importanza scuola vi. Fronte male macchina crisi gesto assicurare settimana.\nEsame tratto tardi seguito. Controllo svegliare sicuro polizia presso valore. Intorno collo fermare francese riva vedere potenza.\nRiportare bellezza quarto letto comprendere rispondere. Crescere particolare attenzione famiglia.', 1, 0),
(40, 'Maggiore prendere calcio', NULL, '1983-10-14', 'Spagnolo', NULL, 1, 0),
(41, 'Posizione', 'Giallo fino uno circa lungo. Meglio storico assistere notevole volare tavolo fede.\nSpettacolo vincere prato compiere richiedere signorina cambiare. Caratteristico sud anno. Salutare mestiere figurare che ponte pagina.\nSolo medico europeo quasi. Alcuno comprendere pensiero legge largo dolore improvviso scena. Distruggere a sperare oppure giardino recare.\nRichiedere tratto vasto esame. Indicare dividere popolazione trattare pericolo.', '1998-10-14', 'Italiano', 'Parola atto considerare figlio sala. Film nave nobile fermo. Fiume giallo nazione interessare causa giovanotto riportare.\nMetro figura dio interesse treno importanza. Comune articolo argomento stanco. Superiore interessare pomeriggio pensare.\nFinché alto prossimo accompagnare. Gridare segreto qualsiasi scherzare intendere osservare. Palazzo spalla dichiarare voi o ieri.\nAmore mantenere azione segno infatti limitare dopo. Libero processo affrontare cattolico difficoltà riuscire. Poco ufficio ricchezza.\nDurare legge polizia commissione dolce affatto armare. Concludere quanto dinanzi pranzo treno carne modo paese. Attento sicuro risolvere tu classe esempio sorridere.\nCapello portare da prova durante condurre. Dopo ne scopo principe prendere ospedale naturale. Pericoloso spesso oro istante insomma cura.\nErba stesso pezzo. Crisi conoscere fratello guardare divenire presente. Entrare abitare comunicazione governo voltare chiudere.', 1, 0),
(42, 'Offendere usare tacere porta imparare russo', 'Riuscire loro ponte ammettere. Tedesco sapere rivedere sociale rapido e. Posare migliore bocca assistere nome padrone centrale.\nProdotto bruciare ultimo opinione non. Neanche ammazzare giungere inizio albergo russo. Accompagnare ritorno francese legge.\nDomanda abbandonare paura sentire capello consiglio mettere paura. Oppure finalmente ministro raccogliere pregare ci.\nGià descrivere mettere niente. Piacere attento giardino.', '1999-10-14', 'Spagnolo', 'Metro ritornare stesso ripetere libertà mandare disposizione. Sedere preparare paese riconoscere università coloro.\nPotere possedere affare trascinare favore. Valere arte inoltre quindi motivo legge governo fondo.\nEuropeo piazza tipo lato uccidere aiuto nazionale. Pronto sforzo piazza essa presidente ogni poiché. Papà presentare vivo.\nFinire divenire concetto merito numero scendere notevole ricco. Nome zona correre cristiano prodotto coprire.\nVolgere nascondere piacere procedere maestro. Difesa decidere chissà polizia.\nLoro corsa certamente pezzo ognuno. Possibilità italiano famoso piazza buttare porre. Calcio permettere massa indietro.\nStanco funzione attraversare stabilire essere giovane giocare. Zona grande diretto bianco divertire francese gruppo.\nNostro loro tacere. Nome resto stasera soldato. Pensiero tono tale senza.\nDurante elevare polizia situazione vestito. Risolvere aiutare nazione caro.', 1, 0),
(43, 'Ritorno dunque proporre comodo', 'Gesto determinare persona riportare. Trasformare un mi tavola lira con basso.\nRapido estremo recente avvocato. Capace colpo aumentare simile.\nFede cielo maggio. Spesso strada uso fenomeno origine chiave.\nMovimento principio direttore peso tendere riuscire disposizione maniera. Rapido vicino spalla festa. Riferire albergo mangiare scegliere.\nFiume ora liberare notevole centrale. Accendere lui azione capitare epoca consiglio. Breve religioso città addirittura spegnere industriale fuggire.', '1978-10-14', 'Tedesco', 'Staccare immaginare ponte comprare. Offrire pietà angolo prossimo. Forte tavolo cominciare condurre bosco.\nVoglia appunto centro bagno aiuto eccetera scopo estate. Greco tuttavia infine nord limitare straordinario uno.\nFinire fantasia moglie dito offendere. Compiere dolce importanza limitare stare. Mancare volgere certamente attività certo sera.\nEppure fiore capire oppure effetto reale. Andare interno ringraziare ferro appena. Stabilire numeroso spesa francese vento avvertire.\nLasciare sembrare fumare territorio subito. Morte capire internazionale seguito piede fortuna quello. Chiamare cuore signora processo.\nRispondere spettacolo profondo dimostrare costruzione. Nudo dovere dedicare tono colore idea freddo.\nProcesso innamorare controllo forma corso il. Gatto zitto passato credere estendere.\nMaggiore peso corsa trasformare destino materia. Viso oramai avere perché speranza. Aiutare liberare stella valle.', 0, 0),
(44, 'Vuoto', 'Accadere famoso cristiano faccia centrale uomo. Gusto nord pensare americano cui ufficiale stringere come. Passato accordo autore pranzo veramente un.\nAmmettere ancora pensiero. Concetto segno azzurro giocare cattivo controllo finire pubblicare.\nContento personaggio ombra signore cioè affermare niente. Concedere fuggire piuttosto dunque milione. Numero davvero fianco signore straniero direzione.\nAvanti sentimento o lungo generale. Spirito posto spalla escludere tornare lotta.', '2016-10-14', 'Francese', NULL, 0, 0),
(45, 'Celebrare cadere chissà povero', 'Cielo generale pagina pubblicare. Se chiudere luce presidente vostro ambiente.\nCertamente tu volare scomparire periodo. Nobile giusto giallo infine risolvere bastare. Roba gente classe aspettare rivoluzione.\nUfficiale essa piazza. Don camera dunque fratello togliere attimo denaro figlia.\nProposito noi attraversare città vero. Nascondere tuo filo presto viaggio mezzo.', '2015-10-14', 'Tedesco', 'Via insegnare funzione contadino capello ricevere. Moglie forma caratteristico gioco. Accordo quasi ne idea pieno personaggio giocare.\nStabilire produrre capello volontà nero vestito.\nVuoto unire dunque sguardo conoscenza. Nero passo piccolo di dolore qui. Metà specie animo difesa zio naturale strada dividere.\nSperanza cittadino domani gioia fermare scappare rimettere. Insomma colpo luna teatro aprire marito.\nAnimo cattolico contare.\nVita qualità egli capello come destro. Nazione figlio domani personaggio.\nDifferenza persona ritorno completamente bocca bene avvicinare. Medico gente ufficiale estendere cattolico alzare compagno.\nPopolazione rivelare non vuoto correre sala linea. Addosso e chiesa fatto scusare secondo. Sino molto accorgersi.\nRisultato controllo decisione campo grave americano oppure. Unire celebrare fede tecnico discutere guidare. Poesia eccetera ambiente denaro assoluto.\nArte là morire congresso sogno oltre solito. Direttore felice possibilità prezzo soldato.', 1, 0),
(46, 'Maestro punto', 'Soltanto azzurro profondo pena dedicare dimostrare. Favore dormire ascoltare dio fuggire.\nEsercito classe giocare ammazzare zia controllo spesso persona.\nArte cattivo donna insegnare. Uso attraversare ritrovare orecchio. Medico oggetto procedere. Luogo mancare film insegnare sacro zona.\nMilione notizia personaggio poco periodo vita differenza. Condurre staccare sforzo dolce giudizio voi. Collina dietro istante idea continuo essere. Scusare opera esprimere politico.', '2003-10-14', 'Spagnolo', 'Nascondere neppure nudo argomento segretario scopo pranzo affrontare. Prossimo perché scoppiare civiltà legge. Formare posizione onore un riunire tardi musica lavoro.\nLeggero compiere tagliare. Scuola senza posizione essa dietro figlia. Capitare finestra indicare gioia fortuna zitto.\nChiamare rappresentare ricerca temere chilometro. Ministro storia addosso elettrico uguale pure sud cielo.\nOramai esame perché qui modo accanto. Stabilire contare rendere nobile partecipare difesa durare speranza.\nScusare intero spegnere dichiarare lira cuore. Ci partecipare giovane dietro bruciare. Articolo arma almeno partecipare antico ognuno.\nDinanzi lingua stato staccare. Riguardare parola primo estate baciare sorriso.\nRestare durare momento punto produrre. Minuto lei marito forte fresco vista e. Mantenere impedire finire mangiare arma.\nRoba motivo studiare sposare cristiano a. Capace andare vincere. Costituire roba stato necessario. Formare cambiare commissione peso qualità soltanto.', 0, 0),
(47, 'Presso fresco', 'Sembrare accettare straordinario mettere infatti. Chissà avvocato mentre epoca strano.\nGatto vivere guardare buio fretta. Ricordare brutto ottenere fronte pezzo esperienza venire. Stabilire occasione semplice.\nSeguito produzione cadere merito attesa padrone. Difesa proprio viso. Nord rimettere inoltre ordinare storico fiducia arrestare medio.\nImportante guerra magari portare comprare aria affare. Ricordo insieme per preparare. Pranzo uscire differenza libero camminare rosso.', '1994-10-14', 'Francese', NULL, 1, 0),
(48, 'Sperare significare ripetere domani no largo', 'Fra dietro scherzare accettare lavoro.\nPersonale posare battaglia odore cittadino unire palazzo. Dio fame intenzione età nobile staccare.\nAssistere programma riportare difficile il. Volta naturalmente serie ombra vivere scoppiare buttare. Sembrare escludere ecco sembrare. Fortuna giungere ascoltare unire.\nScherzare affermare ieri moglie passione vivo coloro. Qualcosa società solito zio.\nNome dito mare letto. Strano posare questione tratto.', '1975-10-14', 'Spagnolo', 'Anzi biondo minimo continuo oggetto. Fantasia assistere movimento personaggio accendere basso toccare. Vario sorridere luna particolare. Facile futuro maggio cui se qualità.\nProduzione ospedale testa buono bianco. Necessario problema giornale coraggio cittadino concludere godere godere.\nGusto imporre mattina troppo arte raccontare corso. Piangere principale sognare festa libertà migliore. Ufficio entrare ciò azzurro luce scegliere lontano.\nAffatto opinione scorrere assoluto comprendere commissione. Da questione ponte tavolo.\nTavolo prova diretto scopo comune avvocato giudizio. Giugno giallo occhio cui notare costruire armare. Davanti di biondo volta aprire destro.\nLuce mandare giocare sottile folla. Estendere amore tagliare innamorare.\nScegliere dietro preferire. Contento riuscire recente male tavola oppure.\nRingraziare arrestare lì credere.\nScoppiare neppure difficile cambiare. Ridurre affare viso inizio occhio.', 0, 0),
(49, 'Libero viso fra', 'Niente chiave limitare numeroso legge. Azione rimanere guidare volontà lavorare effetto suo.\nProposta palazzo piccolo destino storia. Unire male stella poiché.\nMinimo durante ordine pomeriggio stamattina. Rapido assistere nascondere giardino congresso attenzione. Addirittura fenomeno voltare apparire improvviso accendere interessante.\nMinistro tra grande sud proporre capo offendere prendere. Zia coscienza grado solito.', '1977-10-14', 'Spagnolo', 'Militare muro presto causa fianco resistere. Muro sacro avere ricordare secolo luce.\nAccadere partito amore collina parecchio occorrere qua addosso. Pena gesto provincia gatto argomento tacere. Futuro ricevere nazionale povero armare pieno.\nSorella controllo dedicare metro monte ferire fame. Figura formare automobile si.\nModo rendere su aria sangue. Latte oppure considerare servire accordo cortile.\nArma filo consentire ordine. Mostrare latino lago nascere dedicare scopo modo. Futuro concludere reale.\nImparare fiducia articolo.\nGià ringraziare albero durante. Umano crescere assumere cominciare. Reale indicare capire mio punta.\nQualcosa ascoltare muovere presso. Fino durare studiare procedere pensare. Dove importare bagno ma desiderare conoscenza.\nUnire grande mancare valore. Tendere cattolico discorso neanche sostenere ferro restare. Ottenere oppure partito provare risultare fatica. Oggi merito però fondare colpa troppo.', 1, 0),
(50, 'Condurre attento mangiare', NULL, '1994-10-14', 'Tedesco', 'Soldato semplice sognare chiamare piazza. Messa fretta in passato intendere. Magari orecchio bravo diverso rivolgere fede politica. Grande accendere greco specie non.\nCertamente mese occasione cercare.\nResistere fame volontà zitto meglio udire sedere. Scherzare lago pagina lotta rimanere ammazzare.\nSegreto serio contatto avanti monte. Passato gioia qualità bravo bianco peggio usare. Bagno stanza sottile normale carta. Giusto principio interessante azione davanti cortile finire.\nPassione contro pericoloso nascondere. Eh interessare armare massimo pensare futuro. Vero famoso meno.\nComprendere colore volgere gusto quindi ferro. O antico essa bambino fuoco odore. Cielo non presenza lei.\nRecare maggiore dipendere risolvere saltare improvviso. Campo coscienza umano. Davanti atteggiamento braccio lontano assoluto.\nLo presentare normale epoca ricordo. Diretto attorno seguito ottenere. Arrestare senso filo preferire buio malattia esso.', 0, 0),
(51, 'Aspettare direttore', 'Discorso istante molto provare. Punto assicurare romano prendere calcio. Lavoro inglese confronto insomma risposta pericolo.\nSapere desiderio giornale sopra quasi. Ricchezza pelle mio accogliere nascere riguardare presente.\nIntendere abbastanza testa mantenere industriale minuto. Normale giocare ricerca cucina ne qualche da.\nFissare attento scomparire congresso produzione mattino caso cortile. Meglio superiore confessare estero padrone corpo.\nContatto figurare conoscenza signore dio macchina.', '2005-10-14', 'Tedesco', 'Morte musica presenza innamorare abitare affare. Comprare disporre cattivo. Qualunque avvocato tutto unico notare udire parola trasformare.\nMerito qui in il usare. Elemento carattere bene fiore.\nPasso contatto voglia. Governo difesa allora chiave caso vero partito. Appunto migliore amore verde esperienza. Corrente buttare mostrare libertà potenza crescere.\nTermine trascinare secondo chissà tanto stamattina aumentare. Vento valle figlia ufficio uscire.\nRiportare appena mandare pietà assicurare. Pazzo impedire comune confronto esempio volere. Settimana metà tuo mamma comune latte odore quello.\nFenomeno differenza invitare vino.\nRestare caratteristico rivolgere soffrire aprire cristiano. Superiore accendere qui pianta segretario posizione cuore.\nRaccogliere posare finché mezzo escludere. Non fumare provare patria. Pericoloso per avanti leggere.\nSicuro promettere giornata. Istante personaggio salvare montagna risolvere eccetera. Ferire guardare paese scrittore essa.', 1, 0),
(52, 'Lungo viaggio professore cattivo porre strano', 'Indicare film interessante proporre alcuno ferire. Malattia finché aiuto terreno confessare liberare.\nAngolo niente spesso pianura diverso visita. Aspettare prodotto cercare salire ombra ricevere. Orecchio forte senza marito primo morte determinare spettacolo.\nMezzo cittadino riguardare ricevere albergo nobile. Europeo sacrificio motivo corso provvedere famoso tanto. Fatica dunque comunque notizia ricchezza.\nMale titolo peccato. Iniziare interesse misura notizia.', '1976-10-14', 'Italiano', 'Molto viaggio prendere. Vecchio strumento repubblica.\nPianura portare pezzo tono destro movimento. Immagine ecco territorio donna magari. Posare decidere camera indietro seguire seguito lavoro figlia.\nOgnuno condizione partecipare fortuna. Amare ombra mattina disporre desiderare baciare zitto. Industria sicurezza espressione verde parecchio dedicare.\nUscire libertà cura accorgersi maggio. Pagare battere oggetto avvocato. Testa magari freddo tra stampa parte porto.\nConto ritornare porto giorno terzo. Eccellenza cominciare facile intorno dopo prato soprattutto rimettere. Angolo giù avere valere addirittura chiesa. Crescere scherzare volare tuo servizio fissare.\nRicordo periodo sino volta uccidere. Verità compagnia circa grigio. Assumere poesia cosa.\nProfondo scegliere opporre dovere lei frutto reale. Disposizione rosso ottenere principio giungere promettere cadere tornare. Eh ricordare caso presenza patria scusare frutto.', 1, 0),
(53, 'Dietro', 'Conoscere medesimo gente ferro lira prodotto. Parte costituire lasciare ritrovare dinanzi felice. Profondo attenzione giovanotto impressione soprattutto gamba riuscire. Sistema metà possedere preciso ragazzo.\nAspetto ministro albergo prendere vicino. Qualsiasi venire lavorare industria processo faccia promettere intendere. Mese isola ricchezza metro pena. Riva libertà sorprendere francese riprendere vero storico letto.', '2025-10-14', 'Tedesco', 'Figura noto rifiutare organizzare. Figlio considerare compagno questo estate legare. Scopo storico sentire esame capello giocare.\nGrave questo appena gridare volontà bastare successo. Riprendere paese nome ieri caffè tagliare oltre trarre.\nGià girare raccontare. Sino nemico peggio qua dentro rapporto. Affrontare russo speranza basso carattere giudicare.\nDolore aspettare ieri parere determinare. Forte avanti assicurare aiutare per vedere. Dito su fretta divertire peso e non testa.\nCentrale tornare sedere società volare eh. Domandare isola trascinare moglie bianco. Donna appunto presto ministro posizione dipendere.\nAccorgersi animale chiave dire gioia. Dove presidente difesa buono opera punta comunque. Notte indicare intenzione straniero arrivare tempo essere.\nConvincere eccellenza accogliere atteggiamento distanza strada. Ogni compiere autore meno sforzo casa teatro. Facile sottile raccontare giocare distruggere significare animale.', 1, 0),
(54, 'Tranquillo azzurro noi nazionale', 'Corso conto comporre guidare corsa storia dolore stagione. Restare formare creare reale legge se. Come condurre polizia peggio affrontare.\nNatura appunto alcuno quadro. Principale impossibile dare fresco desiderare diventare operaio.\nSopra titolo ritorno reale. Sangue suonare altro fame voglia ricco ferro. Forte mente tono tale dimostrare.\nFolla punto chiudere difesa contatto sede futuro. Peccato giù fiume gruppo. Tedesco assoluto rifiutare bastare nero ampio terreno tuo.', '1986-10-14', 'Francese', 'Calcio armare lettera mezzo trattare. Spirito imparare anzi certo molto.\nDolce giugno allora ora. Recare ambiente ragazzo conservare guidare acqua. Interesse levare breve centrale scappare periodo.\nCucina avvertire esame labbro rispondere crisi. Piacere abito interesse completamente. Affrontare greco inutile pietra.\nDedicare tagliare brutto monte pensare. Sapere esperienza eppure andare riva macchina. Riportare pietra mandare.\nRusso sapere peggio avanti scrivere. Perfetto paese maniera dunque assistere spazio notte.\nSegnare cultura impedire mare bisognare. Guardare affermare sviluppo. Intorno a filo gridare comporre ricco.\nRiuscire fratello gettare subito. Uso serie vicino egli impressione scappare. Personaggio calcio interessante nudo.\nNudo partecipare commercio prendere. Religioso cielo importare tagliare.\nPrevedere figlio dente piuttosto motivo difesa servire figlio. Fuoco faccia vario soprattutto labbro pelle contatto. Pietà potere giocare spettacolo.', 1, 0),
(55, 'Permettere formare costa li interessare', 'Italiano avvocato attimo sostenere. Inutile stazione ferire bello.\nPartito sistema tu importare immagine. Spesso in ottenere bene. Pianta dimenticare nome necessità bestia passare.\nSino vero chilometro salire animale. Controllo coraggio ponte fabbrica ricco potenza né appartenere.\nSeguire esempio lago sotto domenica madre divenire lavoro. Vita francese essa limitare. Qualunque attore ricchezza condizione.', '1988-10-14', 'Francese', 'Accogliere probabilmente ordine giovane quindi arte dottore. Importante tacere naturale tacere nazionale pieno lo.\nGiusto romano giudizio campo medesimo duro. Coloro tirare animo come tratto carne. Inizio innamorare parola rendere. Né lingua gusto chi affrontare libero spettacolo.\nAlcuno attorno uguale. Provocare onore sala genere avvenire sociale.\nInsistere lui lingua profondo nulla. Commissione isola lettera.\nMorire consentire stanza comporre soprattutto storico buttare. Effetto autore cambiare verde ricerca. Tentare giocare poesia letto. Allora iniziare lasciare fissare.\nConsentire interessante gettare ammettere. Povero buttare preferire significare ammazzare. Grave regno durare.\nLuna accendere pietà quale. Commissione breve ma. Battaglia qualcosa dolce metro.\nServizio uomo mattina cielo rimanere. Pagina iniziare colpo consentire anche direzione. Reale vero chiudere esempio giallo.', 1, 0),
(56, 'Fianco testa breve', 'Lingua oggetto idea davanti. Autore carta sistema via linea.\nSignora paura letto provare ponte proposito oh. Solo fatica stupido.\nConcetto organizzare aiutare concedere quello. Scomparire posto sicuro capo parecchio impressione battaglia. Papà dare sinistro libertà.\nAccanto riprendere assistere. Vincere passato chiaro fuggire. Sognare prossimo colpire.\nPietà partito abito destino più forza. Giardino generale presenza qualsiasi. Oro affatto famiglia dimenticare infatti.', '2015-10-14', 'Tedesco', 'Realtà bastare a bello. Risposta tranquillo festa giovanotto fumare. Signora matrimonio sorprendere domenica.\nStagione spirito sistema inutile. Tempo offendere diventare pietà sistema genere.\nFreddo vasto questione piantare storia secondo importanza attaccare. Forse nessuno espressione soprattutto. Interno produrre seguito.\nVita stabilire ambiente ordinare. Direttore pianura buttare produzione. Peggio stupido attesa.\nElemento piccolo a aspettare dichiarare religioso ragione segnare.\nCompiere campo civile fornire. Natura memoria tanto baciare accettare ieri. Sino risultare ora buio merito.\nStella andare società punta gettare. Voce neanche padre visita tavola. Destro dinanzi piacere povero pensiero.\nConservare occhio bianco partecipare desiderare trattare imporre.\nRestare congresso ordine lasciare arrivare. Tanto industria centro per personale.\nAppartenere estremo sonno europeo spalla matrimonio. Diretto pubblicare cura uso confronto rapido.', 1, 0),
(57, 'Massimo unico massimo', 'Pericoloso esporre pieno possibilità. Potere corpo stanco assicurare diffondere dirigere esempio. Università sacro voi piangere imporre contento.\nAttività costa rompere amico francese peso gesto. Giù proporre patria pieno fratello continuare tuttavia.\nDon voi passo usare problema volta. Programma secolo arma cantare fianco opera. Rapido pace condizione funzione vita raccontare fame.\nLontano oggetto periodo dietro attuale chiave aggiungere. Automobile studiare dolore vostro rivelare attenzione.', '1981-10-14', 'Francese', NULL, 1, 0),
(58, 'Usare pubblicare', 'Parlare dividere attraversare significare bravo. Chi idea corrente faccia.\nRingraziare esprimere povero centrale allora strada visita. Resto errore estendere tra.\nFissare quello tavolo succedere. Tu appoggiare uno no comprare. Costringere dio strano neppure.\nOpporre troppo vedere piacere cane avanzare principale.\nServire liberare pubblicare rispetto entrare no. Tempo sostenere scorrere completamente offendere ministro. Camera grazie mandare affermare questo segretario.', '2020-10-14', 'Inglese', NULL, 1, 0),
(59, 'Paese articolo', 'Completamente grosso meglio figlio. Provvedere giudicare sentire avanti. Moglie presidente posare vestire tendere. Generale rompere morire possibilità.\nLetto luogo centro se parere. Concludere chiedere costruire. Controllo decisione cortile caratteristico caro.\nPoco sentimento base cosa scala. Occasione ambiente oppure inverno fino.', '2017-10-14', 'Spagnolo', 'Tornare resistere grazia lato intanto ritenere. Qui paura chiudere.\nPietra soldato qualità povero primo invitare superiore passo. Nero contrario più spiegare sviluppo.\nIl dolore tenere eccetera destino oggetto. Elemento ricevere accogliere infine morire.\nRealtà interesse inglese lettera sì. Pieno militare decidere energia considerare giugno giro dove. Intorno padrone funzione ricerca ordine voglia.\nDonna centro ammettere capello giovanotto. Dinanzi assai abitare centrale oh riguardare cielo. Festa sorridere presenza campo speciale gesto.\nDentro spettacolo finestra circa utile. Passato attesa successo capo tavolo origine fresco. Un alzare cortile automobile notare consiglio università.\nTutto lira dietro calcio elettrico tratto ordinare. Determinare tecnico esempio piede prodotto. Lasciare regione con formare posto.\nFamoso mestiere duro giusto servizio anche. Bene pianta proposito spettacolo prezzo metà destro.', 0, 0),
(60, 'Usare certo', NULL, '2024-10-14', 'Tedesco', 'Giovanotto pace metro possibilità. Conto giusto odore senza proposito giustizia recare. Libero provare massa accanto limitare.\nDipendere fine vecchio accompagnare. Ricchezza luna davvero vi dire procedere avanti carta. Tendere attaccare tale animale medico legge ufficio.\nTipo grazie davvero che.\nStanza tedesco signorina zitto straordinario straordinario. Importare entro accendere metro.\nGatto inutile ecco fianco finalmente. Distruggere eppure produrre vicino speciale atteggiamento. Ospedale caffè interessante in guardia volgere chiedere.\nDecidere pelle fantasia giornale. Guardare muro richiedere uguale.\nFoglia scorrere sì famoso. Giro affrontare riportare fermo molto piccolo.\nDiverso distinguere esso colore rivoluzione svolgere paese. Periodo inverno vasto amico.\nSpingere raccontare bagno particolare lei città. Immagine pericoloso specie donna creare ognuno verde. Dito offendere americano coscienza.\nProposito nord là pesare cortile moderno provocare.', 0, 0),
(61, 'Chi escludere toccare guardia potenza', 'Attuale simile indicare inoltre immagine forza altro fratello. Albero nord addirittura comprare. Apparire fianco naturalmente vostro.\nImportante scappare sorgere possedere. Contrario suo ritorno magari provocare segreto età. Realtà iniziare domandare difficile macchina parete stato preparare.\nOspedale noto ministro pena niente effetto braccio.\nNave appena espressione politica fiume puro.', '2019-10-14', 'Inglese', 'Lontano interno costituire diverso. Centrale signore base quello chiudere buio riprendere. Rivedere infine cambiare innamorare periodo conseguenza rappresentare lato. Che ombra dovere libero grado comunicazione montagna insegnare.\nOrdinare però finalmente presenza americano chiaro pezzo comunque. Attorno sino avanzare frase amare mare. Infine posizione caratteristico poiché sbagliare atto svegliare.\nUltimo proprio valle intenzione estero difesa ombra. Accompagnare piede prossimo massimo trarre dolce animale. Noto dovere concetto cattolico rientrare ricordo.\nGiusto già palazzo zitto rientrare gente imporre. Silenzio tecnico attività.\nPeso ufficio sacro troppo proporre studiare. Segreto sviluppo peso questo famoso mancare. Scegliere superare ora giardino appoggiare notizia.\nVoi si volta nuovo. Tagliare origine impedire risultato gusto. Dichiarare braccio centrale.\nInizio piuttosto industria potere pronto posare titolo. Essere interesse oro morire persona vario.', 1, 0),
(62, 'Nemico abito motivo', 'Soprattutto sorella cantare consiglio. Marito partire importante. Bambina avere gioia consiglio escludere insieme scala accordo.\nSvolgere interessare europeo uccidere caffè. Anno aggiungere numero correre. Lato albero mondo produzione stazione.\nDon umano stasera lavorare. Zia vi visita rendere. Fortuna proprio morale. Sognare prato pomeriggio.\nOperazione mente don direzione proporre. Attimo ne ragazza. O cadere chiedere volare.', '2017-10-14', 'Inglese', 'Essere giovane difendere difficile. Ricco antico costa.\nPiccolo popolo milione colore. Spesso sotto legare prodotto origine parere. Qui profondo sociale usare.\nVia giornata piangere giustizia anche. Settimana destro polizia sperare risolvere richiedere con. Finché fronte campagna spingere contenere figlia ricevere.\nPalazzo necessità metro raggiungere dopo dimenticare presso. Stabilire usare pronto ciascuno. Raggiungere pieno luce folla ragazzo ottenere fronte.\nNecessario luogo recare sereno. Gatto affatto giustizia ma.\nCostringere volare eccellenza straordinario attuale. Studio modo giovane confronto estremo espressione. Dio affatto lingua polizia piantare mattina vario.\nPregare conoscere badare aggiungere oggetto caldo intendere.\nQuesto oro concludere lo orecchio. Ufficiale oppure loro pezzo subito presenza dire rispondere. Privato diventare addirittura anche estero merito spesa.', 1, 0),
(63, 'Colore ricerca', 'Civiltà ritorno straordinario invitare meglio. Grigio azione industriale mente resistere nemmeno mantenere. Durante romano significare operaio. Chissà colpa economico lontano bambina popolo morale.\nMalattia aiuto sole compiere uccidere tra scegliere storico. Essere motivo giocare terreno tavola antico espressione.\nFerire via pianta camminare utile tutto. Settimana pietra antico notevole usare valore. Partecipare utile ricchezza prevedere isola credere processo disposizione.', '2000-10-14', 'Francese', 'Stanza base affrontare tendere uso frutto territorio. Dio serie giovane dottore questione rimettere volontà. Straordinario numero certo estremo muovere capo. Servire semplice suonare parlare accompagnare.\nComodo giovanotto principale. Valere bocca attraversare classe normale prima rispetto.\nSuccesso quello sangue attore. Secondo caro promettere.\nBrutto colpire vicino zia luogo assai produrre. Addirittura mattino si poeta passione profondo. Avanti luogo chilometro buono scrittore inglese esercito. Bosco vista sembrare preciso vedere armare riuscire.\nRecente tenere uno difesa grave soltanto. Prato guerra amico.\nAspetto alto limitare momento vicino facile sentire. Albergo fondare domandare. Sapere limitare estremo. Un pronto abbastanza errore altro entrare.\nDistanza nave zia ritornare. Breve bellezza muovere mio figlio suo. Ferro resto avvocato antico tratto completamente.\nRivelare nazione chiamare li merito. Scuola tratto anno capello naturalmente quasi necessità.', 1, 0),
(64, 'Riportare interesse pianura', 'Crescere muro situazione resistere peccato. Amico meno importanza milione. Espressione contro compagnia prima amare osservare.\nProcedere appartenere monte stanza chiaro scoppiare. Desiderio oppure difficile opera.\nRapporto proporre finalmente uso problema. Serie rivelare bruciare umano se religioso giudizio.\nFratello li maggio ma. Età e ricchezza serie creare arrestare.', '1990-10-14', 'Spagnolo', 'Solito monte guerra confronto salire posizione. Maniera davvero riguardare noi fiore. Fede voce stato ragione rapporto si organizzare.\nPieno toccare industriale maniera corsa guardare pazzo.\nGuardia concedere provvedere colpire. Allora finestra personale conto contenere porto spettacolo.\nAvvenire opera profondo salire. Passare rapporto bagno rimanere tipo sorridere. Finalmente fuoco ancora macchina sorridere. Su vedere militare errore.\nMetro azzurro stagione infatti anche. Presenza temere offrire ancora nero superare. Accogliere concedere facile sedere romano.\nSenza intanto musica. Istante relazione cura significare ombra cielo caro metro. Classe scena tutto corsa pane considerare domanda.\nRitorno ultimo carta. Divertire cadere crescere scrivere. Pensare calcio fondare stampa.\nProposito niente direttore autorità ricordare salutare pena. Intorno servire mese campagna. Qualunque veramente attuale massa proposta peccato.\nEnorme camera particolare. Ferire cosa dovere legare.', 1, 0),
(65, 'Liberare gioia', 'Abbandonare nudo cui crisi. Tavolo ferire pieno.\nSino pericolo controllo prodotto invece. Orecchio compagnia direttore incontrare grigio vestito forza.\nEstendere temere sereno tardi. Dedicare veramente il costruire direzione don disporre.\nTuo battaglia sedere bravo mandare medico naturale avvicinare. Cane immagine letto pelle campagna. Successo sopra coprire personale.\nOrdinare trattare passato calcio lettera. Onore pure materia povero. Abitare caldo fortuna sistema sviluppo.', '2017-10-14', 'Tedesco', 'Italiano epoca meno possedere. Sentimento controllo determinare necessità inverno estero disporre. Trovare minuto pace dito. Ciascuno recente giusto mattina.\nVeramente nessuno animo materia politico affare difficile. Sicuro coraggio piccolo toccare pericolo buono bosco vista. Voce mangiare commissione trasformare.\nNazionale superiore memoria più contare. Male silenzio armare sviluppo grande pezzo libero pericoloso. Ricordare produrre guardare lavorare.\nNazionale giornale linea qualcosa dormire dipendere distinguere. Roba frase volare fatica viaggio.\nDente sopra problema li attuale nord eccellenza. Accettare figura salutare lasciare mattina fiume pagare. Meglio preciso niente nave pieno liberare caratteristico.\nBadare parlare avvocato bastare ridere punto. Colpa ritrovare scala fratello. Fra oggi albero piazza.\nSpeciale fretta ammazzare intero ogni consentire. Ministro questione comporre risultato semplice. Fortuna nascere pregare lavorare tenere scegliere.\nRisultato dietro fondo.', 1, 0),
(66, 'Sangue stasera', 'Ponte attenzione abbastanza uomo. Sottile viso signore tuo contrario scrittore pietra.\nFiore vita inglese zia sala grave attaccare crisi. Insomma buttare religioso fuggire dopo partito duro. Latte avere giocare staccare qualunque militare.\nGreco tratto animo allontanare unico nord presto. Occhio pubblico finalmente sedere verde.', '2007-10-14', 'Francese', NULL, 1, 0),
(67, 'Scienza', NULL, '2001-10-14', 'Italiano', 'Dimenticare scorrere battaglia un carne risposta atto stamattina. Presente accettare importante fumare mare attimo. Tenere verso lotta zona.\nSpalla semplice smettere evitare. Principio rimettere loro personaggio scusare avvicinare.\nEpoca leggero americano segreto inverno esporre difendere. Prossimo carta parecchio porta occhio. Cioè sopra chilometro programma commercio fame perciò volere.\nLoro appoggiare lingua civile accettare tornare.\nAiutare notizia tuttavia togliere assoluto tardi domenica. Battaglia volontà giudizio conseguenza cucina cadere ogni desiderare. Tendere durante solito letto destino.\nGiovanotto origine innamorare qualcosa avanti coprire. Difficoltà accogliere ufficio avanti. Aiuto figlia alcuno fianco invece.\nIntorno vecchio imporre leggere. Tagliare avvenire tentare pensiero intendere madre sentimento. Mettere distruggere speciale esperienza fondare noi. Più moglie direttore genere legge mattino amore intorno.', 1, 0),
(68, 'Valere appunto destro soprattutto ritrovare bruciare sicurezza', 'Aria arma salutare mattino. Tale distruggere verso togliere albero.\nCittadino arrivare però appena. Scherzare fretta caffè caffè.\nRispetto gruppo medico futuro riprendere fame minimo. Terzo riportare bambino sposare baciare successo insomma. Denaro immagine territorio imparare bambina gruppo.\nOro superare domani baciare arrivare attorno prossimo. Forse figlia marito raggiungere.', '1996-10-14', 'Tedesco', 'Crescere giusto pensiero attimo domani uomo ricordare. Sacrificio vostro arte erba pesare. Comune sostenere proporre gioia ricordare bestia folla.\nSaltare elevare in ecco tecnico durare. Accogliere presto mattina triste godere senso capello.\nCuore viso no sangue. Operazione preferire incontrare dormire. Italiano facile differenza sforzo nessuno situazione.\nBianco offendere sinistro. Carta centrale difendere biondo cultura convincere.\nFolla suo rapporto. Alzare guidare guidare arma. Isola prova proposta privato.\nSera risolvere trascinare lavorare libro finire gatto uguale. Rivedere anche volta girare.\nTrarre trattare signore dinanzi ordine serie risposta udire. Regione discutere metro.\nFinché impossibile potenza dente. Abito rifiutare fatica fiore tardi chiave.\nLettera se solo cadere usare. Pericoloso principale foglia campagna piuttosto voi.\nSembrare chiaro giovanotto stato dare animo bambina. Sopra testa lanciare insegnare scendere giudizio.', 1, 0),
(69, 'Svegliare montagna', NULL, '1999-10-14', 'Italiano', 'Tu provare durare voltare patria lavoro. Mi consiglio titolo maggio cavallo ecco.\nAspetto interesse fede scoprire padre in appoggiare tranquillo. Effetto occhio meno fortuna pietà necessità probabilmente. Dimostrare vero bosco. Infatti niente elemento prova matrimonio giardino storia.\nSentimento funzione pane incontrare spettacolo caffè greco. Pagare meno perfetto parecchio.\nPrevedere crisi bere pubblicare chissà sud. Voglia fondo però simile società terreno ordine mandare. Fame grande montagna sviluppo eccellenza certamente.\nQua paura bambina estendere.\nLavoro insistere ambiente importante coraggio girare. Attorno vestito tempo titolo. Continuo li attenzione ma.\nFiducia terreno accadere contenere cosa. Neppure fino attaccare ridere.\nNotare forza accorgersi risolvere posto. Esercito brutto maggiore loro caso rispetto. Esempio buono smettere aggiungere notizia domenica.', 1, 0),
(70, 'Chi posto pace', 'Noto lui proposta tipo migliore produrre. Procedere giocare giustizia dolce fresco bagno dito.\nOmbra guidare dividere come. Qualsiasi politico cucina decisione.\nBellezza esperienza corso. Determinare cioè pezzo.\nScendere senza battere cultura largo formare. Ciò governo elevare territorio campo operazione.\nAbito sorridere colpire. Giorno festa scoprire. Operaio ognuno attuale internazionale memoria scopo direttore.\nProssimo porre naturale forse fornire povero ragione. Lira mi avanzare imporre.', '2000-10-14', 'Tedesco', 'Nessuno fretta scrittore politico vincere. Temere fame comunque destino.\nResistere trascinare fronte freddo. Croce utile sì aria carattere capitare. Proporre giornata conto descrivere metà veramente.\nTrascinare elemento maggiore bere faccia interno. Levare aiuto innamorare toccare. Desiderio numeroso esso qua.\nTesta stazione caratteristico insieme meno. Esistere riunire sottile caro riva conoscenza angolo. Presto energia o cortile.\nDunque pure strada partire senso.\nTecnico dolce costringere cominciare macchina vento imparare. Pranzo fretta mantenere dividere valore creare quello. Matrimonio meglio ridurre occorrere.\nUguale esperienza successo finalmente giallo nessuno bruciare memoria. Attenzione lasciare infine fermare letto quanto. Ordine punto spazio valere caldo.\nStanco camera promettere bocca interessare sala. Intero estero lira volta sociale sacrificio occorrere. Fermare girare spirito.', 1, 0),
(71, 'Serie prendere', 'Creare armare innamorare formare raggiungere procedere piuttosto. Fiore pietà umano concetto.\nSpalla seguire grigio evitare. Infatti braccio rosso capitare inutile cavallo fretta questo.\nAffrontare invitare scrivere fantasia. Appartenere giro angolo posizione minuto faccia ammazzare.\nTra studiare abbastanza. Territorio collina crescere orecchio gioco perfetto quasi. Continuare confronto pazzo regione pericoloso.', '1985-10-14', 'Francese', 'Appartenere maestro accadere felice morire arrestare consiglio. Stato compagnia lasciare giustizia autorità costa.\nGusto stabilire badare oramai. Tacere comune godere ultimo problema conto ci.\nContento uguale costruire bastare piuttosto.\nLegge affermare linea mercato giornata collina denaro. Avanzare potenza limitare posto. Preoccupare popolo privato aggiungere.\nSorridere diritto pranzo volto strano lungo. Strada fiume ambiente antico lettera fornire regione. Togliere quale gusto superare titolo.\nMarito alcuno difficoltà comune completamente tranquillo stato. Carne rivelare riva. Impossibile ragazza limitare.\nMio meritare ospedale reale. Segnare veramente giovane caffè.\nSegreto merito avanzare. Solito ne resto allontanare gesto marito.\nMoglie luce privato suonare perfetto vendere. Scegliere venire film ordine capace parte. Attività caso testa italiano promettere legge tono.', 1, 0),
(72, 'Di attore memoria', 'Parecchio bravo piede contatto tirare antico. Cambiare si tu città venire rappresentare. Monte in dinanzi oro dipendere.\nCostruzione medico coscienza ciò conto. Giornata passato epoca alcuno base inoltre.\nAmpio comprare lasciare concludere lei quello base. Appunto gioco numero sacrificio erba. Automobile natura volere motivo.\nBase misura giungere. Letto moderno caso occorrere bocca sentimento.\nValle rivoluzione pelle corrente. Attaccare domenica usare scala.', '1983-10-14', 'Tedesco', NULL, 1, 0),
(73, 'Suonare occorrere momento energia cadere', 'Cortile centrale frase. Musica dimenticare vestire perciò.\nAmericano prima difficile meno pubblico studiare. Probabilmente rapporto scrivere anche medio vario oggetto. Infine aspettare piantare pace. Quale relazione giù.\nTerreno stella qui battaglia accordo parlare. Dedicare lungo seguito immaginare aprire.\nAnima passato montagna cercare pace tendere. Ministro famoso patria caratteristico corsa fiore fino. Diventare mantenere congresso unire specie annunciare.\nSenso denaro macchina proposta.', '2012-10-14', 'Italiano', 'No procedere unire bambino.\nScoprire moderno enorme rompere certo affrontare. Uso esperienza festa cittadino piantare corrente.\nScrivere uguale centro pagina avvicinare personale. Festa questione risolvere concedere eh.\nPresentare grazia ricevere nemico muovere fiume. Fuoco credere caffè solito. Stesso di distinguere patria numero. Richiedere ricordo aprire soltanto medio.\nIndietro cantare superiore appoggiare qualcuno. Zona entro passato qualcosa fondo ombra contrario.\nPiede si fino evitare dubbio. Preferire fame rompere conoscere voce servire prezzo.\nCucina raccogliere considerare tardi provocare sereno. Ritorno ritorno ottenere intendere. Aiutare controllo albero sposare fame.\nDesiderio popolo mostrare.\nScusare tale caratteristico povero anzi libro centro. Tornare interessare oppure operazione tedesco.\nTendere possibile continuare preparare. No civile albergo ultimo parecchio. Massimo maggiore alto guidare offrire scena.', 0, 0),
(74, 'Oltre pieno lago confronto ragione potenza', 'Signora bastare foglia. Chi richiedere procedere pianta soluzione bravo troppo accompagnare. Ritenere nave tavola scendere.\nMacchina vostro sguardo assumere conoscenza. Massimo teatro gamba università. Accogliere accompagnare riguardare produzione erba paura ridurre.\nContare tuo desiderare notizia difficoltà su. Romano da esercito breve governo stasera pieno scendere. Scomparire risultare rivedere comprare recare essere aprire carne.', '1997-10-14', 'Italiano', 'Piantare forma trattare disposizione figura. Terreno tardi sorella sbagliare terreno mestiere compagnia.\nQuarto decisione gente prendere regione. Confessare anche prossimo grigio diritto. Domenica contenere privato.\nGesto sopra risolvere ampio. Servire vista giovanotto attendere oro internazionale.\nMigliore giovanotto impressione accettare personaggio finire voltare coloro. Vista labbro allontanare ridere notare continuo tavola.\nPresidente tardi pensiero strada. Caldo mettere angolo. Proposito maggio guidare indietro ritorno accadere.\nTirare prova riferire discutere dimenticare sottile civile.\nBraccio economico militare militare. Fenomeno a né improvviso loro forma comporre. Spingere nazionale tipo lago vestito domenica.\nAssistere destro toccare procedere scuola.\nGruppo certamente aiutare già corrente freddo trovare.\nLevare inverno lingua.', 1, 0),
(75, 'Accendere', 'Chiedere civiltà guidare rosso oltre. Vita piede io. Sentimento speciale ritorno distinguere raccontare.\nNatura ottenere onore morire confessare peso tenere. Morte opinione imparare voglia antico già. Direttore studio stazione cosa automobile materia.\nVicino esistere sacro provvedere mandare. Bellezza automobile vita principio isola.\nVolare anzi stato. O migliore accompagnare guidare comodo giusto. Sedere aiutare triste armare contrario egli.', '1988-10-14', 'Tedesco', 'Servizio cui stamattina vedere verità. Usare oggi esercito abito.\nContatto questione odore numeroso vasto cadere limitare. Intero pelle erba dormire ridere russo.\nVento terzo viaggio pomeriggio vedere contadino bambino grosso. Pericolo appena ci mano. Quello uno termine disporre esercito uomo proprio.\nLui ascoltare qualcosa idea immaginare nord. Finalmente pregare mondo secolo. Armare sacrificio qualche bisogno. Opporre offendere privato qua sapere addosso.\nPreoccupare sala pesare ognuno parte antico ricordare pianura. Personaggio provvedere grosso. Ricordo insomma fianco diretto concedere studio coloro perdere.\nRimettere albergo significare. Istante colpire mio sicuro togliere fretta avvertire. Romano chiesa invitare figura interessante diretto comprare faccia.\nMeglio necessità anno stare contatto. Raccogliere stanco loro dietro comporre noto felice.\nMedico lontano ringraziare processo. Quasi quanto mese battere riempire. Letto segretario resistere affatto.', 1, 0),
(76, 'Divenire pesare', NULL, '1977-10-14', 'Tedesco', NULL, 1, 0),
(77, 'Ieri giugno indietro', 'Padre attorno servizio nulla numeroso opinione. Bosco folla tempo tra vita coloro meno.\nDolce ricco pure metro infatti forza fianco. Contatto autorità sguardo sino voltare linea. Liberare accorgersi bisogno occasione costruzione coscienza no. Dividere corsa mestiere.\nInverno preoccupare naturalmente ritorno. Accogliere mestiere acqua naturale francese.\nRompere eccetera aspetto. Primo capello inizio commercio faccia brutto.', '2014-10-14', 'Italiano', NULL, 1, 0),
(78, 'Trascinare proporre', NULL, '2017-10-14', 'Italiano', 'Zia esperienza dichiarare. Vero dottore bene staccare problema.\nTornare porta stazione. Ora piantare badare attorno voi abbandonare. Provvedere resto maggiore estendere non fronte nobile.\nSoldato vario intenzione estero.\nMoglie commercio rivelare notevole bosco. Concetto crescere uno memoria casa giudicare.\nFuori mattino anima mondo. Chiamare fino legge ritorno li.\nRientrare chiudere mancare rapporto fine sacro.\nTerzo baciare grosso facile.\nLasciare possedere iniziare descrivere neanche trarre tuttavia peso. Processo annunciare privato difficile bambino su guerra comunicazione.\nNudo bisogno grande continuo. Orecchio arrivare affatto pericoloso estendere.\nPietà principe fiore ridere viaggio. Sognare per attendere togliere animale marito folla. Gridare migliore vicino lo pure.\nRecente luogo possibile smettere staccare inizio.\nAvere dolore conseguenza rapido vestire fenomeno felice. Fornire sorella stringere guidare piccolo. Volontà gente ricordare.', 1, 0),
(79, 'Come chilometro in viaggio', 'Certo concetto cura certamente provocare fortuna stare. Raccontare successo convincere sistema medesimo.\nUsare vero pericoloso poesia stella volere inizio questo. Numero guerra figura contenere.\nLui abitare poco principe tranquillo giornata.\nNome possibilità sorprendere diffondere figurare. Autorità colpire amare vicino luogo.\nDistinguere mio sorgere mio ricordare recare relazione. Nuovo porto senza saltare vero oggi comunque vento.', '2025-10-14', 'Inglese', 'Solito profondo interesse specie udire libro attività vento. Sino grigio su arrestare.\nSpecie neppure presentare dolore fantasia. Riconoscere basso gesto idea giardino minuto differenza. Scala concludere qualcosa fumare.\nRiconoscere maniera bambino scoprire costituire completamente.\nMinistro grande città eppure avvenire campo.\nStesso nemico egli leggero porta fretta noi. Assai spesa treno servizio aspetto società provincia.\nSoffrire nero niente. Riprendere davanti ministro cadere più. Compagno giustizia qualcosa stupido poco.\nLargo avvocato principe mattino sorprendere prossimo rispondere anzi. Ampio limite programma offendere. Politica mi provare ciascuno dietro aiuto discutere.\nMovimento aggiungere lira oltre denaro raccogliere durare. Spazio massimo articolo.\nVero caldo alzare coloro. Portare genere mostrare fondare stanza rispondere.\nAprire lotta bocca musica allontanare. Vasto affatto filo frutto bisogno condurre prendere.', 1, 0),
(80, 'Inutile', 'Spettacolo forma scrittore signore dunque sangue. Papà modo essa resto compagnia senso. Collo provincia punto favore.\nSoluzione atteggiamento domani chiudere politica contro. Luogo vestire parte qualunque tutto appoggiare. Trovare no ah però abitare attore.\nLuna valere muro. Comune coscienza movimento meritare. Lettera bene denaro cosa forza dopo.\nParecchio sì nome uso posare bisognare scena. Sacrificio sereno cadere mandare sviluppo mentre. Città sposare maggio chiave.', '2024-10-14', 'Italiano', 'Ne teatro giugno avanti pena grosso intorno. Perciò ognuno conto male. Quadro pericolo nome ne estendere.\nGiocare no per senso qualità specie. Neppure valle tratto.\nFabbrica prodotto comprare commercio don. Bere classe bosco corrente provvedere consiglio. Montagna costringere su proposito. Spesa mi rimettere serie fornire sera libero.\nAcqua pietà chi. Importante opinione punto mattino ordinare elevare moderno.\nSperanza parlare serie leggero enorme. Disporre continuo ricordare. Prevedere trattare calcio provincia qualunque bianco venire.\nSperare senza intanto accettare natura rivedere lavoro.\nStringere uomo strumento concedere raccogliere bene probabilmente significare. Porre politico smettere verità più qualunque.\nComprare freddo sino presentare sogno seguito domenica invece. Concedere figlio sangue scena abitare quale.\nParte storia sapere verde passione. Misura pezzo uscire termine guardare odore.', 1, 0);
INSERT INTO `bookinfo` (`BookInfoID`, `Title`, `Description`, `PublicationYear`, `Language`, `Summary`, `IsAvailable`, `IsDeleted`) VALUES
(81, 'Don vita signorina buono', NULL, '2021-10-14', 'Spagnolo', 'Lo linea alto riferire scherzare antico triste segnare. Accompagnare finire morire rompere breve vario.\nFiglio letto forma tirare annunciare durare. Sguardo attimo braccio.\nLingua marito sì rapporto fine occasione. Apparire scoppiare chissà funzione.\nStella bene bello pianura intero. Accadere finalmente provincia cambiare lui civiltà repubblica.\nCantare classe girare piano appena leggero loro. Stesso ponte esprimere inoltre università dolce.\nDirettore francese durante prezzo spalla prossimo. Sinistro sera scuola perfetto interessare alto.\nRisultato sbagliare genere superare. Milione attraversare noto contrario. Abito punto produzione più espressione.\nFatto popolo ascoltare albergo luogo scappare. Chiave scappare prossimo.\nAnimale spiegare pace vestito.\nFretta religioso presentare ferro treno imporre. Cristiano linea mandare attività.\nMare greco scegliere affare buttare. Togliere errore donna inglese ricordare ferro scoppiare. Mese nemico andare adesso fissare mattina.', 0, 0),
(82, 'Notte zona affare', 'Assoluto rosso antico comunicazione necessario temere lago. Intorno domani dovere.\nGodere più zio destro. Giornale permettere mestiere difficoltà verità. Perdere camera volere dimostrare intorno maggiore.\nLetto straniero tirare attività bocca odore piacere. Stanza rientrare distanza contenere amico.\nEconomico parola via fuori ci scomparire. Contrario diritto medesimo palazzo università.\nBiondo completamente carta vino salire. Padre raccogliere cielo addirittura quadro conseguenza accettare.', '1978-10-14', 'Tedesco', 'Provincia tale voce buio medico. Figlio coloro notevole sì triste. Comprendere muro pena. Evitare funzione uno riunire.\nSpesa scrittore legare mezzo pronto dire. Uomo tendere poesia sviluppo albero entrare calcio.\nVostro esistere costringere ogni. Sì valle movimento ora religioso. Invitare commissione fondo luna preciso risposta. Quello sì distanza nazione leggero epoca.\nAttività nascere attività intero grigio vista sorgere. Nord espressione volere bestia spettacolo antico dopo. Cristiano disposizione calcio maestro.\nInteresse carta pensare scegliere poeta ricordo. Bianco dottore papà interno.\nFondare storia epoca sorprendere punto giù.\nCorrente malattia chiave questo partecipare abbandonare inglese. Affare valore già offendere confronto estero sereno.\nPossibilità notevole civiltà. Chiedere valere calcio presentare.\nAspetto latte automobile partito pianura grazia cielo. Comprare merito inizio resistere organizzare domenica prendere mercato.', 1, 0),
(83, 'Fra stabilire posare notevole', 'Dopo realtà specie. Inutile nudo promettere affatto desiderio partire eppure.\nSede parecchio pieno comprendere.\nAllontanare cioè escludere mentre importanza. Invece monte scrittore fuggire. Vostro intanto buttare fuoco.\nPorre zia sereno accendere. Colpa con lanciare bocca momento.', '1999-10-14', 'Francese', NULL, 1, 0),
(84, 'Carattere ordinare', 'Albergo godere sottile secondo secondo valle o. Brutto svegliare pure rosso partire merito.\nGoverno dunque moglie malattia fiore. Ampio carattere segnare nuovo pietra bisogno fratello. Entrare povero grande riunire accadere appunto persona accendere.\nFratello albero mantenere centro collina guardia abitare. Chilometro rompere pubblico cominciare tecnico chiesa. Gridare nemico profondo innamorare azione.\nCuore domandare domanda attore filo fiducia. Giusto rientrare quale ritorno.', '2001-10-14', 'Italiano', NULL, 0, 0),
(85, 'Meglio', 'Bosco levare musica.\nLabbro elemento esporre bambina mezzo momento parlare. Impossibile silenzio personale caldo vero oh se voglia. Prima volere cioè osservare.\nBisognare parere smettere. Sottile sede andare piccolo smettere badare giungere.\nGiallo animale greco pianta lungo qualità industriale.\nInsomma concedere guerra sedere felice giovane proporre. Dare tardi riferire anche intendere.\nPrendere ripetere legare. Amare spalla preferire importante tanto pietà voltare tuttavia.', '2002-10-14', 'Italiano', 'Occorrere articolo normale esempio fatica cittadino minuto. Temere pezzo maggio a.\nAttimo milione pieno imparare difendere. Raccontare monte mi su generale.\nRichiedere muovere giorno ferire istituto guerra mandare. Forte pranzo contenere scoppiare esistere coraggio fuoco.\nPortare pagare presente. Direttore nudo perdere sociale nobile stasera periodo.\nBere ogni riuscire aggiungere aggiungere continuo. Avvocato cui ricordo aggiungere direzione. Grado popolo carne porta.\nPorto impressione sala sorriso diretto levare. Istante via scorrere morire gamba.\nRendere appoggiare tentare proporre medio giorno. Linea possedere articolo celebrare troppo periodo affatto.\nBocca inoltre repubblica pubblicare. Preparare disposizione età differenza. Visita ne peso dare. Rivolgere giovanotto ogni assicurare uomo.\nAumentare giovane fuoco tutto capace partito. Suonare fuoco lotta insegnare allora parte nome americano.\nImpedire notizia condurre operaio.\nTedesco pericolo avvicinare.', 1, 0),
(86, 'Rivelare azione libero', 'Aspetto breve speranza mio bisogno stagione. Realtà capire costituire gioia desiderio provare spesso. Misura riprendere nessuno attendere costruire rivoluzione stampa.\nEsporre noto scendere bastare roba baciare ricerca. Scorrere colpa usare godere pietra mattino intorno. Sede abitare straniero articolo altro lavorare tranquillo generale. Colpa operaio quello freddo confronto formare teatro.', '2019-10-14', 'Tedesco', 'Morire avvenire estate territorio piantare giorno sorprendere nome. Contenere latte fabbrica nazionale. Estate ritenere si. Mandare finestra cucina preoccupare.\nVivere rispondere nemico principale io nascondere. Metà capello esercito importare baciare.\nAppartenere pubblico carne giornale cominciare ragione. Dolore carta scappare contadino rivelare luogo saltare dolce. Assumere alcuno usare.\nConoscenza fiore corrente presto guerra oggetto caro. Solito notte zitto sviluppo. Programma parte meritare peso occhio onore momento recare.\nLibero metà capello figlio sacrificio figura grazie lì. Minuto preferire bellezza preferire. Mattina speciale scena assoluto semplice.\nAllora bellezza credere con. Albero sinistro zia professore. Importanza escludere animale cittadino estremo.\nEntrare camminare unire giardino pubblicare strano concetto. Appoggiare cuore donna nulla differenza.\nVolere luna fine. Pazzo preferire letto facile tecnico.', 1, 0),
(87, 'Nuovo camminare fenomeno partito controllo', 'Subito rendere fenomeno bagno minuto qualsiasi. Trovare destino vendere piuttosto perciò tranquillo proposito nord.\nDividere notte cristiano labbro. Cultura guardare che.\nPossedere riva diffondere ufficio latte qualcuno suo. Baciare gusto mostrare.\nTempo economico unico presenza questione superiore fantasia pagare. Disporre contadino neppure lo scusare diverso orecchio. Roba dentro invece loro.', '2010-10-14', 'Inglese', 'Desiderare collo sociale. Terreno ricordo mattino mancare durare numeroso.\nBruciare rifiutare perciò operaio piano tavolo occhio. Qualunque frutto spalla vincere. Stanza enorme dinanzi frase odore.\nSpettacolo caratteristico sperare cristiano. Università qualunque quello periodo riempire ritorno ordinare. Magari appunto vincere.\nInsegnare prevedere desiderare risolvere maniera lo. Poesia centro congresso sviluppo potenza antico.\nPorto titolo rispondere mente. Fermo palazzo salire ora avanzare parola poco. Diffondere futuro morte punto guerra pranzo.\nDisposizione lettera freddo commercio. Casa comprendere gesto ordine nazione ricordo.\nOpinione descrivere eccetera occorrere titolo modo. Unico mancare padre difendere condizione. Cantare tacere riferire trasformare diretto.\nCondurre poiché loro sperare rifiutare vestire politico normale.\nQuindi uguale mantenere neppure ci. Cercare distanza serio moderno ministro spingere.\nCommissione maniera largo notte fretta scoppiare mese.', 0, 0),
(88, 'Superiore tavola', 'Comprendere maggiore addirittura comunque. Epoca prevedere dottore apparire ciascuno bravo.\nCaratteristico importante sicurezza lato. Raccogliere affrontare avanti elettrico.\nFavore direttore giornale elettrico stare.\nAnnunciare almeno vincere denaro pronto chiave medico. Baciare duro università dividere chiaro. Dottore bere ammazzare proposta conoscenza ecco.\nLo principale ambiente toccare capello lo. Silenzio costituire tenere nome fiore. Ritornare pomeriggio epoca.', '2011-10-14', 'Spagnolo', 'Pure meno aiutare veramente uso villa assoluto.\nVi sotto commissione stella oggi. Bellezza invitare testa lotta concludere luogo. Coscienza messa almeno grazia tanto lui recare.\nEsempio sostenere meglio aspetto. Sostenere ridurre signorina maniera partito pietà bianco. Labbro risultato pagina ma.\nValle ragazzo stesso normale baciare subito rapido importanza. Udire finalmente gioco fuori. Importanza costruire confessare scorrere donna.\nStato risultato giustizia potere poiché animale nuovo. Assistere parecchio guerra foglia civile medesimo essere porto. Impossibile cominciare vincere giungere consiglio leggere.\nDinanzi notevole lettera sud bere conseguenza luce. Qualcosa ordine lontano pena un.\nMisura ognuno luna principe bastare peso sistema.\nTuttavia allontanare neppure creare abitare sud distinguere. Presente comprendere fondare meglio. Bambina correre abitare addosso capace pesare russo.', 1, 0),
(89, 'Finalmente faccia pietra preoccupare bosco', 'Corsa rappresentare dunque accanto smettere durare. Mostrare cavallo tanto lì motivo indicare. Grave scegliere camminare nord contrario.\nInsegnare utile soluzione spalla là bere fabbrica produzione. Allontanare esperienza ridere ammettere bravo stesso vi. Tuo accanto specie procedere buttare treno ritrovare età.\nToccare confessare no cattolico spingere malattia vestire. Risposta uomo successo insegnare qualsiasi insomma questione accordo.', '1988-10-14', 'Francese', 'Gamba improvviso in vecchio superare sostenere luna restare. Lasciare volere amore presto.\nModerno primo spazio genere dunque basso. E importanza modo ah affare stupido nascere.\nPersona regno fumare opinione abito. Stella avvocato attaccare scienza perfino.\nConto ferro ospedale. Giudizio cuore di.\nMateria risultare veramente arte parte. Forza greco esso distruggere. Secondo scopo nazione muro effetto sicuro tendere.\nStudio sguardo inoltre abitare. Comodo sostenere concludere giorno allontanare impedire ricerca.\nVestire numeroso cuore latino nascondere naturale. Comprare fermare esperienza sereno.\nMetà risultato sotto esistere luogo piuttosto grande. Caratteristico mentre giro dire circa attesa.\nGiocare fino accendere provincia distanza. Giù proposito fuggire già finché.\nEsprimere riportare impossibile. Leggero abitare breve francese luce.', 0, 0),
(90, 'Parola uguale tu modo', 'Ferire primo istituto esame. Nascondere forza piazza già anima superiore vicino. Fuori acqua territorio antico maggiore improvviso ombra.\nUscire gruppo buono ma. Crescere esperienza quale.\nInutile bisognare certo assoluto. Albero merito ragazza dire.\nBello repubblica uno ricevere giusto contatto metà. Sentimento ritrovare infatti salutare. Casa descrivere industriale aiutare resto.', '2008-10-14', 'Italiano', 'Interessante salutare guardia momento scala pensare allora. Centro comporre eccetera terzo dire volta. Raccontare centro sentimento ospedale.\nSguardo pace valle raccontare. Superare sorriso nave gioco.\nUtile sogno russo. Appena cultura chiesa.\nVendere stringere neppure meglio camminare mezzo. Rispetto secondo vasto chiave ricordare tale.\nProporre solito proposito tornare cercare film scendere. Possibilità calcio discorso stanco. Dietro chissà signora acqua concludere.\nSalvare occasione morte parecchio dichiarare breve tale pazzo.\nLegge papà aggiungere. Opinione grigio abito figlio partire errore riempire.\nScrittore strumento colpa tuo. Latte chiudere volere essa tendere noto metà.\nTardi diritto consiglio sorriso estremo azzurro dottore.\nEssa usare territorio vero comunque. Mancare troppo recente scienza movimento.\nTacere non giro ma. Avanti occasione per massimo guardia. Sorgere sinistro quarto valore. Avvenire amico isola espressione.', 1, 0),
(91, 'Ospedale', 'Posizione capo casa felice. Mamma unire oro libertà ferire interessante. Segno capitare principe probabilmente fame offrire.\nCausa mestiere città cominciare. Non giocare giovane lettera. Speranza guidare polizia voce risposta contento.\nSinistro futuro ascoltare ospedale questo azione usare romano. Lanciare arte azzurro ma bravo. Tirare inoltre umano dio trascinare. Nome giallo mancare tuo fumare valere.', '2006-10-14', 'Tedesco', NULL, 1, 0),
(92, 'Avanti ricordo cominciare materia fuoco', 'Quanto loro ottenere fissare. Qualcuno stanco portare svolgere nazione caldo piano punto.\nAiutare limitare sereno. Spesa frase sperare zia. Più mattino entrare caldo. Guardare accorgersi salutare territorio mandare aumentare indicare.\nRisultato chiaro popolo immagine aggiungere russo desiderio. Paese mi segreto piano. Svolgere italiano vista.\nSu scendere interessare servire.', '1977-10-14', 'Inglese', NULL, 1, 0),
(93, 'Tenere grazia pianta', 'Nemmeno attento potenza promettere. Corso valere recente antico provincia costruzione anzi. Liberare superare no spiegare.\nConcetto europeo giovane.\nFrancese relazione voglia quasi campo. Fuoco domenica unire osservare opporre pagare abbastanza dolce. Giovanotto occorrere epoca risolvere maggiore lontano musica uscire.\nSpalla croce storia. Verso sociale società diverso camera.\nStraordinario ancora alcuno. Intendere orecchio conoscere.', '2015-10-14', 'Tedesco', 'Arrestare mio bisogno civile. Tempo scena giallo intanto. Privato distanza festa scienza improvviso vedere storico.\nCura qualche ombra capitare. Prima bocca creare porta piantare.\nCredere piano tavola offrire. Lotta intanto gettare antico essa scendere salvare scoppiare.\nLoro troppo giù ieri accompagnare riunire rifiutare. Fortuna fuggire là verde conoscenza elettrico. Enorme buono appoggiare giù compagno industriale.\nFianco latino ringraziare civile angolo completamente. Favore processo età.\nVoglia li pietà procedere amare raccontare cattolico. Male causa scrittore contadino ricevere ritorno. Argomento lo grosso attraversare.\nBisognare cattivo grosso baciare cielo buono industria. Capace cristiano periodo piccolo strumento generale attività. Albero domenica linea lo prodotto atto qui capace.\nEsame colpire tuttavia pure o roba. Interessare prova sposare pianta.', 1, 0),
(94, 'Dare fede giù classe', NULL, '1999-10-14', 'Spagnolo', 'Proposta esporre don pietà periodo domandare. Grazia genere posto studiare nave azione abbastanza pianta. Calcio atto poeta sogno ritornare fretta.\nRispondere gusto voi accorgersi. Subito spettacolo riguardare villa. Sforzo buio allora lanciare riconoscere tale. Costa giudizio cura povero cuore personaggio ridurre.\nTeatro avvertire europeo. Attore organizzare provocare latino industriale camminare. Momento corrente bello duro viso forma dentro.\nRidere desiderio parere innamorare. Condizione albero vario industriale rimettere. Vendere ospedale amare suonare con sapere medio studiare.\nScala estero stringere enorme. Fuori profondo papà padrone università perfetto tornare spingere. Bosco spingere volgere signora godere gente governo.\nPure niente ragione resto. Unire erba periodo don milione.\nMilione o conseguenza. Ieri importante avvenire cui colpa esprimere domani.', 0, 0),
(95, 'Temere odore grazia', 'Punta scienza indicare lì.\nIndicare trattare messa stasera segreto prevedere quadro. Uccidere destro ogni luce fiume attraversare condizione amore.\nForma misura aprire opporre mio internazionale scorrere. Luna qualità qualità messa scrittore destino limitare. Recare ammettere uno senza idea papà tipo. Concedere però domandare opera costa.\nSole verità lui amico vi forza comunicazione. Toccare ragazza tagliare rivoluzione provvedere rimettere.', '2009-10-14', 'Inglese', NULL, 0, 0),
(96, 'Misura sonno bambina buio lago', 'Colpo quarto dipendere notevole assistere lei sopra. Chiamare sicuro li insieme bambino escludere certo compagnia.\nTerreno accanto legare nazione rientrare triste. Accendere avanzare perciò difficile ospedale. Metà vendere guardare. Sperare presente diritto sonno attesa rivelare presente.\nVicino periodo continuare silenzio. Eppure dente dormire. Uccidere desiderare perfetto.\nLetto rimanere contento chiave libero ragazzo voi viso. Indietro secolo mente volontà discorso.', '1995-10-14', 'Francese', 'Attaccare distruggere tipo idea errore. Lira organizzare stare famoso festa conservare materia porto. Importanza accadere sbagliare.\nPeccato nazione sede film tu. Accanto verità essa capitare dirigere questo.\nOrdinare riempire collina lavorare dio tentare conto.\nFerire strumento camminare nemmeno noto. Avanti impedire carne finalmente ricchezza presso.\nPersonaggio colore liberare verità. Esempio descrivere dunque. Crescere sole corso chiesa giustizia movimento casa cantare. Provincia coprire offrire minimo denaro ricerca.\nSuperare portare io crescere. Bambino notevole grazia oggetto sentimento.\nDomani parere conto intorno qualunque straordinario riportare. Controllo costruire buttare sottile mancare imporre.\nSistema intenzione puro piano messa. Badare vincere ragione. Pagare spirito pesare rimettere.\nProposta succedere qualunque tono gettare punto battaglia anno. Piacere appena movimento biondo ampio tempo peccato. Ritornare passo quale ricevere.', 1, 0),
(97, 'Risultare dare riconoscere rifiutare gatto', 'Accanto pranzo simile pieno. Folla punto morale infine proprio ferro nostro mercato.\nSignorina assai espressione cielo numeroso importanza. Rientrare proprio prossimo mancare attaccare.\nInterno materia tentare fame. Spirito tanto civile aprire mezzo spesa.\nPossibilità sorgere invece motivo con nemmeno immaginare usare. Riva stare anche tornare trascinare produrre stanco.\nGamba repubblica stamattina. Raccontare cattolico destino avvenire.', '1975-10-14', 'Tedesco', NULL, 1, 0),
(98, 'Difficile chi prato', 'Tanto facile don musica. Stella stesso favore frase scrivere. Uno rivolgere passato rimanere oggetto minuto. Neppure raggiungere li caffè non domani.\nOpera intanto peggio volare militare russo. Personale accendere folla pietà frutto dolore.\nSì io paese ospedale secondo sentimento. Scendere rispetto studio stabilire repubblica inutile.\nInizio ombra ah inglese spalla. Ora riprendere verso medico impedire diffondere né. Labbro camera assai. Trattare continuare segnare campagna.', '1981-10-14', 'Italiano', 'Povero semplice denaro finalmente breve attaccare motivo. Segnare offrire accettare tentare opinione pubblicare.\nVolare oramai intero amare pianta guerra. Libero pomeriggio sguardo giungere successo giardino.\nTrovare probabilmente stato io maggiore elevare attuale. Buono lago produzione chiedere attività ripetere.\nDestino sostenere chilometro processo tagliare. Altro pagina fatica esercito scappare sacrificio. Scorrere affrontare forma.\nCosa produzione contare difendere là continuare. Dovere speranza titolo industria.\nFratello intendere desiderio gruppo dipendere appartenere guerra campo. Ragazzo rompere ritorno probabilmente avanzare. Lotta pensiero estremo vento onore commissione scusare a.\nEsperienza ministro bisogno stare a odore giardino. Necessario legge entro esistere ascoltare poiché arma mettere.\nDividere udire rispondere. Raggiungere minimo parere maggiore grande resistere raggiungere.\nSuccesso stella poesia pomeriggio ordinare pietra. Nudo dichiarare addirittura ieri.', 0, 0),
(99, 'Per toccare provvedere piuttosto', 'Soffrire attaccare stazione stagione desiderio quello confessare. Comprare azzurro dichiarare unire italiano.\nMotivo evitare giù strumento lavoro impossibile meritare. Duro male istante volare colpa linea. Paese guerra semplice. Base durare isola.\nFiglia tipo portare assicurare no uso diffondere. Proporre energia affermare disporre facile prato salire.\nTerzo temere interessante nord svegliare passione. Senza interno adesso.', '1996-10-14', 'Tedesco', 'Scrivere offendere circa finire materia inutile caratteristico. Coraggio tempo rosso scusare storia largo.\nSorgere raccogliere confessare volere senso. Affare caldo ridere sapere fornire attendere.\nTavola italiano scienza sicuro. Compagno libertà sangue differenza vendere industriale lira. Avvocato minimo carta. Parecchio palazzo stanza giornata numeroso.\nNascondere pagina oltre escludere scappare alto noi qui. Credere scorrere errore poesia tutto. Parlare zitto musica prendere assai.\nColpire scoppiare quasi stagione entrare giocare distinguere. Tale spingere resistere coscienza ah elevare zona.\nMagari figura cosa soldato. Riportare diverso medio provare.\nQualità casa durare madre stella rivelare. Letto stampa parete allora massa comunque.\nMalattia raccogliere morte distruggere.\nOdore sognare come porta ombra. Rosso americano sopra forza largo. Dirigere lasciare neppure accendere nascere.', 1, 0),
(100, 'Mettere valere', NULL, '1982-10-14', 'Spagnolo', 'Articolo figura tra piacere volontà poco. Rivelare se interessante zitto vento. Giù veramente programma divenire avanti riferire.\nVerso legare brutto importante francese chiamare. Società pietà trasformare.\nDire levare voltare voi numero sacro. Vincere stato romano ciò fino. Invitare uccidere lasciare insistere terreno specie corpo.\nMisura buttare ricchezza su stato difficoltà buio. Merito sinistro segnare amico tra peso poiché nazione.\nSicurezza sinistro pubblico vestito mercato. Maestro essa corpo amore.\nElevare prossimo frutto bestia. Bosco intenzione sud termine giornata. Capace naturalmente fame vino capire resto cortile pubblico.\nNostro volere paese sentire. Mezzo attento contadino necessità bastare.\nFigurare figlia faccia rappresentare. Riferire triste grado tedesco basso europeo. Storico tendere finché risposta in sorgere apparire ringraziare.\nCrisi muovere morale passato triste. Divenire riportare sviluppo. Vista lungo quale fuggire tavolo.', 0, 0),
(101, 'Cucina', 'Ritenere no dinanzi popolazione città appena. Formare ricordo da aggiungere sonno. Grave ferire grado scegliere minore accanto.\nStraordinario onore capello. Palazzo muro grazie colpo giro.\nCasa diretto classe chiamare spesso normale buio mancare.\nStaccare scherzare comunque cantare differenza staccare figlio chissà. Osservare frase sentire stamattina stanco ritrovare quale. Rispetto o neanche udire grazie.', '1992-10-14', 'Francese', NULL, 0, 0),
(102, 'Importante provocare', NULL, '1977-10-14', 'Inglese', 'Chiudere che restare porta sedere confessare parete riguardare. Sicurezza contrario dopo. Annunciare rapido necessità significare liberare circa.\nPaura ringraziare esprimere divertire baciare sottile bello. Erba cui accettare pelle mondo labbro passare qua.\nAllontanare accendere campo inutile guardare figura. Accettare rapido repubblica. Interesse brutto commissione improvviso certo tecnico estremo.\nCompagnia temere destro qualità. Direzione passione fornire cuore.\nComodo passo momento correre comodo. Collo materia molto contrario bosco colore produrre.\nPena inizio autorità. Oggi tratto destino natura uguale caratteristico felice. Piccolo qualunque indietro lavoro don zona.\nMolto cane gioco particolare relazione si sforzo. Baciare musica capire imparare continuare. Buio abito svolgere maggio. Automobile resto grave.\nCondurre parlare maestro succedere temere. Industria eccetera riempire.\nSapere mio lettera direttore montagna. Determinare notizia conto mi fianco.', 1, 0),
(103, 'Vuoto magari ricchezza coprire sottile davanti', NULL, '2002-10-14', 'Italiano', 'Aiutare giugno bello fondare giudizio faccia. Desiderare spesso metà stasera. Fuoco vi presentare chilometro scoppiare ricordo circa.\nEvitare interessare chiedere chiamare costruire domandare fornire. Camminare letto certo speranza procedere unico perfetto.\nDio volontà privato niente crisi intenzione loro. Isola unire cittadino piuttosto circa fronte ascoltare.\nAbitare azzurro denaro estendere ciascuno trasformare. Funzione capello toccare qualche vino donna. Raccontare destino qualità maggio bere ridurre eppure errore.\nDistruggere situazione passare insistere. Piccolo chiave porre mare. Commercio medico oh occasione.\nOsservare giudizio camminare offrire ecco esame. Mano verso stabilire giungere.\nTagliare spirito durante pensiero accanto. Comprare triste persona istante assistere niente espressione.\nQuasi posizione prendere avvenire recente permettere vendere consentire. Temere servire condizione abitare confessare pure.', 1, 0),
(104, 'Genere colore intenzione volare', NULL, '2007-10-14', 'Inglese', 'Testa essere pregare sbagliare oramai dito. Oro vista assai macchina.\nTipo piangere origine lato morale presto. Distanza attendere tendere vicino significare lavoro crescere.\nGiù ordine contro riportare latino raggiungere raccontare tuo. Disposizione signorina animale parola campo.\nDenaro articolo io montagna resto. Neppure parete qua libero fuoco lo proposta stato. Scrittore comodo volto nave scherzare.\nButtare tipo origine lettera annunciare. Provare ultimo stampa avvocato differenza nazione consiglio prima. Bianco romano sguardo domani esempio articolo ricordo.\nStazione resto colpire ottenere studio segreto energia. Partito studio qualcuno bruciare.\nTardi enorme piccolo bravo qualcuno. Uso creare rimettere facile.\nSottile pure piazza desiderio. Terreno nobile breve felice massa distruggere attendere grosso.\nNotte isola cielo felice.\nCostruire mercato ora guardia. Stesso fumare strumento voltare.\nPosizione impedire attraversare. Coraggio pane preoccupare automobile peggio cui.', 1, 0),
(105, 'Fuoco ascoltare luogo', 'Osservare si ritornare sera casa medico. Pace domani attesa pesare. Prato profondo tipo foglia buio arrivare.\nFronte conoscere già messa trasformare malattia. Guardare poiché badare bene corso consiglio distruggere. Valere senza pena procedere. Chiudere perché incontrare movimento alcuno giudizio trasformare.\nBruciare potere pietà facile sbagliare fede aumentare. Consiglio futuro capo meno.\nAcqua grosso piazza segno. Riferire temere cuore.', '2005-10-14', 'Inglese', NULL, 0, 0),
(106, 'Zio mattina fuori', 'Notizia elettrico spazio aumentare qualcosa. Senza fermo fondare voi anche automobile completamente. Comporre uguale chilometro messa.\nBisogno qualcosa conseguenza tavola caffè togliere. Prato questo concedere crisi convincere sereno.\nPossibile basso sorriso mantenere crisi. Consiglio paese terzo segretario saltare.\nStato durare accadere in loro nobile superiore qualcuno. Produzione suo umano. Piantare ministro viso piede camminare qualche piede.', '2025-10-14', 'Tedesco', NULL, 0, 0),
(107, 'Destro finché', 'Uscire speranza studiare brutto migliore ottenere no bello. Annunciare qui coraggio bisognare basso. Pronto vi corpo cortile adesso dovere minimo cultura.\nAttento fianco forse milione allora. Promettere iniziare qualità giallo tacere diritto testa. Dinanzi domani ministro comunque scherzare. Estremo attività apparire questo studiare mano corrente.\nScrivere perché assistere solo sorridere noi attorno. Sorprendere rimettere giallo trarre.', '1978-10-14', 'Spagnolo', 'Segreto fermare stella dedicare morte bambina.\nLungo comune fuoco buttare nazione viaggio. Chiave articolo escludere accordo aumentare e ufficiale.\nPreparare rispetto duro neanche marito. Suonare giugno chiave fede. Giustizia fede principe gesto. Azione pregare dinanzi buttare escludere continuare.\nAttesa importante ecco titolo. Ogni abitare ripetere europeo. Finché aspettare serie rompere.\nMinistro parere recare prevedere ministro. Assumere palazzo militare certo battere.\nRisultare pianura memoria espressione settimana cura. Forse tornare tu ampio inutile. O giallo ciascuno desiderare.\nSerie correre medico bisogno personaggio svolgere levare. Questione personale mettere possibile problema malattia papà. Cittadino porre amore saltare felice.\nArte venire giusto monte. Cristiano attività dolore piantare domani. Preoccupare albero libro caso. Soltanto rispetto chiamare elettrico inutile teatro italiano.', 0, 0),
(108, 'Terzo comprare scopo durare errore', 'Diffondere tavolo dietro. Politico riguardare leggere sicurezza intorno fuggire. Principe teatro ecco muro riva ridurre se.\nRiempire luce muro eppure. Verità perciò gente zitto abbandonare corrente.\nSopra fede superiore succedere. Resto colpire caldo straniero.\nSegreto estero ora medico tono. Qualcosa maestro straniero vento coscienza invece. Salutare spegnere presso già.\nMercato finire tempo foglia origine maggio. Origine aria valore soluzione filo confronto.', '1992-10-14', 'Francese', 'Specie luna riuscire seguito atto ogni. Attesa tono senso legare mentre piangere. Male oh notevole croce.\nMerito attimo ospedale apparire recare. Evitare grazie bestia segno valle.\nRiferire quanto apparire voltare. Insomma accompagnare necessità luna qualunque porre. Insomma assai accorgersi terzo suonare aggiungere futuro. Regione ministro perfino accogliere arrestare americano.\nPrimo celebrare esporre colpo. Accendere tranquillo domandare improvviso. Fame alto pesare parlare accettare.\nCentrale sapere notte patria lo paese. Stampa finalmente capello sedere.\nCorso pieno gamba indietro prendere posizione cui. Valere romano bocca opporre.\nCamera fabbrica ricco contenere comprare segno. Dottore idea cristiano donna pezzo speciale teatro. Descrivere fermare conseguenza sud grazia.\nBuono gioia aspetto accettare neppure. Ricordo infine senso scoppiare distanza gente aggiungere circa.', 1, 0),
(109, 'Mantenere convincere', 'Vostro pagare italiano fame abbastanza. Greco posizione resto. Chiudere aiuto grande servire. Completamente nobile nave indicare sembrare bere peccato.\nDito fede nudo opera resto. Merito voltare accordo arrestare. Superare conto fiore conseguenza fra costringere ritenere.\nUniversità latino assoluto portare se solo popolo. Capitare elevare proposito insistere senza privato però. Notevole stesso resistere croce medico rivelare. Momento conoscenza buono fortuna.\nFiducia ultimo occorrere.', '2017-10-14', 'Italiano', 'Finestra provincia usare bellezza porta. Medesimo film sicurezza azzurro neanche attesa baciare. Tuttavia portare vincere comodo visita amare.\nUguale notare volgere odore. Regno libro accanto comprare. Esame spegnere occhio dividere. Proprio qualcosa amico braccio bambina vivere importanza qualcuno.\nPiccolo tornare potere si qua dedicare. Vestito largo capitare contenere ordine storico davvero. Eccellenza carattere forza straniero automobile potenza.\nRipetere riportare collina certamente vino tratto li.\nChiaro dimenticare linea togliere tirare generale uscire finire. Relazione togliere quarto filo giornale superare dente. Anzi quanto commercio poesia.\nPranzo personale stanco poiché fiore per qualcosa. Subito felice mondo assicurare suo festa. Francese superare comporre ritornare linea civiltà.\nDiffondere famiglia sopra presente. Porre bere oh essere realtà.\nPiacere onore fortuna mantenere riprendere accadere padre concludere. Realtà ciò rifiutare oh divenire aspetto rompere.', 0, 0),
(110, 'Con rimanere ultimo monte', 'Di anno natura indicare cantare. Città dubbio donna odore durare mondo. Avvocato in ricordare certamente partito dente presso stare.\nCentrale insomma continuare contenere zona proposta pietà. Succedere stanco levare apparire. Metà grave allora morte natura.\nVendere abitare uguale eh. Autore disporre finestra elettrico mezzo. Prendere film trattare indietro qualità.\nGiardino voltare elemento estremo confessare stagione entrare. Anzi momento preoccupare diretto abito.', '1988-10-14', 'Tedesco', 'Largo cattolico dottore stanco spazio chiave chiedere roba. Quello luce gente prodotto. Adesso voi montagna svegliare necessità notizia risultare. Quindi minuto soltanto regione piede.\nArma caso fatto. Gente disporre questione davvero mantenere corsa stanza ancora. Continuo dividere preparare sentire. Scoppiare magari festa.\nFrase destino scherzare addirittura sguardo. Aiutare zio corso processo dimostrare condizione marito. Osservare soffrire partecipare figlia fianco.\nSacro porre sereno dove. Ragione su vino levare giustizia aiuto economico. Questione imparare linea destro.\nItaliano annunciare bastare carta aspetto vita pianta. Sorgere attuale comodo.\nImportante però staccare gioco stagione. Male qualità italiano.\nCelebrare pazzo magari via attendere via. Spiegare minimo libero notare esperienza latino istituto.', 0, 0),
(111, 'Donna studiare società', 'Maestro attento confronto leggero stabilire stamattina pane. Casa giro paura gioia mare. Ecco cioè brutto caro qua.\nPresente sperare russo trattare libertà. Parlare cielo rispetto. Buttare possibile scienza gioia stringere passare.\nComunque casa riprendere aiutare vi lato. Dire ricco vicino parecchio lo giù famiglia. Prendere fermare apparire inizio bambino terreno.\nFresco romano dito essa.\nPersona ritrovare qualunque essa esistere. Presenza diverso verità pure.', '2020-10-14', 'Inglese', 'No preferire vestito distanza. Compagno elemento dire cui rapporto. Dunque sposare divenire qualunque necessario desiderio. Sereno voglia affermare donna indicare coraggio specie.\nBattaglia bocca natura vendere vento. Ritenere pietà letto. Arrivare breve mancare ritenere mandare stasera.\nDividere pianura partito. Su avere figlio nome giustizia.\nFermare assai peccato dottore coscienza. Lì naturalmente anno udire. Film trattare ridere autorità conservare eccetera nascondere.\nPrevedere scuola spesa intendere ieri società. Inoltre ammazzare vedere maniera.\nQuello pianta strano. Mio punto vario vita superiore.\nMorire oppure comporre addosso condizione aggiungere amico. Seguito trattare milione attesa. Dire camera sera giallo persona valore.\nMezzo prato davvero generale lui mattino mese. Grave accadere caro onore porre servizio profondo giallo. Tenere né magari stupido entro specie toccare.', 1, 0),
(112, 'Villa cercare ritornare situazione', 'Tranquillo esprimere mestiere terzo.\nSoltanto pesare no medesimo dito.\nTutto pregare imporre avere dove discutere. Nord divertire stella cioè frutto palazzo saltare.\nRaggiungere sostenere tentare colpire. Rifiutare levare industriale teatro.\nEpoca necessario poeta atteggiamento. Marito condizione dichiarare non mi.\nPomeriggio pieno problema riuscire nudo quindi determinare.\nBambino esperienza risultare istante sembrare proposito. Modo freddo arte volto notte.', '1990-10-14', 'Italiano', NULL, 1, 0),
(113, 'Partito repubblica', NULL, '2016-10-14', 'Inglese', 'Contento via destino bianco rivoluzione sì anno istante. Roba stamattina stringere luogo commercio animo. Labbro avvertire rivoluzione piccolo pietra aggiungere. Studiare andare comunque governo né scoppiare segno capo.\nScorrere annunciare perciò questo breve commercio. Durare giallo francese cavallo reale significare atteggiamento. Vendere strano effetto estate linea.\nAbito cosa spalla giocare organizzare prodotto abito insistere. Molto togliere cucina stesso.\nVolto soltanto comunque fretta baciare risolvere. Comune povero nudo anche. Giungere regione correre qualcosa là triste dipendere rispondere.\nAlto adesso significare mio per atto spirito. Dottore comporre mamma quarto innamorare bambino. Ammettere marito giovanotto pezzo.\nToccare scala finire. Oggetto interesse sostenere solo salvare. Relazione bene figurare poeta.\nCittà vasto zia provvedere notizia ufficiale. Guardare padrone fianco lungo scorrere comunicazione dirigere. Condurre provvedere esso necessità.', 0, 0),
(114, 'Favore destro', 'Scegliere nord forma a dottore baciare straniero. Rivedere qua corso giovane.\nInsieme limitare trasformare tempo certamente donna successo. Abitare biondo trarre fra. Evitare comporre forse trasformare odore cortile denaro.\nModo aspettare terreno verde papà esperienza battere. Nazionale costruire paura presentare straordinario situazione.\nTanto speciale accordo classe foglia fondare elettrico. Gioco mattino reale bosco contatto. Esempio eccetera genere forse.', '1977-10-14', 'Spagnolo', 'Vita se bosco pomeriggio normale costringere. Titolo notte mese valore quello. Niente scegliere bestia caratteristico padrone salutare libero.\nPerciò certo causa comunicazione legge tirare. Abitare studio pericoloso lanciare.\nMinistro eppure generale ridere opera fratello diffondere colore. Aggiungere ah folla morale parere trascinare.\nRelazione resistere nudo aspetto. Signorina rompere subito sistema. Togliere vento aumentare colore offrire su. Sentimento chiudere ridere giardino.\nAttento donna morale voltare mio abito levare. Amare genere fondare sino. Messa appena facile ferire impossibile latino conoscere.\nUso morte giornale qualsiasi milione tuttavia. Foglia corso ragazza grazia metà li. Comprendere spegnere fiume affare storico.\nDistruggere riconoscere favore aprire qui importanza pazzo. Io soltanto pericoloso repubblica secolo guidare. Coloro naturalmente discutere nobile risposta.', 1, 0),
(115, 'Uguale almeno chiesa intenzione croce comprare', 'Perfino conoscere colore sbagliare avanti signorina nord. Zio importante contadino. A affatto continuo mezzo proprio.\nRoba fuoco alzare stasera mamma. Dove rappresentare provincia soltanto. Né tavola chiedere.\nPresidente foglia intanto dinanzi inizio italiano scorrere. Fino certamente treno estate vivere appena. Tanto tipo ricordare ridurre imporre uguale.\nMinistro stagione piantare uccidere faccia metà distinguere.', '2005-10-14', 'Italiano', NULL, 1, 0),
(116, 'Fiume', 'Parlare gente forma finché ringraziare. Mese desiderare dormire uomo mattino.\nAbbandonare peccato dormire passato cortile. Io ammettere scoppiare dormire naturalmente.\nPensiero vecchio industriale salutare legare bosco cura provare. Proporre freddo compiere.\nNero forma romano lui vasto. Pagina europeo riempire sereno attaccare gatto iniziare principale. Continuare caro pericolo bellezza.\nPorta buio né sopra ritornare dormire. Concedere tutto aumentare capello.', '2024-10-14', 'Inglese', NULL, 1, 0),
(117, 'Sorella costituire istituto occorrere pianta', 'Abbandonare passare né giugno. Scoprire interesse solo luogo cambiare.\nSvegliare molto sorella peggio giovane di. Scrittore battere stanco chiedere cane puro bisognare.\nAppunto greco strumento epoca soluzione. Quarto spazio fresco servire rivedere non.\nFianco servizio riuscire amore egli. Rispetto battere comodo quadro qualità coprire appena.\nCultura accogliere comunque limite. Qualche nobile celebrare forte scena tirare mercato.', '1979-10-14', 'Italiano', 'Origine uscire contadino occorrere. Croce amore prossimo gusto dentro.\nDestino sera valle esso godere fede. Scuola posto serie buio. Uso divertire essa resistere vita ufficio.\nRivelare divertire collina neppure. Decisione rimanere dio comprare mantenere ricordare tenere cadere. Accompagnare mano scomparire altro parte decisione lanciare.\nConsiderare proposta importante superiore. Termine spegnere ospedale perfino civiltà politico peccato.\nFolla decisione direzione sognare pane tardi. Pesare oggi offendere università pietra avanti tecnico difficile. Ottenere anche minore.\nSuperare repubblica erba nostro. Commissione ah simile buttare attorno minore. Divertire sorriso verde cadere.\nErrore trarre braccio elevare luce. Appunto simile condurre.\nMadre nord conservare sposare crescere lui produrre trascinare. Nessuno memoria fronte azzurro concludere metro.\nAiuto voce importare ritrovare incontrare opporre. Difendere presentare confessare. Milione pianta sorridere accordo ricco che cioè.', 1, 0),
(118, 'Destino rapporto uccidere croce attore vendere straniero', 'Pubblico colpo sottile produrre fenomeno contrario. Comunicazione classe gioco terzo eccellenza diretto. Azzurro accompagnare qualche utile estate privato.\nProbabilmente risultato aumentare commissione cura noto. Fantasia carne base sistema presto. Essa addosso facile.\nSignora ah scienza confessare oppure oltre qualcosa carta. Speranza umano convincere sacro distinguere.\nSì incontrare trascinare. Estero peggio vuoto pace.', '1989-10-14', 'Francese', 'Spingere elevare voltare arrivare incontrare. Peggio trattare generale ricevere gettare creare. Ringraziare costituire ambiente strada termine distruggere avvenire. Musica destino lui trarre greco bagno scoprire.\nEnergia persona segnare dinanzi. Domandare sorgere disposizione avanti soffrire carattere anno. Oh ragazzo diventare bruciare.\nMinistro servire misura bisognare stare acqua insieme. Offendere avvocato cucina essere. Riprendere stesso libero funzione possibile lavoro quello ridurre. Dove indietro ricevere condurre bambino.\nLimite lettera peso accettare di. Girare zitto muro. Pregare cane americano riportare mare entrare.\nProdotto pomeriggio di da possedere umano. Attimo stanza oggi allora sentire parecchio. Concludere loro profondo costituire capitare scendere soldato.\nGiro arma collo libro elevare ritornare. Camminare spirito neanche aiutare perfetto vivere.\nCamera mamma scherzare gioco ma volgere pezzo. Camera giungere dito giugno diverso qualche distinguere eppure.', 0, 0),
(119, 'Riportare giovane scoppiare risolvere trasformare vuoto accompagnare', NULL, '2005-10-14', 'Tedesco', 'Chiaro temere gruppo aumentare mattino autorità. Attaccare croce nulla mare.\nDentro figlio metro uomo. Romano programma dimostrare cantare arma stamattina.\nLà amore sposare ricchezza ci campagna. Dipendere vestire correre dunque dirigere rappresentare.\nTendere mettere nascere il elettrico vuoto. Effetto matrimonio accanto ritenere svolgere diventare. Vario badare rivoluzione dovere dimenticare medesimo.\nMa vino ognuno vestire preferire. Finché operaio scegliere tacere italiano mangiare. Carta sembrare opera collina tardi dire attenzione.\nAnche storico dente popolazione colpo sociale. Parete parecchio ma porta.\nSegnare comprendere rivedere misura. Movimento storia presentare breve dare. Recare inizio semplice attraversare metro civile cristiano divertire.\nNiente fumare linea attesa valere tavolo. Ufficio oltre espressione grave sotto. Figlia bisognare repubblica americano braccio duro medesimo.', 1, 0),
(120, 'Pietà uso coprire', 'Giudizio alcuno chiave comporre seguito.\nCompagnia ammazzare studio alto ordine. Ricevere dichiarare fiore fede giugno. Spettacolo opera peggio questione orecchio ridere.\nViaggio riguardare chiesa. Sì mente autore oggi.\nPalazzo metro inverno eh e. Rivelare sottile trasformare simile mattino.\nFinché buono metro chiudere. Molto americano atteggiamento acqua. Guardare e muovere brutto neanche muro.', '1986-10-14', 'Spagnolo', 'Chiave preferire lotta dopo considerare poesia scherzare. Lungo estate caratteristico vostro. Tanto tagliare arrivare preferire tardi pagare.\nGridare trarre estremo monte distanza commercio. Commercio massimo prova faccia. Dichiarare coprire zia ordinare signora ridere.\nSpettacolo salvare spirito sperare essa appartenere. O età palazzo interesse governo sembrare proposito. Distruggere nord subito evitare.\nUomo triste attenzione neanche divenire. Naturale risposta settimana natura scrittore ufficiale. Colpo seguito zia imparare principale spiegare giudizio sì.\nAnima atto mese comunicazione completamente. Dopo comune compiere raccontare.\nNome sottile vuoto dare freddo finalmente parlare buio.\nAlto modo destro scherzare. Luce certo comprendere conservare rapporto stato brutto. Domanda giro mestiere storico automobile quello indietro imparare.\nGenere comporre rivolgere ogni ciò. Armare capello signora inoltre messa mese.', 1, 0),
(121, 'Colpo pazzo dottore appoggiare', 'Però attorno perdere per risposta. Godere celebrare romano legge labbro staccare.\nComodo nome medesimo forma. Esistere bambino trasformare assoluto peccato attore nazionale. Gettare perciò mi città.\nAssistere alcuno vento. Circa poesia monte superiore volere economico. Commercio allontanare promettere nord finalmente buono finalmente tedesco.\nAppena perfetto sangue vestire gioia. Difendere uguale mente armare trarre consentire colpa lo. Salutare tratto primo pianta.', '1977-10-14', 'Spagnolo', NULL, 1, 0),
(122, 'Dove poco folla rompere', 'Giorno inglese ordinare origine. Scegliere soluzione ministro durare appena incontrare trattare. Invece dinanzi attraversare ognuno.\nNatura necessità repubblica dubbio dare determinare centrale. Davvero stato assistere.\nAmpio lavoro pranzo indietro attaccare rapido. Presidente campagna personale amore godere buono salutare lasciare. Duro convincere vecchio atteggiamento bravo cantare fantasia intendere.\nVostro già lato sviluppo. Pesare tanto angolo.', '2003-10-14', 'Spagnolo', NULL, 0, 0),
(123, 'Patria pericolo bisogno', NULL, '1979-10-14', 'Spagnolo', 'Lingua fatica assoluto spettacolo proprio. Trattare notte macchina.\nLabbro sorprendere battere interessare denaro soltanto. Arte ordine storico nord compagno come ritrovare buttare.\nEpoca sorriso croce metro tu presto niente.\nPersona si personale. Essere intorno ricco rendere. Naturale giovane accettare carattere sforzo lato padre niente.\nScena medio giornata importante stabilire. Strada sala intendere antico. Aspetto cuore silenzio contenere prova ripetere.\nNon leggero fuggire. Grado dubbio vi grazie sorella avvertire vasto. Cambiare sforzo invece sbagliare.\nVilla naturalmente uguale rappresentare tedesco dimenticare sotto uscire.\nDifficile li ferro ferire scoprire ferro riguardare. Estremo superare ascoltare unico.\nAttenzione personale badare coloro fondo spesa potere. Essere sembrare rivolgere dubbio rivoluzione esporre.', 1, 0),
(124, 'Comporre ritorno tentare', 'Divertire onore mantenere realtà. Coscienza famoso avanti ferro disporre. Sperare mondo alzare secolo mondo civiltà prendere.\nAddirittura prossimo popolo preferire legare. Per fornire considerare inutile affatto calcio.\nGuidare qualche umano greco ragazzo naturale. Qualcuno questo testa signora ricordo difficile.\nSpecie pieno aprire stanco. Verità difficile don trarre lato silenzio nome.', '1999-10-14', 'Tedesco', 'Passione fronte condizione cantare parere parola. Distruggere noi colpa diritto permettere vino.\nPresentare immaginare vario stare appoggiare. Piazza domanda assoluto effetto rivelare.\nTeatro seguito lì. Piede completamente via interessare descrivere.\nVia perfetto specie divenire. Quindi spazio valere elemento oro insistere.\nCadere fuggire attuale certo carta voi segretario. Elettrico indietro latte bagno porto rapporto vario. Scala scena arrestare presente prossimo offendere silenzio. Proporre pena corrente sposare buono segno stampa oggi.\nMare lungo coraggio metà rimettere albero evitare momento. Industria pagare finire.\nBellezza studiare rivoluzione filo piuttosto fede. Mio processo invece nuovo. Quadro riprendere teatro compiere generale ragazzo passato.\nQuestione trasformare scherzare gettare numero intorno scrittore. Comprendere minimo ammettere questione. Coprire ascoltare effetto orecchio sperare.', 1, 0),
(125, 'Popolazione vero comune apparire', 'Braccio girare ritornare buio da disposizione volere occorrere. Piacere lasciare appoggiare salvare importare. Altro mente ne gettare.\nStraniero sicuro insomma superiore. Sposare ancora mattino studiare ultimo maniera segreto.\nMostrare maggio ora uccidere bastare arrivare. Determinare frase presente espressione generale. Successo oppure estero.\nAnno metro bagno principale. Muovere caro quindi situazione studio.\nStato tardi presso. Volere povero parecchio vincere.', '1979-10-14', 'Francese', 'Bellezza spesso vestito conoscere fiume ottenere ridurre. Guardare colpa importanza vino basso contenere esercito mese. Chiaro cortile ecco intorno mano.\nRicco zio lettera adesso eppure. Come compagnia ricchezza viaggio rimanere qualunque.\nGrande permettere celebrare caso comprare croce gatto. Dolore lato scrivere senza punto.\nVivere bosco angolo. Luce finché vuoto. Attuale insistere accanto nave sereno.\nNoi animale pesare automobile discorso oggetto. Grosso verde domandare estendere braccio. Possibile società mano concetto bisognare speranza.\nModo ragione causa spalla usare guidare ognuno. Camera uomo qualunque ferro aumentare giudicare coraggio.\nTratto condizione senso. Istituto sicurezza insomma. Tirare piuttosto vuoto subito offendere suonare appartenere.\nCristiano completamente congresso grigio unico appena oh.\nPranzo antico pensare periodo contro. Tranquillo ricordare diverso angolo aiuto fratello istituto.', 0, 0);
INSERT INTO `bookinfo` (`BookInfoID`, `Title`, `Description`, `PublicationYear`, `Language`, `Summary`, `IsAvailable`, `IsDeleted`) VALUES
(126, 'Simile pure attenzione gusto', 'Cui donna presso chi trascinare tra monte. Piccolo essa ferro. Piangere termine caffè nessuno autorità inverno. Giugno internazionale sacrificio stasera bambina vita cui.\nLibro fermare dente gesto trascinare sorridere. Venire effetto caro buttare. Ammazzare spettacolo collina eppure atteggiamento unico tanto.\nMedico mente un fiducia niente. Strano giorno eppure cattolico paese perdere. In oltre figura quasi limite caldo frase.', '2019-10-14', 'Inglese', 'Piede evitare tacere compiere caldo vendere rivedere. Comporre avvocato nulla rosso spesso.\nMuovere descrivere conto domenica. Comporre tale vero essere passione. Tipo dichiarare importante ognuno programma andare divenire.\nTratto rivedere società buttare suo zitto. Guardia perdere civiltà conseguenza stanco peggio stato silenzio. Attraversare giocare sistema unico veramente studio desiderare.\nPregare ricerca professore occorrere. Cura attendere nazione ritornare zona.\nProporre sentire vedere stupido assumere montagna. Festa e fatica passato pazzo sorriso difesa.\nTerzo giocare fame prendere tra cantare tecnico economico. Correre fede pronto gatto rispetto. Moderno pelle e inverno.\nOffrire argomento male. Massimo cane trovare cadere. Solo croce correre suonare già articolo.\nColpire età spalla gettare nascondere. Bravo caffè volto popolo aiutare ottenere programma strano. Neppure dormire scoppiare noto recente giudicare significare.', 1, 0),
(127, 'Limite disporre visita', 'Confronto qua specie vedere. Confronto libro elettrico importanza gioco greco. Questo prossimo cucina.\nDeterminare medico presidente meritare. Armare fuggire ragazzo dito neppure personaggio.\nAndare sapere esso lasciare mezzo scegliere consentire. Attento linea intendere carta sognare punto. Appoggiare porre reale.\nOppure superiore base coscienza.\nUsare principio estremo porre. Spiegare quarto ripetere figlio animo avvenire gamba. Questione muro sorprendere fretta scuola domani attesa.', '2025-10-14', 'Inglese', 'Attività mandare qualsiasi frase.\nValere pietà avvenire scrittore festa.\nCrisi tempo sbagliare scrivere faccia comporre metro peso. Orecchio fine celebrare massimo speranza accendere secolo.\nSistema senza domandare principe università religioso dividere desiderio. Celebrare voce umano lago venire né enorme. Elettrico zia avvicinare voglia entro diventare.\nManiera fumare escludere qualcuno volare. Spiegare spesso prova.\nProvocare apparire morire ridere. Raggiungere ampio centro misura perdere leggere.\nCompagno attesa fabbrica comprare poesia tanto sentimento. Resto voce distruggere possibile. Privato desiderio distinguere camminare tuo dunque. Spazio preparare levare tedesco.\nChiamare favore signora filo comprare magari antico. Cosa tratto ricordare senso ospedale pazzo opera andare.\nStare questo gamba. Svolgere cittadino riportare maggio articolo. Stagione tanto quindi divertire risultare forte pericolo.', 0, 0),
(128, 'Giugno ambiente', 'Attesa tendere folla duro chissà sogno serie. Giusto quadro valore costruzione. Pranzo onore avanzare cattivo eccetera pezzo.\nProva bastare giovane corrente. Posto normale concedere. Camera provare nazione levare tendere massa. Confessare accettare differenza mattina persona.\nArticolo specie stupido restare pane discorso base valore. O luna difendere unire bravo. Questione posizione biondo strano no vivo bestia.', '1993-10-14', 'Tedesco', 'Apparire e spazio avvenire atto. Finire pane piccolo.\nMangiare maggiore insistere sguardo. Non tale carta affermare soltanto oltre cui avanzare.\nCortile portare sicuro nostro con. Lasciare segreto partito suonare tutto. Concedere appoggiare maggiore simile.\nConservare idea attento estero rivedere. Tempo maestro affatto perciò. Silenzio amico parola muro riempire guardare poco.\nTendere concetto storico segreto visita. Mangiare caso questo inutile comprendere.\nPer assistere passato provincia necessità tu. Giornale e prezzo centrale.\nTavolo normale carattere tenere consiglio. Labbro estendere peccato. Creare contare lì sperare invitare calcio questione. Rivolgere mattina elemento non contro accadere occasione.\nVisita scrittore certamente regno. Verità tuttavia recare dipendere gridare libero.\nVeramente italiano ambiente almeno accettare mercato. Bisogno importante uno.\nProvocare sorridere fermo proposito. Colpa entro signora bianco piangere città. Estero giovane breve zio aggiungere.', 1, 0),
(129, 'Tranquillo', 'Esprimere avanti insomma gesto migliore caratteristico colore. Bello comporre compagno suonare mano corpo ognuno. Riguardare volare filo liberare distanza comunicazione sostenere. Minore addosso camera perché vi pronto.\nMadre stringere disposizione buttare animale. Campo avere già bambino cioè nuovo guidare. Titolo sorgere studiare soffrire stabilire.\nRecare elemento leggero scorrere favore.', '2001-10-14', 'Spagnolo', 'Lui italiano ritorno finalmente effetto buio. Minuto fianco storico uso sogno rosso fatica. Fra famiglia resto polizia.\nPer intenzione porre zio storia dente. Forte attesa quale opera realtà pianura dovere.\nCreare riguardare limitare. Cuore espressione basso come ciò.\nSalire scoppiare anno pericolo ecco. Speranza sopra anima ferire finire.\nNiente testa albero cucina notizia foglia. Grazie memoria ci attesa dirigere eppure.\nOh viso maniera privato superiore sbagliare periodo dito. Ripetere ci su freddo stella movimento. Lanciare sino sede scomparire.\nCasa stanco tornare prossimo dio aspettare. Camminare fiore attorno valere suo interessare fermare.\nEsprimere riprendere volere maestro che minuto musica. Don produzione oro meglio stato segreto. Duro restare ma aspetto levare trasformare.\nGiudizio presenza momento arte. Festa tirare intanto meno organizzare addosso. Costruzione ottenere potere.', 1, 0),
(130, 'Soluzione cielo medio memoria bastare', 'Lo nave onore male denaro uccidere. Dimostrare sorprendere attaccare letto determinare. Intanto tacere ricchezza specie battere vento sotto.\nModerno svegliare romano cavallo porta resto. Milione vuoto stupido tuo brutto.\nSuo gridare maestro arma. Smettere scegliere professore certamente acqua udire.\nProvincia entro perdere morte massa assumere prossimo. Iniziare cosa esempio insegnare.\nGrande tuo sforzo addirittura pagina rispetto. Frutto lavorare concedere sorriso fuoco chilometro massa.', '1980-10-14', 'Italiano', NULL, 1, 0),
(131, 'Osservare fornire', NULL, '2005-10-14', 'Inglese', 'Colore assistere montagna fronte attesa sembrare. Un esame punta punto breve.\nVivere insegnare latte latino pietra parete riunire coraggio. Compagnia limite figurare volto avanzare grazie. Desiderio fermare impedire compagno compiere.\nDire sistema prezzo pericoloso congresso accorgersi infatti.\nParere tavolo pubblico terzo giungere persona estate. Personale specie presidente meglio necessità trattare. Ringraziare lanciare portare luogo cantare.\nPersona zio destro visita storico un determinare.\nNave quadro grosso allora americano vino scrivere. Porto sorgere quadro isola. Trascinare serio anima no.\nCaro abbastanza mostrare. Naturalmente sentimento parola soffrire gesto superare.\nDomani accogliere sentimento. Offrire dimostrare procedere direzione terreno strano. Dietro felice vuoto prezzo metà insomma gioco oh.\nComodo regno passato lato triste vero pregare.\nMassa capello scopo. Nascondere qualità attimo salvare verità pure reale prato.', 1, 0),
(132, 'Isola tra altro guardare sorprendere intero spiegare', 'Dottore terreno necessità prato tavola. Mamma palazzo signore estero valere.\nPieno studio felice dubbio ricerca. Chiamare specie vario volare necessità commercio. Andare casa tardi gamba. Stanza naturale cominciare aumentare segnare.\nNatura pubblicare tirare piuttosto. Dopo non mattino lotta capire. Consentire generale maggiore condizione poeta.\nChiudere industriale fratello finalmente aumentare evitare. Discutere poiché più perfino. Aria arma fame.', '1984-10-14', 'Spagnolo', 'Girare lui porto studio cavallo.\nPosare americano europeo pace vestire moderno don. Comunque avanzare coprire giorno. Tratto forse primo segretario bene.\nMamma fresco cristiano cattolico niente fra testa preparare. Fantasia zitto trovare distanza. Intero spegnere comunque avvicinare signore oggetto circa. Vita generale disposizione importante forse estendere.\nMantenere messa badare opinione persona quello. Difendere però decisione braccio lira fatica esperienza.\nPeggio legare tornare stamattina battaglia. Verso assistere notte concetto caro occhio.\nFunzione procedere suo europeo. Voi francese non calcio. Presenza intenzione speranza semplice.\nAllontanare seguire contrario cercare gridare insieme possedere.\nCertamente presso davvero. Uccidere prossimo eccetera semplice nessuno tanto valle.\nIntero tirare minore lontano caffè studiare. Natura nobile ufficio diverso destro vincere portare.', 1, 0),
(133, 'Distanza bisognare vostro caratteristico forse', 'Estendere abbandonare stagione dedicare filo esprimere sino aumentare. Stanza sino sole cattolico stella opporre.\nBisognare opera solo unire. Pagare sud famoso produrre colpa.\nPerché finestra mare collina latte contrario. Uomo rientrare fiore imparare bene fenomeno. Ricordo piantare aspettare accendere temere.\nFesta braccio lasciare commissione. Cristiano parte proposito fabbrica fiore chissà avvertire.', '1981-10-14', 'Italiano', 'Atteggiamento cielo considerare ricchezza. Interesse comporre arte chilometro accompagnare indicare carattere riempire.\nGrigio attento maggiore contento tedesco voglia. Maestro mandare posizione opera salutare. Animale calcio istituto industriale dubbio vista lungo. Valore meglio probabilmente dare paura vista comunicazione.\nItaliano tecnico massa numero preferire completamente. Lira buio neppure rendere esso.\nGià visita disposizione donna svegliare principale. Caffè assoluto soprattutto pronto sognare diventare. Certamente svolgere finalmente tale intendere.\nFiducia anche metà spingere compagno maestro riferire.\nSu giù termine gridare smettere minimo personale. Ridurre capitare corsa mente o poco vario. Magari affare sorridere servizio occhio frase.\nMa esistere sotto dividere meno. Giro superiore musica italiano movimento. Piantare giallo industria cosa.\nEstendere nord fatto onore qualcosa. Fede fede eccellenza anima. Notizia fatica numeroso aria completamente vincere.', 1, 0),
(134, 'Stato', 'Un destro mangiare soprattutto. Rispondere realtà ma facile atteggiamento.\nFigurare prodotto salutare trasformare. Scappare morte attimo sembrare principale riconoscere. Avvocato sorprendere fabbrica certamente mancare gioia.\nChiedere dare giorno simile. Utile chi folla divertire.\nPerdere adesso elettrico comunicazione costa film forse. Dottore prima tirare liberare.\nRaccogliere italiano intero vino conoscenza riempire oh servire.', '1996-10-14', 'Inglese', 'Dopo affare dividere tenere presidente. Mondo cane importare segno. Volgere camminare perciò cattivo addirittura difficile.\nAssoluto fuori tranquillo quadro merito dente. Troppo mare dietro ricerca. Moglie qualunque arrestare scendere terzo.\nTardi sforzo capitare. Forse volere tavolo presto decidere già. Pranzo tuttavia bellezza essa cittadino tavolo.\nOccorrere dipendere frutto materia. Determinare sicuro modo nome ridere fiducia medesimo. Finalmente esame accorgersi meno piangere pagare massa.\nOperazione rosso bisognare lago. Adesso disposizione già primo costituire.\nQui forza bellezza. Rispondere perfetto completamente rapporto.\nRiconoscere aspetto fede attento. Moderno conservare mattina rispetto. Attaccare domenica discutere abbastanza sposare corsa.\nPrimo resto pubblico chiamare congresso storia.\nProblema impressione volare. Oggi maestro qua organizzare massa periodo giustizia.\nFamoso vento verso passione. Levare programma ricerca russo.', 1, 0),
(135, 'Causa molto presentare', NULL, '2008-10-14', 'Italiano', 'Fame uguale pieno scienza. Papà tanto studiare escludere stabilire.\nFacile imporre appartenere colpa. Sede sangue iniziare collo. Contatto sonno scherzare orecchio creare migliore nemico porta.\nCostringere dinanzi difficoltà opera strada. Punta sostenere stare don.\nApparire scorrere poiché prato volontà. Scegliere solo voltare chi preferire.\nQuadro caro autorità accadere parte. Tutto estremo latte cadere grosso quanto. Rimettere erba indietro regno peggio nemmeno zona.\nGrazia questo morire. Prato cambiare però rivedere. Cambiare sforzo pubblicare.\nSuo da tacere bello teatro. Voi giustizia chiaro normale freddo. Pezzo porre voltare affermare povero limitare.\nIndietro cucina superare parlare primo pezzo oggetto. Abbandonare distruggere riunire leggere chiesa enorme specie continuo. Volere assai duro forza un.\nNobile condizione dito arrestare vestito. E estate solo.', 0, 0),
(136, 'Grande luce lingua disposizione libertà gruppo', 'Chissà promettere legare assai ufficio lotta. Internazionale da labbro.\nGesto produzione conoscenza massimo procedere strano sapere recente. Tornare succedere cucina capace.\nColore restare industriale maestro padrone posizione. Caso costruire medico autorità.\nParola ancora dente scuola fretta seguire un. Possibile nero evitare sorprendere ciascuno. Famoso tendere avvicinare attendere stazione isola.', '2025-10-14', 'Italiano', 'Profondo suo divenire notizia. Giocare sala governo andare meritare. Prodotto polizia verso piantare prova necessario malattia.\nNemmeno nero sala che appartenere valere tedesco. Direttore cantare ragazzo. Forma discutere mestiere titolo.\nCommissione persona davanti pensare. Personaggio raccontare buono operazione scena. Vuoto giorno ragazzo decisione maggiore davvero. Ufficiale onore lotta no discutere.\nConsentire necessità società passare linea pane letto. Nulla amico su immaginare.\nUscire ieri e mi. Tuo aggiungere grado.\nConsiderare conoscere caffè dire rivolgere. Sistema nascere staccare sentire vasto generale internazionale.\nSettimana neanche confessare ultimo latte occasione estendere cane. Voltare concedere argomento spingere esercito si. Costa continuare posizione donna punto attimo.\nNon russo che linea sorridere. Profondo affare vincere chiesa sorriso società macchina. Accendere fuoco aggiungere affare centrale passione qualcuno piacere.', 1, 0),
(137, 'Probabilmente fuoco proporre bravo', NULL, '2000-10-14', 'Francese', NULL, 1, 0),
(138, 'Bestia privato peggio confronto mamma', 'Recente intorno biondo pronto sorgere. Fiducia proposito cioè pregare leggere mamma azzurro luogo. Bene isola motivo diritto cane fissare.\nImmaginare dire aspettare esporre. Sino tuttavia nero stato camera automobile croce. Ritornare origine scendere nessuno lato.\nArrestare serio vestito nascere greco. Questo interno maestro oltre regno. Meglio migliore zona nemmeno anima descrivere centrale.', '1988-10-14', 'Francese', 'Importanza sangue costa bocca. Ci là consentire oggi tratto. Giovanotto fumare verso trasformare europeo.\nLi pianta trasformare punto. Operaio voi cristiano anche dietro contare amore.\nLimite lanciare mantenere pane punta isola aspettare spirito. Giorno insistere collo soffrire morale. Natura generale festa medesimo imparare esso.\nNascere tentare industria cuore desiderare morale dormire. Sperare raggiungere civiltà industriale magari lavoro volta.\nAlzare staccare ridere dottore caso cucina azzurro. Certo cattivo legare qualità potere denaro impressione addosso. Presidente funzione anno spesa ah di leggero.\nMilitare parete accompagnare estero ferire. Maggio peso albero basso forma. Coscienza dito un valle superiore maestro vario.\nMattino argomento dichiarare viaggio zia assistere gioia. Lei cura ne strano.\nSud cielo giovanotto bagno ragazza io. Chiedere tipo cittadino distanza viso domandare condizione. Perciò onore bisogno film inizio enorme diverso.', 1, 0),
(139, 'Comprendere sede quasi', 'Egli operazione enorme visita.\nLasciare opinione preoccupare pieno. Niente mestiere basso giardino.\nLavoro tavolo sapere domandare rapporto salutare nascondere. Parecchio volontà continuo gamba.\nBiondo sacro qualunque gatto brutto dipendere dipendere. Terzo alzare consiglio. Differenza provare mangiare limite stringere molto.\nProposito a abbastanza nuovo.\nCaso stampa onore molto lago arte. Concludere quindi papà comprendere lui. Nemico diritto nome aumentare.', '1986-10-14', 'Inglese', 'Dottore breve imporre sotto. Folla solito comunicazione divenire corsa chi. Imparare impedire baciare soprattutto soprattutto. Nuovo misura simile molto ne preparare ieri.\nMateria interessare portare impedire momento diritto. Ottenere recare cucina differenza stringere.\nCui giudicare fuoco giornale forma appoggiare compagno venire. Qualcuno quarto pagina sognare oh piede.\nVolontà lungo effetto assoluto. Compiere verde cadere sorprendere numero ricordo. Soluzione nostro suo prato. Trarre contenere assicurare principio forza bruciare scuola.\nLatte generale tornare dito lei figlio roba considerare. Contrario coscienza iniziare soprattutto comunicazione distruggere staccare operazione.\nFesta antico ricco sbagliare. Collo tenere pubblicare conto badare fondare onore.\nSeguire solito procedere uno distruggere. Finestra portare avvocato rispetto duro. Onore discorso avanti produzione rosso generale conto.', 1, 0),
(140, 'Preparare rifiutare nudo', 'Dentro rispondere pezzo battaglia sedere greco. Indietro nazionale scendere studiare. Preparare fronte tra fine occasione.\nCiviltà tavola ecco minore dopo sole giudizio. Fumare estremo conto breve inverno insomma. Buio mandare escludere orecchio prima meglio viaggio.\nFaccia pericoloso disposizione cambiare mano non latino. Zia fuori volta assumere.', '2005-10-14', 'Francese', NULL, 1, 0),
(141, 'Conoscenza provvedere assai anno', NULL, '2025-10-14', 'Italiano', 'Distanza numero mentre dare. Stamattina interesse dunque cane grave interessante stella vento.\nFreddo moglie per croce svegliare esistere operaio. Rendere davanti servizio dinanzi sicurezza.\nPer frase punto caro differenza sociale. Accettare fissare salutare aumentare sorella. Abbandonare impressione alcuno attore lei consiglio tirare accendere.\nInterno vi antico metà oro riprendere. Signore contadino limite professore facile comporre.\nQuindi discutere gioco accordo dolce pane divertire. Signorina numero almeno minore proporre.\nFino tardi sposare sviluppo origine riempire legge. Entro bisognare alzare.\nInoltre confronto dove molto pane affatto. Ritorno nazionale sacro coloro concludere sviluppo trarre.\nArma fatica organizzare scienza. Contadino appena porta dichiarare. Carne futuro scappare eppure. Sì vestire rivedere mangiare.\nTanto alzare gusto decidere pubblicare. Pane fino viaggio voglia sperare comprare interessante. Tedesco comodo momento grigio dormire passato.', 1, 0),
(142, 'Discutere mattina aspetto collina', 'Trattare parola istituto famiglia pianta sorriso padre. Mangiare forse mezzo sicuro spingere. Macchina allontanare chiudere fortuna.\nTeatro centro difendere tedesco. Ragazzo conservare nemico ragazzo.\nAmico da nuovo resto. Frutto occhio argomento necessità diretto minore spirito festa.\nMattino magari risolvere sognare filo. Necessità sonno padre offrire perché pieno.\nOdore segnare provocare. Scusare fuggire allora giustizia. Battere storico consiglio coscienza contrario.', '1980-10-14', 'Italiano', NULL, 1, 0),
(143, 'Zia bello veramente', 'Amare testa ecco oh comodo bisognare. Assai trascinare intorno coscienza.\nVestito vasto unico ma serie ricerca. Strada scherzare guardare università ora. Concetto comodo sguardo. Tale repubblica oro.\nSottile notte zona bagno punto sapere se. Montagna durante nome. Straniero eh lì toccare vestito.\nFermo labbro felice processo staccare luogo. Contro risolvere fatica ricevere poco dubbio. Azzurro impressione pianura testa ammazzare.', '1978-10-14', 'Spagnolo', 'Fuoco amore avanti fiume. Relazione attendere magari controllo arma coloro prossimo. Giorno trasformare maggiore dirigere.\nAzzurro che inutile pieno scrittore muro campagna.\nScala congresso desiderio accogliere diretto valore successo. Prevedere pazzo qualunque.\nEcco maggiore risolvere fenomeno uscire comunicazione neppure ritenere.\nProvare sognare perché fretta breve popolazione compagno. Chiamare cosa soldato. Escludere qualcuno sangue compiere mercato.\nMilione colpa breve vento fiore pezzo valore. Addirittura stagione breve età gioia.\nRendere esperienza seguito comodo creare teatro già. Cantare ricordare braccio antico. Staccare latino caldo.\nDiretto forma territorio conseguenza distruggere segnare. Bello ferire notare fede elemento. Poiché oro insomma università gioia che cultura.\nNemmeno patria serie qualcosa impressione. Energia appunto brutto opera.', 0, 0),
(144, 'Egli', 'Subito ricevere amico andare resistere anima perché viaggio. Stabilire giovane motivo programma scienza leggero voce. Ritrovare giornata filo bestia.\nDisposizione prima vita. Atteggiamento loro giudizio dolore.\nGrande causa altro figura durante. Corpo qualcuno origine dottore scomparire. Ferire elettrico sonno mentre contro forte caso. Giustizia vero recare valore interessante rivolgere.', '2007-10-14', 'Italiano', NULL, 1, 0),
(145, 'Disposizione acqua costituire', 'Ridurre vento segretario bastare scorrere eccetera. Avere tecnico osservare rispondere esprimere ragazza attuale. Risultato perfetto ammettere tuttavia piangere corrente. Suonare elettrico finché esercito.\nGuardare esame sistema accordo giornata polizia. Prato difesa fiducia personale cielo.\nSorriso forte cioè forza bere pronto contatto. Anche esprimere lato estero brutto desiderio concludere. Giù messa capello gettare però elettrico.', '2011-10-14', 'Inglese', 'Si destino ringraziare scendere moglie grado privato antico. Insomma immagine movimento angolo istante. Nazionale sistema gettare attendere.\nTentare ragione scusare messa. Buio disposizione discorso assicurare. Perfetto luce alto infatti parecchio il.\nConcludere concetto macchina direttore maniera uomo vivere. Ordine segno qualche andare piccolo. Gamba simile ma qualunque fino successo colpo.\nLuce creare cattivo tempo studio eh fermo luna. Pezzo conseguenza ricchezza provocare.\nSaltare bastare proposito già vestire.\nModo autorità memoria presidente. Funzione disposizione macchina. Desiderare attraversare vivere istante.\nScegliere costa oppure iniziare crisi arma civile industria. Scappare campagna suo peggio costringere accanto domani. Trascinare medico venire.\nOltre comunicazione bello speranza innamorare grande presenza speciale. Lingua festa ieri escludere pranzo francese esempio scendere. Significare epoca immaginare anzi odore.', 1, 0),
(146, 'Età camera', 'Legare conto spettacolo insomma quarto. Tutto figura rendere esistere.\nNome romano capo però. Successo quale secolo essa difesa guidare grosso. Punto esame calcio scuola.\nInteresse soprattutto proprio grande invece dove tirare. Presenza contrario lungo straniero iniziare fiducia toccare.\nInnamorare tavolo soprattutto tratto minuto gamba allora. Battaglia fondo scherzare stabilire.', '1977-10-14', 'Italiano', 'Parete fondare questo adesso parecchio. Tono determinare vento materia politica cambiare. Inizio completamente nome scala suonare.\nLui eccetera discutere errore. Assicurare vostro tanto trattare specie riprendere.\nSignificare capo cane bruciare autorità corso proposito. Soldato chilometro mondo credere. Innamorare porto a semplice continuo personale. Vasto mattino entrare.\nAnimo interno giornata favore appoggiare latino dirigere. Impedire accorgersi angolo attore proposta certamente. Eccetera recente necessità antico.\nSegno lontano contatto sorella campo.\nVuoto maggio affermare angolo greco fermo. Condurre maniera abbandonare mostrare improvviso con comunicazione. Scendere fuggire peso abbandonare.\nVendere gruppo lingua massa portare. Uccidere soltanto volere lì.\nDomanda preferire tavola voltare diffondere. Basso potenza capitare chiaro. Papà pesare zona teatro. Fermo qualunque suonare gruppo interessare folla giornata funzione.', 0, 0),
(147, 'Condurre', 'Significare silenzio capitare pianura ammazzare evitare se mettere. Modo piazza giornata appunto dietro. Diretto apparire angolo segnare. Resistere dolce sangue sì continuo permettere strada.\nArmare luce studiare ascoltare nessuno seguito. Legge rientrare anno altro allontanare rappresentare nudo. Superare gruppo coloro segno bambina procedere.\nBocca tavolo operazione braccio. Effetto attesa persona ammazzare ne elemento.\nNumero levare quindi.\nDovere in comunicazione pericoloso attimo.', '2003-10-14', 'Francese', 'Religioso lungo testa attorno mestiere ricerca prezzo. Preparare croce corrente ricchezza che no.\nRispondere zio contenere fuori sala film. Giù superiore mare formare. Saltare unire figlio marito tardi dolore comunicazione.\nMigliore messa indietro toccare sorella finestra.\nFinalmente ammazzare appoggiare secondo avere esistere volere. Ordinare macchina guidare fronte. Studio ponte fondo che russo.\nLibertà contento forse peso spettacolo cattolico organizzare oltre. Imparare sognare portare filo tenere preparare forza. Porta rivelare consiglio tardi forma no.\nInsomma fornire rendere pomeriggio massa. Stamattina leggere amore inutile ieri.\nInternazionale montagna invece scienza padre soffrire attento. Coloro quanto esistere processo concetto vero labbro.\nStrano vita vivo misura. Dirigere mente conseguenza memoria stella consentire.\nPerciò scoprire nord avvicinare notizia guardare. Giorno segreto ma bagno minuto discorso pubblicare.', 1, 0),
(148, 'Privato imparare', 'Regno rimettere patria armare. Peso labbro superare mente.\nBattere iniziare passato vendere tratto.\nMisura prodotto volto voglia svolgere muovere crisi. Perciò chi giungere argomento infatti.\nSoldato piano spiegare governo onore cura fondare. Levare soprattutto cucina confessare lavorare.\nFatto offendere contatto prossimo luce loro piantare. Ufficio credere zia mestiere badare chiaro energia perfetto.', '1998-10-14', 'Spagnolo', NULL, 1, 0),
(149, 'Scappare', 'Superare parola pubblico centro. Effetto bianco diffondere momento carattere secolo.\nChiave dolce bambino chiesa. Loro lei contare considerare potenza generale. Elemento egli pietra fiume temere. Particolare nemmeno svolgere produrre mentre cristiano.\nMuovere partire lavorare addirittura passione notare dimenticare. Collo figlio nascere egli.\nTacere amico tenere presentare sapere. Lira togliere lotta direttore.', '1996-10-14', 'Francese', NULL, 1, 0),
(150, 'Scoppiare ottenere volontà', NULL, '1977-10-14', 'Spagnolo', 'Fine tardi albergo programma diffondere settimana. Matrimonio salvare noi gusto. Voltare interno angolo qualità.\nSostenere esame nulla punta addirittura interessante chiave. Interno grosso tanto organizzare accogliere scoprire prezzo. Recare smettere davanti.\nEgli voltare settimana indietro funzione collo. Dire bellezza costruzione crisi fretta sorprendere.\nMateria ragazzo attesa limitare ampio escludere corrente. Interessare scena stesso problema occorrere.\nMamma che morte quale assistere conservare zitto. Sala immagine frutto pazzo promettere osservare faccia. Presidente ammazzare confronto dente arrestare. Descrivere dedicare decidere.\nFumare riportare entrare mezzo restare passare. Continuo signore parte girare. Grigio attore compiere comporre invece pazzo scegliere.\nCoraggio sereno affermare tenere riguardare calcio. Insistere convincere corso spazio ordine sguardo.\nPreoccupare luogo oramai bene servizio.', 1, 0),
(151, 'Bastare zitto', NULL, '2025-10-14', 'Francese', NULL, 1, 0),
(152, 'Sociale', 'Meglio bagno ridere corrente presente. Vestito università comunque solo sopra accanto parere. Segretario serie destro vostro medesimo luna esistere. Presentare insistere rosso notare ecco.\nRicordo neanche inizio attuale civiltà giovane mancare. Provare pomeriggio importanza riempire pubblicare guerra. Mamma amore morire ripetere intendere naturale operazione.\nMadre fra anzi destino bere causa. Lato lungo in avere.', '1984-10-14', 'Spagnolo', NULL, 1, 0),
(153, 'Bisognare normale regione offrire vuoto rivedere', 'Repubblica confessare isola battaglia interesse. Argomento giallo spirito internazionale semplice trasformare. Difficoltà indicare salire intenzione parte.\nPresente francese giù svegliare attore proposta perfino. Meno stare figurare triste.\nAspettare li rapporto destino diritto forza. Stella paura pomeriggio lago pena. Motivo pronto pranzo duro straordinario.\nCapace uscire paese mare esprimere peccato.', '2020-10-14', 'Spagnolo', 'Ritornare ringraziare marito strumento stringere. Vestito orecchio oppure cantare. Guardare neppure pubblicare esame sicuro.\nGesto economico fortuna americano. Bosco frase sotto unico concetto avvocato cittadino. Macchina risposta personale congresso qui meno.\nLeggero condurre scomparire madre. Conservare giardino scrivere conseguenza minimo fine prendere. Sviluppo qui semplice insieme voglia rapido. No invitare sotto periodo storia grosso.\nSembrare freddo tono verso ritornare freddo. Dichiarare soluzione però riempire operaio nascondere. Soldato figlia nostro attività straordinario salvare teatro.\nTeatro autore affermare caso bisognare soprattutto parola presentare. Dinanzi cui avanzare caso improvviso stringere partito.\nPianta buio sentimento dio. Lavorare linea dopo rivolgere. Ogni giro mattina.\nChiamare abbandonare compiere contenere bagno partire grande pomeriggio. Davvero sonno sole causa ognuno albero società. Preparare oggetto assistere.', 1, 0),
(154, 'Regno coprire necessità contenere albergo', 'Memoria marito adesso strada se foglia raccontare cattivo. Bianco conseguenza disposizione breve invece. Scala leggero opporre dinanzi.\nSeguito confronto permettere parere albero marito sorridere. Sostenere né presenza messa leggero dentro.\nSorridere spazio distinguere ferire.\nCarne entrare lira produrre brutto. Madre montagna dito vostro donna strada simile madre. Loro chilometro mangiare certo figura un durante trarre.', '2001-10-14', 'Tedesco', NULL, 1, 0),
(155, 'Sicuro bastare piede', 'Recente coprire scegliere porre fine. Coscienza domanda battere rivolgere ampio.\nSperanza viaggio isola togliere giornale argomento stasera bastare. Numero immagine desiderio. Contenere occasione mancare essa ah.\nQualcosa cioè tra pensiero ritorno. Lungo forte arte risolvere contento potenza.\nAppartenere maggio ponte. Motivo pure dentro successo qualsiasi questo.\nPericoloso tenere medio aria fermare calcio capello. Uguale ampio congresso.', '2015-10-14', 'Francese', 'Generale vicino spirito potere titolo. Rivoluzione ragazza prendere indietro trasformare migliore pericoloso vista. Produrre sapere insegnare amico sereno durante invece.\nMigliore opera levare valore difficile rimettere ponte. Qualità insieme strano qui usare si togliere. Un vento faccia risultare direttore. Denaro cane mio ministro sinistro.\nPopolo posto sembrare famoso principale. Procedere proposta paura piangere sposare dopo però.\nPronto notte giallo situazione tenere salire intanto. Molto corrente sedere suonare.\nImmaginare eccellenza professore avvertire coraggio correre cane giusto. Giudizio niente mangiare prendere ricevere fresco stanco. Servire valore tacere esempio.\nOgnuno di bastare forse compiere bastare. Colpa naturale occhio terreno senza tutto. Cioè ricordo attività oramai preoccupare disposizione quanto.\nStoria colpire dubbio cavallo giustizia film bosco altro.\nPieno operaio opinione comprendere. Rivoluzione misura andare senza. Animo puro signora gente distinguere.', 0, 0),
(156, 'Raccogliere scappare', NULL, '1988-10-14', 'Italiano', 'Nave sguardo attorno gente riempire cortile. Albergo durare ospedale segnare guardare angolo. Fede moderno convincere stabilire.\nGesto malattia qua trarre fondare opera. Villa su frutto morale parola profondo. Pena industriale quale sogno figlio umano. Morte impressione come polizia ecco.\nSangue però riempire film atto cuore. Subito medico principale incontrare greco probabilmente. Legare restare pazzo capo battere diffondere semplice togliere. Dente chiedere libro impedire anima affare soltanto.\nEnergia sotto civiltà foglia onore. Fondare costituire colpire croce marito attuale sereno. Noto tale capire non non distinguere.\nSorprendere diventare indicare. Verso qua nessuno bellezza magari tardi. Domenica bisogno strano svegliare. Sorriso recare destro saltare bisognare.\nMorale arrestare opera azione sposare partito promettere. Tu erba croce senso carta voglia fino. Periodo interesse scrittore molto noi volare ricerca.\nFavore albergo relazione giocare antico partito direzione lui.', 1, 0),
(157, 'Giallo saltare', 'Attività capire peggio ritrovare. Trarre buttare cielo massimo piantare molto intanto.\nAscoltare teatro rimettere risultato lei sinistro. Principe battere risolvere io estate medico silenzio.\nUn imparare giusto soluzione. Contrario disporre superiore montagna. Capo gioia oppure concetto nome successo importanza odore.\nGrave assistere maggiore nascondere gente. Corso espressione trascinare straniero lei annunciare. Dimenticare ascoltare oggi alzare compiere. Regione vita noto lasciare gioco.', '1980-10-14', 'Italiano', 'Chiesa rompere conseguenza minuto attendere ne ricchezza strumento. Stare sala allora morire elemento.\nGiorno operaio latte risultare. Bambina per ammazzare pazzo soltanto leggero per.\nSerie liberare tornare adesso bambina dente. Tutto cucina parola addosso principio sotto. Veramente industria odore muro.\nAttimo governo da spalla labbro provvedere. Arrivare quadro almeno staccare.\nTecnico fiore posto volto. Leggere dirigere ragione nessuno. Loro notizia anche speranza europeo. Soffrire cattivo bruciare dietro anima soffrire.\nSecondo impossibile origine signora scuola essa comprendere. Dividere religioso cortile.\nMovimento mangiare volta godere impossibile figlia alto. Estremo lavoro antico difficoltà spiegare. Resistere sentire biondo leggere amico indicare.\nPace basso parola passato terzo accordo fermo. Diverso fianco qui.\nEsporre attraversare errore mestiere. Nero abito ricordare. Significare considerare pomeriggio.', 0, 0),
(158, 'Mi arrestare fatica', NULL, '2020-10-14', 'Tedesco', 'Mio uomo ognuno mangiare industriale concedere partire. Monte grosso pena.\nUtile bambina gusto contatto misura qualche. Regione direzione proposito dentro corso.\nStanza noi perfino giusto ci vento fretta oggetto. Preparare ognuno romano ritenere casa. Ricchezza invece nudo veramente favore.\nDentro giornale rosso. Interessare comunque recente porta divenire dimostrare.\nPromettere buono popolo serio caratteristico mangiare. Vento occorrere necessario parete servire maestro mano caffè. Divertire davvero riconoscere. Attento comodo ritenere.\nGiugno sorriso famiglia coscienza. Dichiarare sereno proposta latino pranzo partire leggero. Neppure odore costruire necessità pesare possibilità problema.\nIntenzione fronte riconoscere questione opinione esempio fumare. Vasto specie dolce prodotto brutto giustizia. Mezzo mente tenere titolo sorriso.\nAttorno scrittore medio. Amore costruire condizione camera futuro già matrimonio. Storico esperienza caldo ordinare.', 1, 0),
(159, 'Peso destino terzo ultimo ciascuno', NULL, '2011-10-14', 'Tedesco', 'Distanza succedere letto tempo toccare natura mamma. Uno volto maniera svegliare rivoluzione lei scherzare. Niente angolo perciò sperare giudicare aumentare almeno.\nSignorina persona continuo tedesco effetto giungere. Grave autorità pensiero amare divenire esercito. Oro biondo descrivere gioco togliere difesa. Industriale pensiero questo fiore continuare costruzione notizia.\nMese intorno avvenire padrone civiltà risposta. Signorina ammazzare avvicinare cosa immaginare appunto.\nNord anima tra inutile posto. Attimo appartenere infatti presente provincia.\nImmagine città cultura.\nPrezzo dietro comune scendere. Dormire forza sedere ogni certamente.\nContrario fantasia pericolo cantare unire ambiente. Convincere là baciare condizione. Piede diretto appena.\nMoglie prevedere poeta parte bene. Levare fantasia caratteristico incontrare.', 1, 0),
(160, 'Tale', NULL, '1977-10-14', 'Italiano', NULL, 1, 0),
(161, 'Volere cura celebrare colore', 'Necessario vendere mancare figlia volere giustizia.\nAh scienza giardino eccetera centrale. Recare oltre accordo no marito io. Anno ieri mercato recare.\nCentro minimo forse.\nMarito metro impossibile recare. Coloro spingere monte bosco vedere vivere bosco.\nAlcuno forma notevole grande. Grosso diritto ancora riprendere superiore operazione.\nCreare dedicare sogno. Vasto preparare potenza scopo.', '2014-10-14', 'Italiano', NULL, 1, 0),
(162, 'Difficoltà magari vincere conoscenza', NULL, '2004-10-14', 'Italiano', NULL, 1, 0),
(163, 'Semplice concetto direttore vicino', 'Chiesa addosso coraggio affatto giro spingere. Carne importare ufficiale ancora arrestare svolgere. Peso superiore distruggere dubbio vivere produrre sì.\nDurante programma vista attesa cane compiere. Esso sognare scorrere davvero sotto. Interesse perfino uomo argomento dove altro.\nImmagine offrire ne sognare. Medio sereno decidere governo proporre.\nScala collina erba preciso. Importante nave papà assumere.', '1981-10-14', 'Spagnolo', 'Scrittore neppure amore romano aprire innamorare collo. Termine piede prossimo difficoltà. Buttare sacro levare militare svolgere angolo direzione.\nMadre latino stare esame perfino conoscenza durare alcuno. Discutere giorno vestire. Morte infatti osservare prendere.\nFrase ciò cominciare abitare. Ascoltare piantare togliere romano visita indicare.\nDipendere bisogno quindi riportare enorme proprio diventare. Addosso porre diritto italiano chi impressione fenomeno intendere.\nFresco valere elemento oltre salvare poiché. Ne giù preoccupare dormire.\nLà memoria coloro patria cioè. Alto fermare contento assicurare. Accorgersi capello romano linea.\nVolontà chi treno svolgere film giardino. Arrivare ragazzo sguardo nazionale.\nStesso opinione sentimento ritorno congresso crisi. Rosso trascinare niente peccato vicino. Futuro caffè già appoggiare sistema popolazione comune.\nLettera fiducia veramente necessario contento lavorare inizio. Adesso fatica notizia colore prendere giovanotto nemico.', 0, 0),
(164, 'Affare toccare', 'Ragazza presidente voi da economico naturalmente pagina peggio. Prevedere nave probabilmente. Bellezza don nessuno chi. Naturalmente raccogliere io sacro indicare verde.\nTedesco fresco prato cucina intenzione sentire cortile. Coscienza breve cattolico.\nMetà no quadro determinare coprire. Provvedere girare automobile vasto assicurare sembrare. Colpire forza sapere.\nSpirito finché sostenere pietà grado.\nFuturo oramai industria contadino soffrire. Greco niente sviluppo simile uso.', '1998-10-14', 'Inglese', NULL, 1, 0),
(165, 'Chiave leggero contenere corsa di almeno', 'Accettare strada europeo fabbrica indietro. Assoluto giorno notizia coloro correre tirare.\nPiantare lettera tale difficile qualcosa continuare. Anche niente grazia gioia piangere probabilmente.\nCorrente difendere tacere ottenere destino nord. Largo rapido scendere.\nEssere pena quanto termine capello freddo. Osservare comprendere dire gamba mare congresso. Valore passare tratto da un.', '1982-10-14', 'Francese', 'Marito nemico meritare mantenere corso offendere settimana. Proposito preferire fretta stanza.\nGiovanotto per aumentare alto comune immaginare muro. Libertà decidere vivo voglia uomo giugno.\nMisura diverso contenere.\nFianco corsa internazionale inglese autorità interessare. Folla pazzo viso guardare saltare offrire famoso. Stagione cosa enorme scegliere nuovo lì incontrare.\nMeglio intanto tu appunto massa. Operazione volta partito cavallo poesia smettere abbandonare. Perché improvviso proprio viso parere riunire sinistro.\nSignore ripetere cura cominciare sottile ragazza. Sì tendere preoccupare fornire monte e.\nSpegnere donna invitare teatro solito caso. Fame riunire sottile svolgere apparire. Sì chi fabbrica nascere meglio assicurare.\nVostro ragazzo insomma rivedere quale. Decidere prova essa montagna dire erba pronto.\nNuovo relazione ciò. Annunciare ricchezza nazione.', 0, 0),
(166, 'Mio', 'Vivo politica strumento. Ampio rapido dividere soldato.\nSoluzione ammazzare caro. Pianta sapere importare unico.\nPreferire discorso proprio chi sicurezza dopo passo volto. Presentare disposizione scappare politica. Economico nazione sonno nudo punta servizio solo.\nConfessare studio insomma porta. Comodo colpa casa misura titolo origine. Opera sinistro particolare preferire breve.\nCadere stasera resistere carattere insomma assai. Finalmente tavola elettrico caso udire vincere medesimo.', '2022-10-14', 'Tedesco', 'Muovere valore base già. Ombra levare cui corpo fatica.\nFame cantare insegnare dimostrare stare prova davanti. Argomento notte li su nord. Alto vestito ammazzare decisione compagno costa presso.\nFede credere finire porre. Corso padrone freddo stella libro scoprire caro.\nSorridere addosso imporre pubblicare settimana stare scopo. Soluzione puro scorrere superiore. Concetto naturale terzo giornale.\nSignora accendere grazie giusto. Produzione giorno forte cambiare.\nVista imporre diffondere perciò. Avvertire madre nemmeno azione vero bellezza stanco nessuno.\nSmettere esporre poiché cittadino.\nSera giro comprare difendere oppure temere tavola giovane. Gente riferire e pensare il studio qua collina.\nErba svegliare diffondere differenza signore spalla battaglia. Tono idea dolore festa diventare egli simile.\nAttorno scala pensiero divertire. Affatto anzi metro pensare confronto.\nVeramente segno proposito preferire spiegare volta probabilmente. Classe ciò domandare matrimonio attesa uso.', 1, 0),
(167, 'Lungo', 'Gesto fermo leggero porto fuoco argomento. Cui raggiungere corrente provocare.\nPatria contento ringraziare però figura parere. Mercato posto potenza con stabilire zio staccare colore. Colpo avanti signora fuggire affatto bocca buttare lasciare.\nTale scopo latte. Bosco fede libero ieri numero linea proposta. Affare lato lei freddo costruire povero circa probabilmente.\nFissare rappresentare cosa apparire interessare. Errore resistere figlio mare.', '2025-10-14', 'Spagnolo', NULL, 1, 0),
(168, 'No signore', 'Cattolico attorno situazione ne. Sembrare mio alcuno collo lago parere.\nRaccogliere improvviso giudicare libero rompere staccare centrale mostrare. Nascere bagno pubblicare spettacolo bene elemento.\nPrima dente umano imporre. Appartenere gesto ritenere sociale.\nParecchio situazione milione presentare levare. Imporre completamente linea europeo. Colpa eccellenza servizio oggi ambiente.\nZia io secolo mattino sentire. Vario autorità stamattina sacrificio.', '2023-10-14', 'Francese', 'Disporre odore osservare inglese giusto. Gesto ragazzo notare numeroso essere però. Pezzo mestiere volta attorno inverno acqua scopo.\nVilla gente fabbrica entro testa morte voce. Gettare lungo vivere scherzare sforzo contatto rispetto. Superare scherzare allora davanti stesso verde condurre.\nFantasia titolo arte capo. Materia materia immagine sereno fornire vostro.\nPeso prima autore lingua salire consiglio scoprire cane. Avvicinare costruire denaro ieri. Rientrare presidente partecipare.\nGettare cantare provincia importante. Favore metà studiare.\nSorgere buio povero qui ecco limite comunque occorrere. Ne mercato minimo descrivere.\nMalattia poco parete pericolo montagna via bisognare. Mercato inizio posare scappare lato.\nTu annunciare volontà perciò battaglia bagno.\nNemico notevole comunicazione religioso giardino. Fuori affare posto interesse confronto elevare. Riunire acqua necessità sentire.', 0, 0),
(169, 'Strada', 'Rispetto fornire motivo temere tirare oramai che. Voglia povero condurre esame qualcosa felice basso. Decisione misura convincere assai circa.\nInverno numeroso parere quanto nudo attorno. Donna più cultura promettere vendere giocare dipendere. Stesso merito posare dimenticare cattivo accendere probabilmente.\nOspedale escludere comprare interno donna però coloro. Giovane avvicinare qualche rifiutare dividere.\nDolce spesa latte estremo. Offrire passo nascere tavolo.', '1995-10-14', 'Francese', NULL, 0, 0),
(170, 'Conoscere giornale camera lavoro', 'Compagnia morale concetto scherzare ferire scala. Pronto commissione pagina vasto figurare ponte figlia. Considerare salire termine servizio rivoluzione sereno. Scegliere legge cuore spazio cortile ritrovare comprendere attraversare.\nIntendere sorriso visita innamorare sognare sbagliare. Baciare posare smettere cambiare immaginare bello sotto europeo.\nMinuto classe sviluppo rosso. Silenzio finalmente giovane azione seguito. Tutto apparire tuo spesa ritrovare moglie aspetto.', '1991-10-14', 'Spagnolo', 'Cavallo greco sangue. Guardia minuto ministro spingere. Parete giungere baciare nudo rendere. Pomeriggio voi oltre togliere.\nFornire serie risultare abito affrontare.\nEconomico crescere risolvere signorina ancora. Donna svolgere bellezza riconoscere accettare maestro fermare.\nImportanza toccare finalmente infine milione noi tirare. Grazie esame essere mangiare internazionale svegliare.\nUno esso riferire dividere chissà nazione. Stazione militare signorina controllo neppure diventare bere. Sereno cercare breve leggero porto pubblicare cittadino. Personale certo non credere.\nPace abito esempio morte posto onore grave. Destino ripetere meno fretta situazione.\nSembrare solo ieri preferire estendere caldo. Amore questione rimettere unire.\nNostro vero riguardare rapporto triste verità visita. Riferire potenza concludere riva rispetto pezzo.', 1, 0),
(171, 'Semplice finestra istante soprattutto mangiare titolo', 'Arrestare cultura vuoto desiderio giornata silenzio semplice. Fra fuggire intanto prossimo completamente che orecchio.\nProfondo attento altro volto tutto animale ospedale. Assicurare chiedere gioia caldo. Rivoluzione imporre sicurezza azione.\nBello lingua zona enorme. Volare sotto fresco insegnare proporre richiedere. Chiudere formare voce. Produzione scrittore comunque finché dente.', '2004-10-14', 'Tedesco', NULL, 1, 0),
(172, 'Settimana guardare essere medico testa bene', NULL, '1978-10-14', 'Italiano', 'Relazione partecipare corso parere. Popolazione operazione durare. Riuscire fenomeno attenzione servire acqua dunque periodo don.\nComprendere affrontare promettere sacro gente anima. Chiudere terzo speciale riferire soldato. Vento chilometro ah terzo pianura significare maestro.\nGiro davanti vario. Foglia palazzo seguito voglia fondo mentre momento diffondere.\nSignorina conoscenza insomma grazia straordinario figlia mettere. Distruggere vero ministro gente filo. Abbandonare felice cittadino espressione.\nAssicurare necessario costituire.\nPadre ecco divenire studio oggi bisogno oro. Ne posizione sguardo tornare felice. Ammettere nuovo scena legare relazione bisognare innamorare.\nOrdine soffrire termine parecchio legge. Opera arrestare zio pagare. Macchina mantenere domandare.\nClasse ragazza esperienza difesa. Trasformare ne vestito dopo accorgersi lettera. Pranzo adesso bruciare.\nTroppo giorno corsa. Veramente rompere creare soffrire libero.', 1, 0),
(173, 'Offendere fatto', 'Limitare bambino venire tedesco termine attenzione sposare. Polizia piantare piacere saltare pianura. Soltanto arma divertire conseguenza.\nRispondere mano scopo scegliere necessario prova americano risolvere. Specie voglia assai origine merito funzione venire contento.\nSistema oro divertire metro qualsiasi pranzo. Esistere fantasia gusto riprendere.\nPace domanda fame condurre piede spazio affare importante. Pelle volere giudicare accompagnare.', '2003-10-14', 'Italiano', NULL, 1, 0),
(174, 'Intorno mente abbandonare maggiore termine soffrire', 'Pagare costa donna annunciare necessario. Chiedere pagina amare usare ritornare conservare necessità.\nErrore rimanere automobile risultato. Almeno tuttavia quale fino oggetto richiedere. Cominciare vestire riconoscere domandare dove pelle.\nMetro attendere parere società popolazione nord tentare. Buio opporre scoppiare luna appoggiare effetto rientrare. Abbandonare vestito sostenere.\nCittadino trasformare produrre quale aiutare considerare.', '2012-10-14', 'Tedesco', 'Buono genere straordinario proprio territorio capo diventare energia. Opera generale regno enorme poco pronto periodo commissione. Fondare venire perciò.\nSimile umano aria piangere. Paese notte ottenere sviluppo ringraziare riconoscere grigio. Addosso punto offrire rimanere scherzare.\nSubito italiano sembrare. Ragazzo assai conservare oramai fantasia qui.\nVedere scrittore spazio ritorno fumare. Su quadro di rivelare minore salvare figlio.\nSembrare tirare esprimere. Elemento programma industria costruire metro assumere braccio perdere. Volontà ultimo terzo linea immagine notevole.\nLabbro diretto materia motivo a fissare servire. Affrontare stare accogliere mangiare. Volare principale mostrare perciò.\nMateria disporre addirittura dichiarare atto notevole profondo forma. Primo avere pubblico mattina.\nForse nascere rispondere libro cura veramente largo. Piazza europeo di opinione.\nSignora contrario qualsiasi attraversare sacro suonare. Bisognare generale intenzione.', 1, 0),
(175, 'Minuto godere invitare', 'Attendere oggetto attività marito pezzo metà affare chiesa. Sorridere direttore dinanzi cura. Diritto opporre mattino memoria domenica difendere né. Posto preferire passo bello.\nCosa scorrere sognare vita. Ci per campagna abbandonare fiore signorina mare.\nSolito rispetto attore. Mio gesto villa rivoluzione effetto. Evitare calcio minuto perfino presenza autore dolce.\nMare prima domani assicurare effetto iniziare grigio. Cadere grande spegnere riconoscere.', '2007-10-14', 'Inglese', NULL, 0, 0);
INSERT INTO `bookinfo` (`BookInfoID`, `Title`, `Description`, `PublicationYear`, `Language`, `Summary`, `IsAvailable`, `IsDeleted`) VALUES
(176, 'Minore fermo', 'Finalmente scienza pensiero importare riprendere. Sistema fiore risposta paura verità dichiarare. Padre pezzo tanto.\nTardi salire bianco iniziare attimo soldato.\nSoffrire parere americano principale risolvere massimo autorità italiano. Ambiente gamba tenere gamba appunto realtà diretto sguardo.\nEcco rivolgere serie colpo. Dirigere difesa corsa comodo apparire. Volontà importare ecco piazza per prodotto affare divertire.\nBagno appoggiare salutare trovare.', '2016-10-14', 'Tedesco', NULL, 1, 0),
(177, 'Interno dimostrare elevare fronte', 'Pensiero gatto sposare parlare umano.\nSalvare modo appoggiare oggetto cortile. Sera problema e sostenere.\nFame stanco raggiungere compiere cielo.\nSerio entrare questione storico contro immaginare periodo. Raccogliere qualche dovere intero. Scuola regione risultare caro pane presente.\nGiustizia religioso signora costituire salire volontà. Oramai pericolo brutto organizzare maggiore padrone. Lui sognare zitto popolo specie descrivere.', '2013-10-14', 'Spagnolo', NULL, 1, 0),
(178, 'Muro ciò', 'Dovere tuo principio secolo porre addosso vino. Luogo segno consentire gente piangere epoca riportare espressione. Accettare povero impressione indietro. Cane sottile prodotto.\nCamminare ricordo vendere fine stazione costruzione. Internazionale ragione vivo palazzo.\nGenere speciale pomeriggio li stagione paese. Finché dio attore stasera. Utile accordo colpa popolo tendere dubbio.', '1991-10-14', 'Francese', NULL, 1, 0),
(179, 'Significare camera pericoloso', 'Inverno memoria se dipendere duro ritorno. Qualsiasi là rispondere conseguenza largo.\nPoesia medio grazia via figlia.\nGrosso uccidere eh ultimo decisione. Stare coscienza valere diritto discorso minuto potenza nazione. Concludere università ricordo energia.\nAbbastanza duro uscire celebrare quello nascere idea guerra. Sbagliare fra appena civile servire. Sociale natura relazione mondo eccetera cui causa.\nBagno là grazia istituto. Recare rivolgere realtà errore soldato attività a.', '2009-10-14', 'Spagnolo', NULL, 1, 0),
(180, 'Interessare coscienza pericolo', 'Dove anima discutere istante fondare sposare. Stazione riva cominciare antico svegliare.\nCortile secolo film elemento voglia risposta. Contatto dove camminare scienza estate strano materia ottenere.\nO sguardo vario dedicare stagione parlare con comune. Titolo qua fine ritenere sperare capo. Vicino camera dietro superare.\nFatto dove lei togliere lasciare gusto segnare.', '2011-10-14', 'Tedesco', NULL, 1, 0),
(181, 'Religioso cui forte', 'Volta concludere superare duro. Formare azione fantasia strada ci modo andare. Senza colpire convincere lei difficile. Prima tavola fortuna.\nColpa avanti alcuno donna sacro soprattutto ringraziare.\nAssicurare prova buttare lingua piede. Richiedere vicino dito tedesco distinguere comune inutile vino.\nEsperienza mattino folla alcuno giro capello escludere chi. Verde intendere là dio. Vario operazione sentire assicurare abitare.', '2005-10-14', 'Spagnolo', 'Palazzo tranquillo offendere segno favore. Estero staccare seguito occasione situazione stasera programma.\nPorta segretario spettacolo mandare politico azzurro estremo passare. Pazzo concedere necessario corsa attendere nazionale riunire segnare. Lingua figlio conoscere annunciare.\nCostringere meno ricchezza bere personaggio ricordare avere soluzione. Scienza oggetto riva. Provvedere salire pericolo ecco affatto comprendere privato. Zona imparare tono elemento processo.\nOrecchio tavolo oppure ragione colpire salutare fiducia tanto. Modo marito davvero polizia cucina attuale cantare. Vivere già grande preparare parete zia.\nCapitare battaglia attaccare sud personale giardino senza. Aspetto si adesso opera.\nConcludere ragione avvertire differenza considerare giudizio spirito. Odore casa fratello ferro pericoloso.\nTemere libertà buono riferire più riempire volare. Domenica mostrare ogni azione ritorno. Esprimere accordo non. Guardia pesare fretta voce spesa.', 1, 0),
(182, 'Meno', NULL, '2013-10-14', 'Tedesco', NULL, 1, 0),
(183, 'Arte giallo posto attuale ripetere confessare davanti', 'Confronto minore scegliere corso.\nTornare uno spesso maestro ottenere nazione giocare. Ottenere nave trovare vero. Minimo poiché posare giudizio molto concludere adesso.\nContro ritornare allontanare latino bere dedicare. Sorridere condizione volta partecipare prossimo dimostrare.\nAppunto quindi quarto rosso foglia. Ciò storia età patria italiano muovere gente. Enorme togliere uomo neppure sì occhio.', '1997-10-14', 'Inglese', NULL, 1, 0),
(184, 'Camminare lotta scorrere pelle', 'Amico posizione produrre possibile. Collina imparare vento poeta.\nPieno medesimo posare profondo mostrare. Concetto partecipare passato insistere. Iniziare stato prevedere periodo. Scusare massa teatro fatto dente piangere posare breve.\nTavola dinanzi attendere pericolo. Medesimo foglia avvicinare grazia perché.\nBello tavola scomparire o nero presso tendere personaggio. Zia intorno storico porto ferro ringraziare. Latte egli lasciare giocare governo bagno labbro.', '2020-10-14', 'Inglese', NULL, 1, 0),
(185, 'Creare inutile', 'Corrente istante campagna parlare improvviso opera giusto. Croce ma mantenere forma volontà. Intendere liberare rientrare appoggiare ridurre ammazzare succedere.\nBambino limitare trascinare giornale insomma pane famiglia. Stamattina atteggiamento padrone ascoltare qua. Tale consiglio vi scappare ricerca.\nPieno figlio girare. Naturale conoscere opinione fondo forma parecchio compagno. Speciale ci spettacolo soldato inizio piccolo.', '2000-10-14', 'Francese', 'Forse sociale assai nulla ragazza mercato domanda. Scoprire affare sognare vino posizione finire.\nFino forse visita condurre piazza sviluppo. Domenica faccia pericoloso temere minimo.\nCrisi veramente caratteristico venire linea seguito oramai partire. Anzi punta spiegare opinione capo bisognare crisi.\nNascondere idea qualità. Mano triste vivo mi bisognare neanche famoso.\nAddosso durare epoca soprattutto. Guardare elemento risultato faccia centro sviluppo tecnico. Giudizio giornata svolgere arrivare peccato.\nScrivere domenica essa finire limite riuscire. Intanto grigio chiudere abitare intenzione ragazzo preferire.\nPezzo ci musica situazione porta territorio senso. Gruppo fuori costa desiderio pagare nemmeno insomma. Solo pietà spirito qualunque ognuno figlio fissare.\nDopo figurare uso inverno imparare tardi parte risposta. Suo invece seguire attore spalla triste verso. Davvero storia greco sangue.\nProblema nome occhio. Notte figurare popolo.', 1, 0),
(186, 'Continuare dividere', NULL, '1983-10-14', 'Inglese', NULL, 1, 0),
(187, 'Mercato fronte occasione sinistro inoltre', 'Cane territorio restare opera colpo partire scoppiare. Film oggetto punta storico distinguere.\nUltimo vincere rosso ragazzo.\nSettimana studio silenzio posto bello atto. Sforzo triste patria dottore europeo. Creare poesia probabilmente seguire condizione fine tardi sicuro. Tuttavia personale pensare istante estendere elevare.\nBiondo gusto abbandonare silenzio terreno. Qualche capo esprimere finestra giro. Compagno dipendere portare fondare e pietà meglio.', '1993-10-14', 'Spagnolo', NULL, 1, 0),
(188, 'Piede oggetto contare scoprire', NULL, '2024-10-14', 'Tedesco', 'Conservare ridere scappare industriale proposta rendere. Loro dentro nave. Morale stella bestia qualcosa cominciare presenza.\nGrave imparare dimostrare.\nLasciare intanto compiere religioso lago. Aumentare veramente ritorno.\nCroce vivo operazione godere. Necessità studiare confessare stringere alcuno male. Principe pure piangere rosso tono.\nSera largo finché lì corrente. Freddo grande ragazza compagno.\nTuttavia lì correre trattare sorella. Industria zia apparire libero società patria ritorno polizia.\nNoto riferire forma fiore credere tutto. Pieno colpire rivelare li greco. Notizia ultimo attento cortile.\nVestire abbastanza attimo altro contatto invitare conseguenza. Termine civiltà piazza tipo.\nConservare scienza compiere carta. Labbro pagare scusare mattina. Primo don affare cultura ci epoca partito.\nGridare stesso avanzare ministro massimo sangue quindi iniziare. Intendere divenire onore fine tentare assoluto.\nUso correre no. Ricerca altro università capo. Trasformare mangiare zia.', 1, 0),
(189, 'Durante strumento maniera', NULL, '1997-10-14', 'Tedesco', 'E vuoto sorprendere questo nero. Andare milione un albergo domandare.\nSorprendere aspettare permettere centro mandare riguardare chi soltanto. Recare confronto diretto folla. Attorno croce troppo sociale presidente movimento giustizia.\nSguardo atto battaglia. Sentire raccogliere lingua prato muro qualunque.\nNeanche sentire potere. Qualità di rapporto insieme semplice commercio freddo. Rimanere parere pane sorgere azione.\nGreco poesia sedere dolce autore bere atteggiamento. Sud carta nostro decidere prezzo oltre durare ordinare.\nVolontà piantare produrre fronte lavoro direttore sorgere. Imporre mattino cattivo.\nPersonale significare sacrificio soltanto muovere. Magari servire allora fermo civile desiderio. Eccetera comodo lungo chiaro strada umano. Spettacolo massa troppo memoria.\nEtà soltanto azione addirittura cura accanto sorgere. Però limitare facile carne casa subito faccia. Un unico scienza esercito problema.', 1, 0),
(190, 'Elettrico brutto', 'Maestro congresso erba visita atto presidente possibile. Contento costringere felice. Marito opporre poesia affatto cosa.\nLibro qualche appena. Silenzio dare opinione espressione dirigere merito. Parere gruppo uscire giornale patria.\nOrdinare magari oggetto aumentare lira porto pace. Accorgersi giovane venire intorno luogo giudicare. Maggiore condurre massa caso pubblico internazionale. Biondo temere fronte fabbrica.', '1975-10-14', 'Francese', 'Veramente guardia prendere attore ferro. Possibile corsa processo misura frutto attento.\nPassare attuale buio perché. Pietà contadino appartenere film misura legare. Senza legare sonno principe treno paese. Stabilire o pomeriggio considerare neanche strano regno piazza.\nFuori prezzo svolgere piccolo.\nChiaro scherzare finalmente signore. Il male tra creare. Scopo passare matrimonio crisi dove bagno mare.\nOrdine giardino finestra contro pensiero. Attuale eh spalla sentire libertà semplice messa. Voglia bellezza specie tra.\nElemento industriale stare pubblico. Strano giocare attesa mondo meglio.\nNazione gioco eppure meritare possibile. Nobile ieri spettacolo costa capello poeta. Contenere fuggire carta civile servire più.\nCantare apparire medesimo facile trattare infine. Modo liberare se oppure notare. Battere cantare pietà nascondere stesso.\nDopo felice apparire padrone morte leggero scherzare. Proprio porre insegnare serio.', 1, 0),
(191, 'Seguire colpo', NULL, '1997-10-14', 'Tedesco', NULL, 1, 0),
(192, 'Vino piazza giù madre', 'Scoprire conseguenza prezzo sociale. Sereno di sapere sino.\nClasse sede straniero leggere pericolo figura. Dichiarare esame esperienza limite stato credere costa arma.\nTedesco metà avanzare come rientrare rispondere. Milione pure ottenere richiedere paese osservare discorso. Realtà bianco io forma volta sforzo vario. Via prendere insieme ricchezza.\nNo poeta riportare subito numeroso comune contrario. Qualche finestra appunto figlia. Ritrovare avanzare zio.', '2011-10-14', 'Spagnolo', NULL, 1, 0),
(193, 'Cane eccellenza intorno', NULL, '1985-10-14', 'Francese', 'Leggero nazionale popolo godere. Male braccio divenire scoprire. Giugno sicuro madre importante lotta scherzare formare.\nPreparare che disporre mantenere disposizione provvedere. Raccontare vento maggio adesso riportare. Voi finestra storico preciso.\nAnzi nascere indicare riuscire passione uno. Nobile parlare programma pubblicare malattia francese. Davvero altro occasione piantare tipo voi.\nProvvedere neanche testa presente buttare errore. Colpire giovanotto motivo atto trascinare. Presente dipendere destro domandare internazionale corrente. Rifiutare papà estero ecco sopra giallo periodo.\nRecare braccio primo essa scorrere giro accordo. Giudizio cattivo un buio reale.\nAnima produzione opera partire periodo crescere. Giorno fresco durante compagno pesare facile.\nGruppo memoria diritto dare. Piuttosto qualsiasi giustizia vincere ricco battaglia saltare. Udire importare decidere rimettere vicino aprire lotta.', 0, 0),
(194, 'Fermo caldo importanza', 'Lui piazza frase. Vento stabilire vostro sacrificio possedere badare. Verità sera tacere notevole bello dubbio succedere regione.\nPianura addirittura erba sembrare necessità. Fede sinistro avanzare punto pericoloso comunicazione giornale giocare. Quadro via divertire porta.\nErba erba venire verde. Chi felice porre. Finalmente limite palazzo organizzare risposta.\nSemplice sembrare vestire opporre carne. Centro chiesa succedere smettere ah organizzare sognare.', '2007-10-14', 'Inglese', 'Uno momento verde libro prendere. Sedere possedere fra pietra solito tavola generale.\nAbitare troppo ricordo stabilire. Tuttavia antico normale capace strada giustizia impressione sguardo. Bellezza aprire scegliere prodotto crescere uscire parola.\nCielo sedere costruire sorridere breve. Stesso attimo città portare voltare.\nGiardino là abitare tardi autore dente.\nOggi dolore assumere trarre certamente. Rifiutare oggi partito camera colpo particolare.\nCroce tutto prodotto aria. Lavoro legge espressione don tacere.\nEntrare ritorno chiave minuto preparare stella. Intendere segno riconoscere importante quarto terreno tranquillo. Aspettare ridurre destro adesso funzione memoria.\nDirettore scuola operazione romano. Opinione intero rivolgere lettera simile qualsiasi finalmente.\nGiugno matrimonio potenza.\nGià puro bisogno tutto occorrere. Straordinario spirito chiesa scoppiare gruppo permettere sicurezza brutto.', 1, 0),
(195, 'Staccare mio', 'Merito civiltà finestra leggere vecchio paese egli. Buttare vario costruire. Modo inizio partire dire.\nTratto affermare bambino unire malattia difendere. Costruzione utile fra. Eppure speciale scorrere davanti letto opporre triste smettere.\nMamma libero voltare difesa. Certamente rendere matrimonio momento intanto.\nCapace università aiuto superare. Libro stampa disporre piazza permettere perfino.\nCorrere uso serie pesare. Niente tale rapido distanza fiume dito godere.', '2003-10-14', 'Inglese', 'Abitare rivolgere opera leggere lavoro settimana però. Decisione accettare termine muovere ritornare fondo fuori. Pianta ponte lotta sociale europeo scegliere.\nMalattia vendere inoltre primo dichiarare. Freddo automobile uso. Zona sedere soluzione decidere scappare coloro.\nSpesa da lui moglie attimo scoprire allora. Guidare nord collina pensare continuare.\nAlto sino accendere epoca tempo reale.\nDifficile avere mezzo scomparire recente raccontare riguardare stanza. Sì creare sera sedere.\nAccompagnare confessare occasione procedere forse vento volere scrittore. Spegnere unico esprimere inglese problema.\nLimite imporre chiedere spesso. Procedere caldo rispetto notizia continuo politica.\nPrincipe facile città pesare visita ancora nascondere. Cattivo lì aiuto essa facile sistema cominciare.\nScappare lavoro confronto segnare. Pensiero faccia contadino fiducia distinguere.', 0, 0),
(196, 'Intanto luogo sole', 'Voglia esso compiere concetto domanda profondo qui. Estero direzione istituto difficoltà appunto pubblicare ritenere. Fresco stanza indicare metro vero.\nQuarto effetto persona.\nOggetto difendere qualcosa patria centro interno sposare arma. Interesse breve venire sperare prevedere.\nPopolo giro crescere cui. Pezzo esempio mi caldo pensare sedere prima.\nMadre zitto ne parecchio pezzo particolare. Speranza notevole procedere levare ricordare certamente. Gente serio avanti.', '1981-10-14', 'Italiano', NULL, 1, 0),
(197, 'Scrittore ospedale', 'Settimana semplice contatto badare ricevere se riferire metro. Invitare dire riferire stella tranquillo bocca giornale nave. Durante niente angolo ferire bocca pericolo.\nPaura numeroso riconoscere loro aggiungere proposta segretario. Commercio ponte articolo unire utile tirare. Dinanzi segnare roba lavorare filo sedere tranquillo.\nFuggire giardino usare passato dove caffè articolo ricevere. Parete sopra punta.', '2024-10-14', 'Francese', 'Strano fame cristiano gridare straordinario. Giungere moderno lui pranzo spalla vero disporre caro. Soprattutto folla mese aiutare titolo questo lavoro. Fuori pronto lanciare lui appena rapporto rispondere.\nStudio labbro considerare cercare. Colpa baciare mangiare parete chi. Imparare rimanere gioco escludere medico coraggio risolvere. Colpo immagine neanche nostro.\nContrario presente grazie. Attimo lei lago spirito molto.\nComunque attraversare addirittura solo appartenere. Ferire o stabilire riferire presto cultura descrivere. Proprio ne sostenere dunque intenzione accorgersi scena.\nMese pace quarto buono giardino automobile riconoscere. Fortuna solito correre giardino godere.\nParere basso dividere congresso idea.\nFermo volto stamattina parlare contare smettere. Piede affermare peccato naturalmente bravo.\nIntenzione quello nave uccidere foglia riunire si. Peggio molto natura. Vestire congresso pubblicare fratello abbandonare periodo.', 0, 0),
(198, 'Difficile spiegare presso albergo', 'Cambiare diventare osservare spesa potere fatica sinistro. Contenere profondo sbagliare fratello personale piuttosto bravo meno. Storico pietà estremo giovane esprimere nulla.\nAggiungere estremo a occasione organizzare spiegare. Pazzo possibile destro strada appunto principio rappresentare tuttavia. Eppure ragazzo dimostrare mi risposta.\nDare villa operaio ministro teatro ci. Sembrare risposta mestiere attorno. Accompagnare regno ponte tipo maniera russo certo.', '1980-10-14', 'Tedesco', NULL, 1, 0),
(199, 'Carattere settimana muovere forza voltare', 'Qualcuno privato o nascondere puro. Piano prima sì quello celebrare presenza chiave chiaro. Meritare senza stella eccetera molto.\nEsso uscire sì nuovo capitare interno. Fumare domani attento posto. Odore notevole mercato.\nProdotto sapere interessante piazza richiedere bocca. Mondo visita giovanotto ieri parola abito. Pubblico infatti roba famoso zitto latte giovane.', '1978-10-14', 'Italiano', NULL, 0, 0),
(200, 'Mi qualcosa rientrare regno', NULL, '1992-10-14', 'Italiano', 'Fuori comunicazione accanto sguardo. Riconoscere proposta titolo volgere vasto essa albergo.\nCentro limitare nulla essere imporre zitto. Mattino fornire ricchezza scena numeroso ferro. Montagna morale offrire spalla vicino specie lavorare.\nScomparire sangue coraggio continuare diverso mezzo. Lettera coscienza primo superiore sì bestia. Liberare prendere salutare parola genere lingua.\nImprovviso erba importante sentimento ah studiare costruzione. Oggetto più contatto osservare.\nCiò contenere occorrere appunto comunicazione vestire disposizione. Rompere bruciare prato carattere. Bestia riferire naturale film.\nIl isola nudo paese camera trarre. Perciò affermare spalla prevedere pianta. Attendere sorriso già mi bosco però.\nZona mese di insomma raccontare. Crescere animale cui.\nTedesco basso minuto. Veramente commercio consentire merito.\nGreco raccontare piacere musica seguire epoca. Animale vivo campagna concedere fondo.', 1, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `customer`
--

INSERT INTO `customer` (`CustomerID`, `UserID`, `IsDeleted`) VALUES
(1, 21, 0),
(2, 22, 0),
(3, 23, 0),
(4, 24, 0),
(5, 25, 0),
(6, 26, 0),
(7, 27, 0),
(8, 28, 0),
(9, 29, 0),
(10, 30, 0),
(11, 31, 0),
(12, 32, 0),
(13, 33, 0),
(14, 34, 0),
(15, 35, 0),
(16, 36, 0),
(17, 37, 0),
(18, 38, 0),
(19, 39, 0),
(20, 40, 0),
(21, 41, 0),
(22, 42, 0),
(23, 43, 0),
(24, 44, 0),
(25, 45, 0),
(26, 46, 0),
(27, 47, 0),
(28, 48, 0),
(29, 49, 0),
(30, 50, 0),
(31, 51, 0),
(32, 52, 0),
(33, 53, 0),
(34, 54, 0),
(35, 55, 0),
(36, 56, 0),
(37, 57, 0),
(38, 58, 0),
(39, 59, 0),
(40, 60, 0),
(41, 61, 0),
(42, 62, 0),
(43, 63, 0),
(44, 64, 0),
(45, 65, 0),
(46, 66, 0),
(47, 67, 0),
(48, 68, 0),
(49, 69, 0),
(50, 70, 0),
(51, 71, 0),
(52, 72, 0),
(53, 73, 0),
(54, 74, 0),
(55, 75, 0),
(56, 76, 0),
(57, 77, 0),
(58, 78, 0),
(59, 79, 0),
(60, 80, 0),
(61, 81, 0),
(62, 82, 0),
(63, 83, 0),
(64, 84, 0),
(65, 85, 0),
(66, 86, 0),
(67, 87, 0),
(68, 88, 0),
(69, 89, 0),
(70, 90, 0),
(71, 91, 0),
(72, 92, 0),
(73, 93, 0),
(74, 94, 0),
(75, 95, 0),
(76, 96, 0),
(77, 97, 0),
(78, 98, 0),
(79, 99, 0),
(80, 100, 0),
(81, 101, 0),
(82, 102, 0),
(83, 103, 0),
(84, 104, 0),
(85, 105, 0),
(86, 106, 0),
(87, 107, 0),
(88, 108, 0),
(89, 109, 0),
(90, 110, 0),
(91, 111, 0),
(92, 112, 0),
(93, 113, 0),
(94, 114, 0),
(95, 115, 0),
(96, 116, 0),
(97, 117, 0),
(98, 118, 0),
(99, 119, 0),
(100, 120, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `employee`
--

CREATE TABLE `employee` (
  `EmployeeID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `Birth` date DEFAULT NULL,
  `TypeOfContract` varchar(50) DEFAULT NULL,
  `StartDate` date NOT NULL,
  `TerminationDate` date DEFAULT NULL,
  `WorkHour` int(11) DEFAULT NULL,
  `ExtraHour` int(11) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `employee`
--

INSERT INTO `employee` (`EmployeeID`, `UserID`, `Birth`, `TypeOfContract`, `StartDate`, `TerminationDate`, `WorkHour`, `ExtraHour`, `IsDeleted`) VALUES
(1, 1, '1981-10-14', 'Part-time', '2021-10-14', NULL, 40, 6, 0),
(2, 2, '1977-10-14', 'Full-time', '2022-10-14', NULL, 30, NULL, 0),
(3, 3, '1988-10-14', 'Part-time', '2018-10-14', NULL, 30, NULL, 0),
(4, 4, '1960-10-14', 'Part-time', '2015-10-14', '2018-06-14', 40, NULL, 0),
(5, 5, '1976-10-14', 'Tempo determinato', '2021-10-14', NULL, 35, 9, 0),
(6, 6, '1972-10-14', 'Tempo indeterminato', '2021-10-14', NULL, 35, NULL, 0),
(7, 7, '1966-10-14', 'Tempo determinato', '2017-10-14', '2019-12-14', 30, 5, 0),
(8, 8, '1994-10-14', 'Part-time', '2017-10-14', NULL, 35, 3, 0),
(9, 9, '1998-10-14', 'Tempo determinato', '2021-10-14', NULL, 20, NULL, 0),
(10, 10, '1990-10-14', 'Tempo indeterminato', '2022-10-14', NULL, 35, NULL, 0),
(11, 11, '1968-10-14', 'Tempo indeterminato', '2020-10-14', '2023-07-14', 30, NULL, 0),
(12, 12, '2000-10-14', 'Full-time', '2020-10-14', NULL, 20, 5, 0),
(13, 13, '1993-10-14', 'Tempo indeterminato', '2022-10-14', '2024-12-14', 30, NULL, 0),
(14, 14, '1989-10-14', 'Tempo indeterminato', '2023-10-14', NULL, 30, 5, 0),
(15, 15, '2000-10-14', 'Tempo determinato', '2022-10-14', NULL, 30, NULL, 0),
(16, 16, '1968-10-14', 'Part-time', '2020-10-14', NULL, 20, NULL, 0),
(17, 17, '1992-10-14', 'Tempo indeterminato', '2015-10-14', '2019-05-14', 40, 2, 0),
(18, 18, '1980-10-14', 'Tempo indeterminato', '2022-10-14', NULL, 35, 8, 0),
(19, 19, '2000-10-14', 'Full-time', '2021-10-14', NULL, 40, NULL, 0),
(20, 20, '1969-10-14', 'Tempo indeterminato', '2024-10-14', NULL, 40, NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `rental`
--

CREATE TABLE `rental` (
  `RentalID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `TerminationDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `rental`
--

INSERT INTO `rental` (`RentalID`, `EmployeeID`, `CustomerID`, `StartDate`, `TerminationDate`) VALUES
(1, 7, 27, '2025-09-10', NULL),
(2, 4, 36, '2025-01-08', '2025-02-06'),
(3, 1, 39, '2025-08-26', '2025-10-06'),
(4, 13, 1, '2025-07-01', NULL),
(5, 13, 60, '2025-03-09', NULL),
(6, 12, 13, '2025-09-28', '2025-11-05'),
(7, 20, 1, '2025-08-09', '2025-09-15'),
(8, 7, 61, '2025-05-16', '2025-06-06'),
(9, 14, 99, '2025-01-04', '2025-02-03'),
(10, 9, 40, '2025-08-08', '2025-09-09'),
(11, 16, 29, '2024-11-03', '2024-12-08'),
(12, 19, 11, '2025-09-26', '2025-11-02'),
(13, 3, 27, '2025-09-26', '2025-10-08'),
(14, 10, 41, '2025-01-20', '2025-02-15'),
(15, 19, 5, '2025-02-12', '2025-03-07'),
(16, 12, 42, '2025-04-14', NULL),
(17, 14, 98, '2024-11-09', '2024-12-09'),
(18, 15, 79, '2025-05-06', '2025-05-23'),
(19, 17, 88, '2025-03-20', NULL),
(20, 19, 68, '2025-04-15', NULL),
(21, 13, 52, '2025-03-28', '2025-04-15'),
(22, 13, 45, '2025-03-28', '2025-05-04'),
(23, 9, 73, '2024-12-16', '2025-01-04'),
(24, 19, 73, '2025-07-19', '2025-08-23'),
(25, 1, 18, '2025-03-03', NULL),
(26, 6, 8, '2025-02-06', '2025-02-17'),
(27, 9, 8, '2025-06-24', '2025-07-27'),
(28, 3, 97, '2024-12-08', '2025-01-22'),
(29, 18, 70, '2025-01-31', '2025-02-23'),
(30, 17, 47, '2025-07-15', NULL),
(31, 11, 36, '2025-05-03', '2025-06-15'),
(32, 12, 43, '2025-01-16', NULL),
(33, 19, 70, '2025-09-26', '2025-10-18'),
(34, 18, 57, '2025-09-25', '2025-10-25'),
(35, 5, 33, '2025-08-12', '2025-09-05'),
(36, 10, 60, '2025-05-27', '2025-07-04'),
(37, 1, 77, '2025-05-13', NULL),
(38, 13, 5, '2025-06-10', '2025-07-23'),
(39, 12, 50, '2025-01-28', '2025-03-02'),
(40, 6, 49, '2024-12-01', '2024-12-28'),
(41, 10, 13, '2025-08-28', '2025-09-07'),
(42, 16, 42, '2025-01-22', '2025-02-04'),
(43, 10, 43, '2024-12-30', NULL),
(44, 19, 22, '2025-06-18', '2025-07-26'),
(45, 17, 76, '2024-12-09', '2025-01-11'),
(46, 3, 68, '2025-08-04', '2025-08-12'),
(47, 9, 2, '2025-05-23', NULL),
(48, 2, 100, '2025-02-06', NULL),
(49, 5, 66, '2025-04-17', '2025-05-21'),
(50, 10, 25, '2025-07-20', NULL),
(51, 14, 73, '2025-05-28', '2025-06-27'),
(52, 15, 65, '2025-04-18', NULL),
(53, 3, 21, '2025-05-27', '2025-06-07'),
(54, 2, 41, '2025-05-22', NULL),
(55, 5, 25, '2025-05-08', NULL),
(56, 16, 3, '2025-03-08', '2025-04-21'),
(57, 19, 87, '2025-04-16', '2025-05-14'),
(58, 5, 97, '2025-01-19', NULL),
(59, 13, 80, '2024-11-16', NULL),
(60, 19, 29, '2024-11-03', '2024-12-18'),
(61, 13, 83, '2025-06-24', '2025-07-24'),
(62, 8, 46, '2025-10-06', '2025-11-13'),
(63, 9, 22, '2025-10-08', NULL),
(64, 5, 6, '2025-07-15', '2025-08-25'),
(65, 8, 33, '2025-02-26', '2025-03-25'),
(66, 20, 40, '2024-10-24', '2024-12-03'),
(67, 17, 36, '2025-02-15', '2025-03-11'),
(68, 3, 6, '2025-02-12', NULL),
(69, 13, 83, '2025-08-28', '2025-09-24'),
(70, 11, 67, '2025-03-06', '2025-03-19'),
(71, 10, 82, '2025-02-26', NULL),
(72, 7, 73, '2025-01-05', '2025-02-03'),
(73, 15, 6, '2025-03-20', '2025-05-03'),
(74, 7, 78, '2025-08-15', '2025-09-13'),
(75, 1, 54, '2025-09-06', '2025-09-23'),
(76, 2, 40, '2025-01-06', '2025-02-20'),
(77, 11, 66, '2025-06-19', '2025-07-31'),
(78, 14, 52, '2025-03-28', '2025-04-15'),
(79, 6, 76, '2025-08-06', '2025-08-30'),
(80, 5, 24, '2025-02-02', '2025-02-26'),
(81, 16, 88, '2025-08-09', '2025-08-16'),
(82, 9, 71, '2025-08-23', '2025-09-08'),
(83, 7, 57, '2025-07-29', '2025-09-09'),
(84, 11, 42, '2025-03-20', '2025-04-13'),
(85, 11, 53, '2025-07-02', NULL),
(86, 1, 92, '2024-10-24', '2024-11-01'),
(87, 8, 17, '2025-01-31', '2025-03-06'),
(88, 9, 40, '2025-02-26', '2025-03-20'),
(89, 2, 63, '2025-01-16', '2025-01-26'),
(90, 8, 70, '2024-11-19', '2024-12-13'),
(91, 3, 6, '2025-03-26', '2025-04-18'),
(92, 19, 97, '2025-05-03', '2025-05-25'),
(93, 12, 9, '2025-09-06', '2025-09-16'),
(94, 8, 30, '2025-06-15', '2025-07-22'),
(95, 11, 3, '2025-05-20', '2025-06-04'),
(96, 14, 37, '2024-12-04', NULL),
(97, 6, 31, '2024-12-23', '2025-01-16'),
(98, 9, 16, '2025-06-17', NULL),
(99, 10, 59, '2025-07-23', NULL),
(100, 4, 72, '2025-07-30', '2025-08-06'),
(101, 12, 24, '2025-06-23', NULL),
(102, 20, 55, '2025-02-06', '2025-03-14'),
(103, 12, 47, '2025-04-16', '2025-04-27'),
(104, 15, 87, '2024-11-10', '2024-12-08'),
(105, 20, 99, '2025-03-30', NULL),
(106, 19, 49, '2025-04-07', '2025-05-17'),
(107, 3, 76, '2025-02-03', NULL),
(108, 6, 27, '2025-02-05', NULL),
(109, 11, 71, '2025-10-04', '2025-10-21'),
(110, 6, 40, '2025-03-15', NULL),
(111, 18, 91, '2025-08-19', '2025-09-11'),
(112, 7, 9, '2025-02-12', '2025-02-25'),
(113, 1, 92, '2025-06-25', '2025-07-27'),
(114, 8, 99, '2025-03-28', NULL),
(115, 2, 32, '2025-06-05', NULL),
(116, 7, 66, '2025-01-18', '2025-02-21'),
(117, 10, 64, '2024-11-29', '2024-12-12'),
(118, 17, 81, '2024-12-31', '2025-02-02'),
(119, 20, 51, '2025-07-04', NULL),
(120, 15, 36, '2024-11-18', NULL),
(121, 15, 86, '2025-01-30', '2025-02-21'),
(122, 16, 52, '2025-02-07', '2025-03-18'),
(123, 1, 78, '2024-12-23', NULL),
(124, 11, 86, '2024-10-16', '2024-10-25'),
(125, 6, 53, '2025-10-07', '2025-11-02'),
(126, 13, 31, '2025-06-11', '2025-07-18'),
(127, 14, 76, '2025-03-18', NULL),
(128, 6, 83, '2025-03-10', '2025-04-10'),
(129, 11, 88, '2025-04-11', '2025-05-02'),
(130, 15, 51, '2024-11-19', '2024-12-09'),
(131, 10, 17, '2025-08-06', '2025-09-05'),
(132, 8, 39, '2025-01-28', '2025-02-17'),
(133, 11, 53, '2025-07-05', '2025-07-29'),
(134, 17, 79, '2025-01-17', '2025-02-19'),
(135, 12, 27, '2025-07-04', '2025-07-23'),
(136, 7, 80, '2024-10-20', NULL),
(137, 20, 62, '2024-12-13', '2025-01-10'),
(138, 1, 99, '2025-02-23', NULL),
(139, 12, 45, '2025-09-12', '2025-10-24'),
(140, 10, 74, '2025-02-27', NULL),
(141, 9, 12, '2025-03-25', '2025-05-07'),
(142, 2, 67, '2025-03-21', '2025-04-24'),
(143, 1, 66, '2024-10-22', NULL),
(144, 19, 44, '2024-12-26', NULL),
(145, 16, 97, '2025-04-14', '2025-05-01'),
(146, 10, 78, '2025-03-26', '2025-04-08'),
(147, 10, 4, '2025-03-28', '2025-04-27'),
(148, 11, 96, '2025-03-14', '2025-04-17'),
(149, 12, 20, '2025-03-26', '2025-04-21'),
(150, 13, 39, '2025-05-04', '2025-06-12');

-- --------------------------------------------------------

--
-- Struttura della tabella `rentaldetail`
--

CREATE TABLE `rentaldetail` (
  `RentalDetailID` int(11) NOT NULL,
  `RentalID` int(11) DEFAULT NULL,
  `BookID` int(11) NOT NULL,
  `QuantityOfBook` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `rentaldetail`
--

INSERT INTO `rentaldetail` (`RentalDetailID`, `RentalID`, `BookID`, `QuantityOfBook`) VALUES
(1, 1, 170, 2),
(2, 2, 184, 2),
(3, 3, 112, 1),
(4, 4, 230, 1),
(5, 5, 102, 3),
(6, 6, 179, 1),
(7, 7, 158, 3),
(8, 8, 89, 2),
(9, 9, 200, 1),
(10, 10, 110, 3),
(11, 11, 173, 3),
(12, 12, 20, 1),
(13, 13, 29, 3),
(14, 14, 126, 1),
(15, 15, 190, 2),
(16, 16, 100, 1),
(17, 17, 111, 3),
(18, 18, 97, 2),
(19, 19, 209, 2),
(20, 20, 145, 1),
(21, 21, 74, 3),
(22, 22, 204, 2),
(23, 23, 226, 2),
(24, 24, 226, 3),
(25, 25, 234, 2),
(26, 26, 237, 3),
(27, 27, 78, 3),
(28, 28, 237, 3),
(29, 29, 59, 2),
(30, 30, 229, 3),
(31, 31, 134, 1),
(32, 32, 243, 1),
(33, 33, 142, 3),
(34, 34, 169, 2),
(35, 35, 106, 2),
(36, 36, 245, 2),
(37, 37, 19, 1),
(38, 38, 169, 2),
(39, 39, 163, 2),
(40, 40, 79, 3),
(41, 41, 213, 3),
(42, 42, 79, 2),
(43, 43, 239, 1),
(44, 44, 211, 3),
(45, 45, 132, 2),
(46, 46, 173, 1),
(47, 47, 221, 1),
(48, 48, 54, 2),
(49, 49, 153, 1),
(50, 50, 112, 2),
(51, 51, 94, 3),
(52, 52, 60, 2),
(53, 53, 211, 3),
(54, 54, 7, 2),
(55, 55, 195, 1),
(56, 56, 220, 1),
(57, 57, 150, 2),
(58, 58, 72, 2),
(59, 59, 151, 3),
(60, 60, 49, 3),
(61, 61, 133, 1),
(62, 62, 114, 3),
(63, 63, 102, 2),
(64, 64, 126, 2),
(65, 65, 85, 1),
(66, 66, 184, 1),
(67, 67, 65, 2),
(68, 68, 67, 3),
(69, 69, 208, 2),
(70, 70, 138, 1),
(71, 71, 188, 1),
(72, 72, 168, 2),
(73, 73, 214, 2),
(74, 74, 80, 1),
(75, 75, 99, 1),
(76, 76, 12, 2),
(77, 77, 129, 2),
(78, 78, 177, 1),
(79, 79, 157, 3),
(80, 80, 79, 2),
(81, 81, 209, 3),
(82, 82, 35, 1),
(83, 83, 206, 3),
(84, 84, 36, 3),
(85, 85, 48, 1),
(86, 86, 55, 3),
(87, 87, 80, 3),
(88, 88, 210, 2),
(89, 89, 224, 1),
(90, 90, 178, 1),
(91, 91, 148, 2),
(92, 92, 55, 1),
(93, 93, 172, 2),
(94, 94, 244, 1),
(95, 95, 130, 1),
(96, 96, 245, 3),
(97, 97, 49, 1),
(98, 98, 213, 2),
(99, 99, 240, 1),
(100, 100, 37, 1),
(101, 101, 16, 2),
(102, 102, 101, 1),
(103, 103, 186, 3),
(104, 104, 250, 1),
(105, 105, 37, 3),
(106, 106, 201, 2),
(107, 107, 9, 3),
(108, 108, 35, 2),
(109, 109, 83, 2),
(110, 110, 158, 3),
(111, 111, 53, 1),
(112, 112, 94, 2),
(113, 113, 236, 1),
(114, 114, 11, 2),
(115, 115, 179, 2),
(116, 116, 159, 3),
(117, 117, 141, 2),
(118, 118, 92, 3),
(119, 119, 69, 1),
(120, 120, 63, 1),
(121, 121, 4, 1),
(122, 122, 191, 1),
(123, 123, 124, 2),
(124, 124, 80, 3),
(125, 125, 95, 2),
(126, 126, 214, 1),
(127, 127, 130, 3),
(128, 128, 206, 2),
(129, 129, 45, 1),
(130, 130, 123, 2),
(131, 131, 120, 3),
(132, 132, 20, 2),
(133, 133, 164, 2),
(134, 134, 66, 1),
(135, 135, 109, 2),
(136, 136, 192, 1),
(137, 137, 137, 2),
(138, 138, 219, 2),
(139, 139, 64, 2),
(140, 140, 172, 3),
(141, 141, 158, 2),
(142, 142, 12, 1),
(143, 143, 87, 3),
(144, 144, 225, 1),
(145, 145, 176, 1),
(146, 146, 126, 1),
(147, 147, 104, 3),
(148, 148, 126, 3),
(149, 149, 242, 2),
(150, 150, 38, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `review`
--

CREATE TABLE `review` (
  `ReviewID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Message` varchar(500) DEFAULT NULL,
  `CreationDate` date NOT NULL,
  `UpdationDate` date DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `review`
--

INSERT INTO `review` (`ReviewID`, `CustomerID`, `Rating`, `Message`, `CreationDate`, `UpdationDate`, `IsDeleted`) VALUES
(1, 9, 2, 'Figlio orecchio guerra stasera.\nProdotto lasciare credere preoccupare. Né origine concludere invece lì. Opera rosso tornare ritorno condurre trattare.\nPadre affatto riuscire fortuna cristiano sorella pagare. Dunque produzione filo lì sostenere. Risultare credere risultare avvicinare campo.\nOdore mandare sacrificio nazione eppure dirigere figlia. Sereno sviluppo sognare lato colpo rendere subito. Buio vendere ammazzare chi cui facile mare.', '2024-10-14', NULL, 0),
(2, 19, 3, 'Orecchio addosso comune famiglia. Guerra fuggire assicurare politica poeta.\nLei rivoluzione spirito tedesco stasera. Sera anno parecchio linea. Servire correre cielo risultare sede giorno.\nCoscienza sottile dietro assumere sbagliare giorno. Lì puro dinanzi oltre. Tu trovare sede fantasia grosso li verde.\nPianura carne capello caratteristico scusare svegliare visita. Decidere riguardare vasto gusto però paese risolvere decidere.', '2024-07-14', NULL, 0),
(3, 99, 1, 'Per fortuna tono insistere gamba diffondere foglia. Vasto comune centrale naturale privato perdere.\nContrario colpa sorella segretario. Rimettere grigio noi naturale buono. Ammazzare calcio impedire lungo denaro porta.\nMotivo operazione speciale contadino. Stato discutere assistere messa. Cielo scrittore pomeriggio esistere. Ospedale ciò comprare carattere porto collo.\nBambino albergo vivere. Crisi comodo vedere campo.', '2024-08-14', '2024-09-02', 0),
(4, 32, 5, 'Perfetto nave già rispondere. Ricerca attesa tratto interessare addirittura bianco nero.\nPapà pubblico lontano rientrare. Carta abbastanza eccetera colore.\nSenza bianco rimanere autore pubblico infatti stanco passato. Notare sentimento vivo proposta.\nAndare francese uno ricco fede il diverso.\nAmbiente qualcosa morte concetto poesia innamorare nessuno. Ciò riferire gridare voi musica attimo estendere pubblicare.\nAppoggiare silenzio dare. Giorno fresco sera linea.', '2025-01-14', '2025-01-30', 0),
(5, 12, 3, 'Dirigere si carne foglia tavola dietro. Poesia avvocato poiché gusto qua proposito. Tavolo punta invece industriale. Pena lato scrivere lui piano generale.\nStasera signorina armare relazione. Compagnia fondo un.\nMercato causa finestra internazionale evitare più. Dentro lui albergo passione tedesco ragazzo. Comunicazione musica stagione aggiungere prodotto silenzio lago.\nScopo come religioso difesa insegnare. Elevare gusto sedere congresso.', '2025-01-14', '2025-01-23', 0),
(6, 12, 3, 'Soluzione quadro centro rientrare usare cucina. Porre ridurre riferire seguire. Consentire direzione naturale anima bene articolo.\nOdore felice bestia qualcosa età pianta ritrovare. Nome sperare addosso no compagnia mangiare profondo. Ritrovare presentare elettrico oppure brutto ognuno concludere greco.\nAddosso persona nulla aria noi pomeriggio. Mattina cioè riempire fortuna.', '2025-08-14', NULL, 0),
(7, 91, 4, 'Tanto lato rifiutare commercio causa notevole fiducia. Metà prima figurare muovere scendere territorio.\nTagliare pronto giungere giocare orecchio. Peso mestiere malattia pezzo fiume decidere. Medesimo frutto distinguere conservare solo. Vita passato sentire presso colpo fuori coloro.\nAtteggiamento fenomeno molto giorno spesso. Errore dividere folla opinione straordinario cadere però. Estate studio preparare periodo cristiano pace.', '2024-06-14', NULL, 0),
(8, 1, 5, 'Salire tentare addirittura nuovo. Contrario spiegare intenzione significare cattolico. Serie noto con divertire mano famiglia animale bestia.\nCercare provvedere cioè lì frutto confessare attaccare impedire. Insegnare leggero scala rimettere professore assumere conservare. Zitto staccare attesa giro.\nAzione dovere letto riva fermo. Testa leggero rivoluzione partecipare concedere rendere. Pianura credere vostro affrontare.', '2025-09-14', NULL, 0),
(9, 43, 2, 'Accompagnare film via frase movimento eccellenza. Solo pregare vivo ritrovare. Merito né commissione fiume metà.\nEscludere giocare ricordare niente. Movimento sorella finché.\nMese perché pianura ripetere. Neppure insegnare qualcosa libro.\nCui lei sapere staccare. Liberare parte non. Circa ordinare sud stare.\nStato figlia entrare milione letto. Dolce dito bambina sopra. Comunque lira salutare temere attaccare ognuno industriale.', '2025-06-14', NULL, 0),
(10, 76, 2, NULL, '2024-08-14', NULL, 0),
(11, 65, 3, 'Ricchezza tedesco ecco uguale sedere denaro mio. Eppure strano alzare ne qualità quasi posare. Avvenire labbro buio pericoloso ascoltare intendere probabilmente.\nSviluppo camminare cielo eccetera sistema domani uguale. Infatti lato trarre sede. Promettere libertà vicino tipo.\nLinea palazzo fatto parete chi cultura professore. Spettacolo amore arrestare leggere.\nCreare spesa mangiare. Sistema dovere segretario rimanere partire partito fuori.', '2024-06-14', NULL, 0),
(12, 55, 2, 'Accordo guidare spiegare basso se produzione ritorno. Signora lira salvare.\nSerie sposare quarto serio. Limitare popolo grado rappresentare.\nNaturale italiano coloro stesso lira sangue. Pazzo intanto risposta vista.\nStraniero prendere visita campagna alzare mese maggio. Caldo linea questione limitare ammazzare rapporto liberare. Oh preparare solito libero.\nZitto mio bravo seguire medico messa vista guidare. Peccato resto avere.', '2024-07-14', '2024-07-26', 0),
(13, 35, 5, NULL, '2025-06-14', NULL, 0),
(14, 59, 1, 'Comprare già prevedere muro comunque monte imporre notizia.\nPossibilità segnare luogo seguire segno zitto. Avanti articolo subito esercito. Lo perfino notizia costituire dirigere.\nFissare maggiore preoccupare. Cominciare film il costituire accorgersi nord numeroso.\nTerritorio forma attimo. Movimento successo passare attuale piuttosto permettere pagare. Mente appartenere insomma distruggere padrone ufficiale cultura effetto.', '2025-06-14', NULL, 0),
(15, 62, 5, 'Intenzione decisione giornale pietà. Pubblicare conoscenza duro presentare sino.\nZio tecnico vicino bocca eccellenza sotto.\nFiglia fissare saltare. Mano dolore pomeriggio attimo orecchio ricchezza ricordare.\nVedere chiamare finire aspettare attenzione pregare. Scrivere medesimo inverno possedere vivere. Vincere assai necessario stamattina distinguere fino.\nAbito poco classe calcio confessare che. Nero occorrere migliore. Donna forse filo.', '2024-09-14', NULL, 0),
(16, 14, 5, NULL, '2025-08-14', NULL, 0),
(17, 30, 3, NULL, '2025-03-14', NULL, 0),
(18, 13, 4, 'Esperienza ordine sociale oltre noi. Nulla arma grazie sì ancora domani. Dopo effetto erba valle speranza.\nGiugno diverso cortile paese tale. Dinanzi accogliere villa come argomento.\nParecchio rientrare risposta quasi maggio. Linea umano gioco qualunque colpo. Cominciare problema insistere onore spalla.\nNotevole niente opera contadino invece tardi. Presentare crisi volgere. Civiltà pranzo prato fino allora.', '2024-07-14', NULL, 0),
(19, 16, 4, 'Collina servire partecipare viaggio portare stampa differenza. Compagnia porta preoccupare ammettere abbandonare morte cuore.\nRaccogliere fede materia inglese istituto. Cucina unire risposta direzione matrimonio. Notevole continuare risposta oppure preciso.\nVeramente esperienza moglie poiché camminare necessità determinare. Cattivo divertire atteggiamento concetto concedere successo togliere. Costituire vasto cioè qualunque pezzo.', '2024-04-14', NULL, 0),
(20, 73, 5, 'Concludere vasto elemento casa desiderare nazionale. Trovare matrimonio personale osservare crisi.\nSoltanto ricordare aiuto stato affatto. Utile zitto insistere dente impressione davvero.\nCoprire risposta allontanare ferro dolore storia. Tardi stanza assicurare liberare confronto.\nFacile oggetto esempio interessante. Partire territorio bestia speciale fatica rifiutare svegliare.\nParete muro attività. Interno concetto cavallo uccidere cultura. Scusare oro finché libertà carattere.', '2024-06-14', NULL, 0),
(21, 14, 3, NULL, '2024-06-14', NULL, 0),
(22, 3, 4, NULL, '2025-07-14', '2025-08-07', 0),
(23, 80, 1, 'Ordinare fretta dottore valore dente breve argomento.\nProssimo giro pietà direttore partire messa oramai. Fine guidare neppure poiché stamattina. Notte ragazza mostrare vero.\nPotere impossibile gioco suo tentare fumare. Cristiano secolo riguardare accorgersi attuale. Signorina abbastanza mantenere chilometro don escludere sì.\nSenso via compagno distinguere. Personaggio sinistro funzione rifiutare nuovo passione inverno. Pianta battere sicurezza dividere fatto quale.', '2024-11-14', NULL, 0),
(24, 39, 5, NULL, '2025-05-14', NULL, 0),
(25, 86, 3, 'Occhio azzurro oramai salvare esprimere lago almeno. Cattolico nord dottore.\nSpesa braccio storico repubblica interessare. Nazione metro film tempo condizione.\nZia addirittura automobile caffè. Avvertire questo giro che accordo assumere. Entro gettare contenere. Presenza davvero dire guerra nome umano.\nFronte regno lei cavallo popolazione. Sorprendere milione bere.\nMovimento staccare naturale intenzione ricevere repubblica. Serie annunciare nascondere triste latte professore.', '2025-05-14', '2025-06-02', 0),
(26, 41, 5, 'Su ordinare conservare loro dopo stupido coloro caffè. Godere mano ah tra meno.\nBadare tuo professore qualcuno attento bocca che. Settimana storia attendere cultura.\nEsistere colore discutere bravo programma colpa.\nPaura dovere guerra conto quindi. Lettera raccogliere allontanare americano piazza. Bocca egli grazie direttore difesa territorio notte regno.\nBere attendere coprire dentro oggetto occorrere. Abitare istituto per lato dirigere contatto affatto.', '2024-06-14', '2024-06-19', 0),
(27, 74, 3, 'Gridare necessario anzi ponte attimo patria sino basso. Scoppiare pazzo scusare errore.\nRappresentare aprire dormire padre. Segreto avvertire esempio vicino giustizia. Sedere veramente misura dolore.\nDirettore gruppo pagina davanti musica scappare. Fra distanza esporre.\nServizio settimana rientrare normale mangiare orecchio. Bello piantare anzi uccidere fine scegliere.\nInoltre dopo annunciare.', '2025-01-14', '2025-01-18', 0),
(28, 67, 3, 'Seguire voce ordine nudo numeroso quale essere. Papà infatti ministro essere peccato errore strada raccontare. Comporre arma prezzo popolazione.\nScusare segreto capace principe tentare verso.\nLavorare o impedire numero migliore. Passato nascere spalla aspetto morte. Sorella faccia vivo scusare uguale.\nPronto maggio intero tutto. Discorso montagna palazzo futuro libertà ognuno moglie.\nDimenticare collina fretta sorgere mandare. Peso ritenere bene giovanotto ridurre smettere.', '2024-04-14', NULL, 0),
(29, 15, 5, 'Scoprire ombra vasto sedere riprendere italiano. Diritto famoso carta nome costruzione francese persona. Momento addirittura nascere enorme noto loro infine.\nForma interesse muovere parlare fuori. Scoppiare determinare sede notte diretto.\nCivile operaio baciare qualità libertà. Convincere domani produrre estero.\nStudiare folla bianco insomma levare fiume. Epoca zitto generale congresso incontrare tedesco scendere. Insieme calcio pace libro strano ancora dedicare.', '2025-01-14', '2025-02-02', 0),
(30, 7, 1, 'Letto fretta uomo caro. Mamma scendere nome eccetera seguire conoscenza.\nSopra pomeriggio pace brutto. Ragione situazione rivolgere spazio nemmeno. Dimostrare valere controllo dove normale o.\nCompagno conto naturalmente giustizia dietro istante perfino. Gioco giovanotto fondare labbro mestiere ricerca automobile semplice.\nOrigine atto presenza decisione. Preferire vestire sentimento avvenire.', '2024-04-14', '2024-04-29', 0),
(31, 46, 3, 'Autore primo aprire. Eh atteggiamento sala. Segnare leggere gioco morale.\nDestino lettera addosso principe ecco merito evitare. Pesare chilometro montagna minimo desiderare più. Stupido neppure sedere oggi peso aumentare cercare. Film distinguere direttore motivo eh.\nRipetere finestra cavallo attenzione terzo sereno. Riferire svolgere mattina ponte anche.\nDa raggiungere gettare madre direzione camminare piacere popolazione. Pieno ogni lei raccogliere meno opinione. Mente frase motivo.', '2024-07-14', NULL, 0),
(32, 100, 1, NULL, '2024-06-14', '2024-06-23', 0),
(33, 91, 3, 'Presentare popolo invece energia strada porto. Greco finalmente università linea. Levare venire decidere ciò egli andare no.\nRoba svolgere stamattina ricerca ieri preoccupare rispondere. E fra controllo politica momento eccellenza ferro. Preparare fermo trascinare testa tranquillo spingere abbastanza.\nSimile arrivare interessare signore osservare. Ci parere sguardo bene vestire consiglio. Enorme cambiare giornale importare guardia. Lui ecco gesto tenere circa.', '2024-12-14', NULL, 0),
(34, 74, 5, NULL, '2024-06-14', NULL, 0),
(35, 34, 4, 'Qualche settimana pensare ieri quanto udire. Territorio cavallo rivedere cavallo.\nRapporto tardi importante aspettare sinistro qualcuno valere sposare. Desiderio ricerca risolvere niente. Ricevere buttare lasciare sforzo.\nMisura giornale piacere bravo tra essere. Parete pieno lotta. Chiave forte morale zio motivo maestro effetto.\nRitornare grigio concludere. Attraversare particolare ammazzare compiere volare scusare.\nLabbro problema esame lui noto monte.', '2024-04-14', NULL, 0),
(36, 1, 2, NULL, '2025-02-14', NULL, 0),
(37, 47, 3, 'Pronto ridere baciare numero labbro. Come riferire vista medico. Luogo assoluto dinanzi formare andare.\nGiorno letto insomma formare nudo. Primo oh età scendere.\nLimitare ritrovare capace relazione stamattina lotta. Largo sorridere giornata rivoluzione grave. Guardare verde coscienza colore cercare.\nAppoggiare figlia mostrare abbastanza dormire ognuno tipo. Signorina sembrare battaglia ombra sorridere tanto aspettare riguardare. Bene piuttosto dolce. Si giugno grazia vita.', '2024-04-14', NULL, 0),
(38, 67, 4, 'Recare sopra viaggio determinare tutto andare secolo. Assoluto conoscenza matrimonio misura. Volgere attesa base battaglia. Che peggio operaio compagnia.\nLabbro stabilire lì tacere confronto rivelare poeta. Riuscire lui significare neppure circa campo. Cui coloro forza dolce.\nSalire sguardo salvare calcio volgere. Povero mano capello profondo libertà.', '2024-11-14', NULL, 0),
(39, 78, 1, NULL, '2024-09-14', NULL, 0),
(40, 41, 4, NULL, '2024-04-14', NULL, 0),
(41, 94, 2, 'Battaglia insieme pianura fondare passare credere trattare personale. Concedere perché evitare poesia europeo. Ragazzo in odore padre sedere stanco nazionale.\nSogno volto risposta animo insistere liberare affatto. Riprendere reale civiltà. Rifiutare esame destino. Momento aumentare celebrare dovere giudicare.\nFelice sognare cristiano. Moglie quanto molto costringere costa ciascuno rapido atto. Eppure disposizione nazione sedere avvenire richiedere mamma.', '2025-01-14', NULL, 0),
(42, 13, 2, 'Opinione carne servire fortuna naturalmente morale. Risposta polizia ciascuno differenza elevare raggiungere. Opporre procedere ragione né sapere.\nSegretario escludere città mentre commissione. Guardare tardi ma stringere formare cioè più. Piano bello giovane.\nMassimo foglia regno speranza. Notizia anche fede si. Cosa lato da senza figlia segnare.\nScrivere qualcosa quello rifiutare esempio. Davvero ufficio autore pericoloso fissare bocca.', '2024-04-14', NULL, 0),
(43, 57, 2, NULL, '2025-02-14', '2025-03-07', 0),
(44, 6, 2, 'Rifiutare articolo uccidere gioco soltanto. Successo ritenere allontanare faccia.\nAscoltare ridere grave perfino vasto rapporto umano coscienza. Sud società valle lotta rispetto giovane.\nDistruggere coraggio momento venire svegliare. Qualcosa insomma concludere moglie collo forse.\nTornare nostro perfino oh estendere. Opera ricordo poco chiave finalmente peso ciascuno dipendere.\nRitorno ponte secolo addosso. Estate ma anima collo ognuno fenomeno.', '2024-08-14', NULL, 0),
(45, 41, 3, NULL, '2025-08-14', NULL, 0),
(46, 90, 4, 'Nuovo allora musica macchina avere dedicare. Bello costringere fiore zitto. Accompagnare quale presenza qualsiasi.\nPossibile società minore spesa. Pensare puro sede.\nCui qualcosa contro particolare sperare puro stare. Preoccupare nazione compagnia tirare. Bisognare signora piuttosto quale letto poeta.\nCarattere civile noi già sposare. Argomento campagna meglio sangue.\nCorpo vario aiuto aumentare qualsiasi preciso.\nEstremo ammazzare intorno tu. Fuoco o automobile potenza numeroso linea.', '2024-09-14', '2024-10-14', 0),
(47, 12, 2, 'Risultare passione pericolo chilometro poco esistere bere.\nStorico ricco pranzo movimento caro muro. Gamba spettacolo estendere io caratteristico polizia diretto.\nAntico trasformare nero partito affare chilometro argomento. Colpa professore riconoscere ma. Fame finalmente giudicare vincere pagare notte. Nemmeno città nuovo abitare comprendere.\nFantasia proporre attento aumentare iniziare. Lavorare prodotto piazza nero. Morale vario parecchio capo erba cucina.', '2025-05-14', NULL, 0),
(48, 48, 2, NULL, '2024-08-14', NULL, 0),
(49, 27, 4, 'Effetto pregare scusare girare cosa coprire. Giornale soffrire niente accendere ammazzare godere.\nIntanto certamente continuo politico comunicazione avanti che ombra. Importante pubblicare preferire seguito. Internazionale caldo questione europeo occasione.\nProssimo strumento solito soltanto. Politica istituto lingua pazzo pace probabilmente stasera infine. Bravo ritornare maggiore vivere spegnere gamba.', '2025-03-14', NULL, 0),
(50, 63, 1, 'Cortile ammazzare rifiutare buono preciso.\nAttorno certamente bambina principio ascoltare lingua sopra cristiano. Fresco tenere rivelare. Capitare arrivare parola.\nMinimo bambina nemmeno invitare seguito civile organizzare. Villa casa avere decidere alto bruciare odore. Studiare rivoluzione vero energia. Permettere prendere spettacolo lavoro baciare cittadino innamorare.\nAccordo uno autorità staccare risultare cadere. Soprattutto neppure ah battaglia togliere osservare.', '2025-09-14', NULL, 0),
(51, 37, 1, NULL, '2024-09-14', NULL, 0),
(52, 65, 1, 'Lasciare personale produrre questo però. Pena nulla figlia inglese capitare tuo allontanare.\nEnergia fondo certamente ampio questo male. Riferire scrivere richiedere controllo. Confronto contrario piccolo significare tendere ombra battaglia. Mentre comprare no spingere base finestra vedere.\nNecessario storia sorella descrivere coloro lavorare esporre. Ogni camera scala ammazzare porta. Nave contro recare cielo.', '2024-07-14', '2024-08-06', 0),
(53, 60, 4, 'Morte interesse udire questione contrario latte. Riunire possibilità credere pregare uso colpire però. Insegnare elemento medico segreto esempio muro facile.\nProssimo scappare ordinare si continuare messa rendere. Opporre uso stasera notte.\nPaura uccidere battere fresco condurre oh. Risposta dipendere aspettare. Studiare espressione salvare epoca attendere.', '2024-10-14', NULL, 0),
(54, 84, 2, 'Cane scegliere pesare merito. Alzare normale ritornare domanda scena fermo felice. Direzione compiere repubblica movimento.\nAppunto colore svegliare minuto. Teatro spiegare situazione sistema. Amore subito adesso automobile italiano tentare festa.\nDestro tra provincia non mantenere. Medio preciso impressione piangere per occorrere. Biondo diffondere cattolico. Commissione oramai massimo rispetto.', '2025-05-14', NULL, 0),
(55, 88, 3, 'Sapere scienza animo fornire dire soltanto indietro.\nPoesia storia attenzione. Gioia ciascuno camera conto ritenere.\nProssimo moderno ottenere confronto lo capire misura maestro. Vino carne indietro entrare sentimento finire spettacolo padrone. Risposta vestire terreno prima sino vostro realtà appoggiare.\nSpegnere sud paura scoprire mattina frase dubbio. Matrimonio senso chiave pieno. Infatti rapido direttore centrale mese.\nStella cosa importare brutto. Conto autorità popolo alcuno dipendere.', '2024-06-14', NULL, 0),
(56, 61, 1, NULL, '2025-08-14', '2025-08-19', 0),
(57, 77, 3, 'Fermo vedere industria corpo fabbrica stazione. Segreto zona segreto oro tra prendere bisognare produrre. Spiegare vero buio insieme.\nRealtà tuttavia mare infatti che. Trattare russo comprare esercito pagina società intendere. Chi maestro avere orecchio.\nTipo qui industria bagno. Stabilire materia base stasera scrivere io. Pelle difendere desiderio donna determinare.\nGrigio limitare seguire sala utile. Vendere invitare fiducia verso. Centrale corso fuoco destro naturale accordo capace.', '2025-09-14', '2025-09-26', 0),
(58, 18, 2, 'Ponte questione biondo levare prato importanza stanco libro. Chiamare più vivo rompere lingua. Attaccare isola pezzo ricerca nemmeno perfetto diventare.\nEscludere americano terreno. Voglia iniziare ragione servizio fenomeno serie.\nPaura nessuno immagine produrre concludere ogni bambina.\nFaccia resistere lanciare dirigere dinanzi importare sposare. Treno concetto potere bestia industria luce.', '2024-04-14', '2024-04-15', 0),
(59, 10, 3, 'Passo a portare finire questo qualità. Tale risposta malattia nome vento. Indietro ragione limite oppure nessuno famoso presto basso.\nAbito ringraziare però. Modo stanco fresco ciascuno voi neppure. Contatto tardi circa continuare collo comodo riva cane.\nDifendere bastare sole pena arte nemmeno. Massimo ottenere finestra caratteristico medio scrittore costruire.', '2025-06-14', NULL, 0),
(60, 3, 1, 'Impressione gusto immaginare dimenticare. Recente viso carattere oltre.\nEsercito vincere rapporto ferire diverso nave. Attaccare guerra arte descrivere lì quanto staccare sociale.\nSonno risposta trascinare nero. Lotta condurre perché vivere qualità coraggio.\nAprire abito stabilire determinare. Inizio senso brutto semplice chiaro mio. Bello mestiere strano necessario operaio gioco interessare.\nOffrire cielo intanto. Lanciare proporre vuoto elemento uguale.', '2025-08-14', NULL, 0),
(61, 14, 1, 'Bambino biondo studiare liberare. Natura su confessare ricco dolce lontano limite.\nAccompagnare credere donna. Ogni privato pane mezzo entrare tuo volta.\nBianco enorme signore diritto. Annunciare noto piuttosto principe animo liberare giocare. Peggio personale abito popolo società accadere soltanto.\nServizio considerare diventare smettere naturalmente ministro tavolo. Chiesa stella ma fra usare.', '2024-08-14', NULL, 0),
(62, 37, 3, 'Passare intorno realtà. Accadere bocca suonare.\nSostenere vino anzi pronto appoggiare lungo. Arte decidere ah lingua.\nRealtà resto almeno accendere colpa lontano fratello pelle. Notare produzione uso meglio riguardare onore. Massimo normale rivolgere differenza sociale pubblicare diffondere superare.\nConoscere grigio valere pesare. Processo realtà mercato. Elemento politica assumere segno.', '2024-07-14', NULL, 0),
(63, 98, 3, NULL, '2025-04-14', NULL, 0),
(64, 36, 2, NULL, '2024-07-14', NULL, 0),
(65, 26, 5, 'Affatto mezzo qualità accogliere bosco.\nPolizia intero dimostrare piano. Intorno sforzo greco permettere ordinare.\nCapire coraggio francese armare terreno possibile occasione riferire. Mano importare corsa conoscenza labbro salire dito.\nUscire periodo contento sorella migliore. Insomma chiamare giocare collo comprare. Voglia notare passato loro europeo.\nStorico giungere adesso appoggiare vista scopo durante. Ricco valere buono procedere costa tenere. Ferro aspettare cui appunto affare.', '2024-11-14', NULL, 0),
(66, 97, 5, 'Utile determinare bagno oggetto. Semplice foglia stare fuoco guardia. Ufficiale costituire presidente cattivo vino.\nGrosso contare lungo inizio stabilire. Comunque territorio relazione vi conservare volto mentre.\nEgli modo prima trarre pietra largo. Solito niente differenza salire greco questo.\nMusica ripetere tecnico abbandonare argomento allora pieno passione. Fame né lavorare accorgersi. Forse riportare periodo straordinario sviluppo. Mente cristiano milione vasto.', '2024-07-14', '2024-08-12', 0),
(67, 64, 3, 'Domenica spalla intero dovere. Sonno espressione gamba serio quindi interessare.\nOgnuno campagna villa usare coprire. Fra intanto alcuno. Mi arte concedere famoso almeno esso.\nTedesco padrone ospedale ragazzo principe chilometro porre. Chiudere chiedere riunire dito vero quindi più.\nVicino pane riprendere giudicare perché tranquillo. Riva bruciare assumere dimostrare certamente arrivare esprimere ufficio. Stella giornata giornale sostenere passato inizio presso diretto.', '2024-09-14', '2024-10-07', 0),
(68, 42, 1, 'Difficoltà ritorno impossibile vicino principale assicurare ora. Affermare avvocato eccellenza cosa soffrire rivoluzione villa appartenere. Giudicare noto film ieri smettere.\nCredere diritto avvenire tanto sacro francese. Riprendere dietro secondo luna ridurre bellezza. Mestiere fumare ripetere studiare procedere stesso.\nGenere davanti esporre governo preciso necessario ombra. Indicare serie società letto zitto nostro immagine.', '2024-10-14', NULL, 0),
(69, 98, 5, NULL, '2024-07-14', '2024-08-11', 0),
(70, 84, 4, 'Almeno studio presente fuori. Male accanto dentro abbandonare presso.\nNascere noi oltre vi largo. Impressione caro sforzo vostro invitare scherzare niente. Ridere uomo affrontare.\nLago voi speranza principe bambino baciare estero.\nScrittore prova amore. Non accordo loro libro levare stare.\nDa signora relazione se. Divenire richiedere erba disposizione.', '2024-07-14', '2024-07-20', 0),
(71, 71, 2, 'Difficile primo lanciare economico io migliore caldo. Domenica potere ci. Misura soffrire dio roba storico aggiungere posto sognare. Pace maggio unico buttare cultura industria ringraziare.\nSoltanto tuttavia tranquillo rappresentare bianco. Latino oramai sotto contro qualcuno fiore piccolo assistere. Affrontare costa noi possibile mamma.\nSino fantasia vestito qualsiasi. Rispetto appoggiare necessario vita popolazione. Rapido vuoto gruppo onore povero.', '2025-07-14', NULL, 0),
(72, 9, 3, 'Ringraziare fuori piccolo ministro. Stanco ospedale noi duro. Sviluppo subito attento.\nModo tono sole comunque contatto e. Fine contadino domandare senza sedere eppure come. Avanzare cercare alcuno forma prevedere classe.\nFuoco provvedere fabbrica pelle svegliare pieno. Legare consiglio camera padre ecco vino altro. Tacere superare pensiero opinione epoca attesa.\nLontano celebrare attento. Nemico fretta scappare tagliare leggere niente cucina. Togliere europeo sviluppo.', '2025-01-14', NULL, 0),
(73, 12, 1, 'Rivoluzione quale origine e inoltre venire invece. Su là certo vivo quadro discorso aspettare. Domani mare mandare territorio compagnia cioè occorrere.\nFiducia vecchio chiedere consiglio dio. Servire difficile vostro evitare poeta buio.\nGiardino maggio crisi sposare esercito invitare. Con industria entrare non ammazzare. Signora andare non attendere tagliare spesa.', '2025-03-14', '2025-03-27', 0),
(74, 64, 1, 'Togliere giallo armare cambiare rappresentare tentare assumere governo. Salutare estero triste film spiegare vecchio volere. Intero gatto gioco vestire latte presente qualche però.\nDuro cioè lei musica spegnere. Minuto dubbio film scegliere interno spazio segreto.\nAssicurare trasformare proporre preparare diventare senza unire. Costituire papà titolo naturalmente destino togliere. Buono grosso forse piede peccato strumento verde.', '2024-07-14', NULL, 0),
(75, 46, 5, 'Grazia dopo succedere russo. Romano forza tentare futuro poco. Restare lei sicuro dubbio conoscere coprire uguale passare.\nSalire genere corso. Umano ordine soprattutto gruppo pomeriggio disposizione. Classe occasione camminare rosso aumentare minimo tagliare.\nSocietà economico segno. Personale costa macchina signorina tu carne dove. Amore fortuna montagna il.\nConvincere giornale chiamare chiamare ricerca. Luogo altro caffè opinione vino impossibile.', '2024-11-14', NULL, 0),
(76, 24, 3, 'Signore impressione rimanere assumere come bambino guardia bambina. Aiuto continuare idea riempire.\nAppena provincia inglese però. Ah espressione posizione come sera fumare animale tirare. Allontanare ambiente mamma pomeriggio malattia. Addirittura mio erba per.\nMorire fiducia paura punto massa. Futuro meno accompagnare finalmente dire stabilire eccetera. Madre insomma bastare cura cavallo tipo nulla dio.\nAttorno sorprendere montagna. Cattivo successo godere proporre qualunque.', '2024-07-14', NULL, 0),
(77, 12, 3, 'Stamattina presentare funzione grave. Ordinare dirigere calcio scorrere mettere titolo preparare. Nave vuoto sapere ambiente.\nLargo denaro grande. Verde concedere seguire vicino casa città coscienza.\nMassa privato ministro nuovo riprendere. Presenza sede automobile rivedere minimo costa o madre. Chiudere persona battere pietà civile.\nTrarre preoccupare immaginare assoluto indietro. Macchina coraggio camera sposare divenire. Però insistere sala numeroso vivo.', '2025-06-14', '2025-06-22', 0),
(78, 9, 2, 'Rosso onore importare signore. Scopo stanco rompere grazie.\nStampa trovare uccidere nobile. Sì fumare restare importare dipendere figurare centro. Godere parere massimo proporre luogo lui potenza. Chiudere teatro su mangiare zio né figlio.\nInverno parlare resto perfetto tratto contadino. Carta atto figlia umano.\nAnche giudizio porre scrittore roba carta. Concedere cioè gatto fondare classe prezzo.\nOdore stato colpa.', '2025-03-14', NULL, 0),
(79, 57, 5, NULL, '2025-04-14', NULL, 0),
(80, 80, 4, 'Cittadino scomparire ripetere città.\nBrutto preoccupare bianco tentare direttore trasformare però. Ombra buttare riferire certamente monte principe. Discutere posto come trasformare avere autore dire. Azzurro spettacolo scena storia forte.\nLibero fine servizio matrimonio aspettare inglese quadro. Tipo nudo bruciare tratto sorprendere cantare. Gruppo nemmeno anche andare trasformare troppo.', '2025-07-14', NULL, 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `supplier`
--

CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `supplier`
--

INSERT INTO `supplier` (`SupplierID`, `Name`, `Address`, `Phone`, `IsDeleted`) VALUES
(1, 'Book Verdone e figli', 'Canale Corbo, 3, 09027, Serrenti (SU)', '0541534282', 0),
(2, 'Editore Coppola SPA', 'Piazza Mengolo, 9, 98028, Barracca (ME)', '098417953', 0),
(3, 'Libri Bignami-Opizzi Group', 'Contrada Toni, 75 Appartamento 75, 31100, Fiera (TV)', '+39 058705420', 0),
(4, 'Feltrinelli Adinolfi Group', 'Viale Brichese, 46, 41055, Bertocchi (MO)', '0309163081', 0),
(5, 'Distribuzione Anichini-Conte e figli', 'Vicolo Agostinelli, 0 Piano 4, 00193, Roma (RM)', '+39 0544536303', 0),
(6, 'Libri Boezio, Filzi e Serao s.r.l.', 'Borgo Lercari, 96, 35128, Padova (PD)', '+39 043128302', 0),
(7, 'Feltrinelli Squarcione-Ruberto e figli', 'Borgo Camillo, 28 Appartamento 5, 20018, Sedriano (MI)', '+39 3517947662', 0),
(8, 'Mondadori Ferragni, Sagnelli e Gozzano Group', 'Via Ugolino, 26 Appartamento 76, 23020, Mese (SO)', '37133734918', 0),
(9, 'Book Smirnoff, Cafarchia e Verdi e figli', 'Via Benedetti, 74, 12046, San Rocco Monta\' (CN)', '0965891016', 0),
(10, 'Feltrinelli Trezzini s.r.l.', 'Viale Malatesta, 516 Appartamento 7, 83036, Mirabella Eclano (AV)', '377017931', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `IsDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `user`
--

INSERT INTO `user` (`UserID`, `FirstName`, `LastName`, `Email`, `Address`, `Phone`, `IsDeleted`) VALUES
(1, 'Piermaria', 'Alonzi', 'silvia53@example.com', 'Strada Rinaldi, 8, 28068, Romentino (NO)', '0958223135', 0),
(2, 'Roman', 'Morosini', 'tonistograziella@example.net', 'Canale Susanna, 29, 09070, Zeddiani (OR)', '+39 345638950', 0),
(3, 'Tatiana', 'Tarchetti', 'loredanavittadello@example.net', 'Stretto Cesaroni, 12 Appartamento 35, 70033, Corato (BA)', '+39 0166071623', 0),
(4, 'Giovanna', 'Toscani', 'solimenadonna@example.org', 'Vicolo Puglisi, 5 Appartamento 7, 13814, Pollone (BI)', '+39 037624281', 0),
(5, 'Adamo', 'Tamborini', 'romanacafarchia@example.com', 'Incrocio Faggiani, 62, 01100, La Quercia (VT)', '+39 0419836861', 0),
(6, 'Evangelista', 'Scaduto', 'elianafinotto@example.net', 'Vicolo Maggioli, 78, 89034, Bovalino (RC)', '+39 35161250454', 0),
(7, 'Ricciotti', 'Iannucci', 'loredana77@example.org', 'Borgo Matteo, 0 Appartamento 9, 73013, Santa Barbara (LE)', '+39 0532534565', 0),
(8, 'Mercedes', 'Bartoli', 'kfaugno@example.org', 'Rotonda Pietro, 0 Appartamento 65, 88841, Sant\'Anna (KR)', '+39 08252934920', 0),
(9, 'Simonetta', 'Buscetta', 'trongiacinto@example.net', 'Vicolo Vito, 79, 98049, Villafranca Tirrena (ME)', '33406589070', 0),
(10, 'Lucio', 'Mazzi', 'imancini@example.com', 'Strada Caffarelli, 40, 05011, Allerona Stazione (TR)', '08617063329', 0),
(11, 'Alessia', 'Goldoni', 'nesposito@example.net', 'Piazza Ferraris, 1, 20095, Milanino (MI)', '+39 0536375768', 0),
(12, 'Corrado', 'Travaglia', 'toscaniniadriana@example.net', 'Viale Bragaglia, 47, 98128, Tremestieri (ME)', '0922123969', 0),
(13, 'Elisa', 'Ajello', 'alfio75@example.net', 'Incrocio Mirko, 48 Appartamento 4, 64028, Silvi Marina (TE)', '+39 0573329940', 0),
(14, 'Pomponio', 'Persico', 'krossellini@example.net', 'Canale Sandro, 12 Appartamento 74, 71014, San Marco In Lamis (FG)', '+39 0721163902', 0),
(15, 'Michele', 'Curatoli', 'emilio62@example.com', 'Piazza Nolcini, 179 Piano 2, 28842, Bognanco (VB)', '38882770737', 0),
(16, 'Gianluca', 'Tomasetti', 'silvestro49@example.org', 'Via Flavio, 321 Appartamento 3, 40066, Pieve Di Cento (BO)', '09613894956', 0),
(17, 'Alessandro', 'Casini', 'prossellini@example.com', 'Via Giulietta, 0 Appartamento 4, 20013, Magenta (MI)', '+39 0302302006', 0),
(18, 'Barbara', 'Puglisi', 'dossiermanno@example.net', 'Rotonda Ludovica, 2 Piano 2, 10051, Grangia (TO)', '+39 05453856127', 0),
(19, 'Amanda', 'Donarelli', 'orestearmellini@example.com', 'Canale Ermanno, 174 Appartamento 6, 41043, Formigine (MO)', '+39 0789821912', 0),
(20, 'Maria', 'Beccheria', 'zcasini@example.com', 'Via Etta, 46, 48017, San Patrizio (RA)', '3346894354', 0),
(21, 'Lamberto', 'Rismondo', 'fproietti@example.org', 'Vicolo Antonino, 2 Appartamento 9, 16021, Bargagli (GE)', '+39 35190120010', 0),
(22, 'Santino', 'Gasperi', 'erika10@example.org', 'Viale Bonatti, 66, 50053, Fontanella (FI)', '3533362650', 0),
(23, 'Romolo', 'Muratori', 'smirnoffpriscilla@example.com', 'Stretto Gaspare, 631 Appartamento 14, 03037, Pontecorvo (FR)', '+39 07031360369', 0),
(24, 'Ottavio', 'Pugliese', 'pier02@example.net', 'Piazza Martucci, 77 Appartamento 0, 00134, Castel Di Leva (RM)', '37139705658', 0),
(25, 'Alina', 'Staglieno', 'erika56@example.org', 'Viale Valentino, 985, 12042, Pollenzo (CN)', '36185251167', 0),
(26, 'Lisa', 'Fischetti', 'rgarozzo@example.org', 'Incrocio Pisaroni, 80 Appartamento 0, 28828, Gurro (VB)', '+39 39204682356', 0),
(27, 'Paoletta', 'Gotti', 'ruggeroaccardo@example.org', 'Via Barzini, 92, 28017, San Maurizio D\'Opaglio (NO)', '01411221199', 0),
(28, 'Vanessa', 'Montanelli', 'giacobbe61@example.com', 'Strada Ermes, 28 Piano 2, 13882, Cerrione (BI)', '3490447508', 0),
(29, 'Luigina', 'Ostinelli', 'alessioboaga@example.net', 'Contrada Sagredo, 0, 36100, Polegge (VI)', '+39 329539658', 0),
(30, 'Angelina', 'Filzi', 'edoardo26@example.net', 'Via Pucci, 472 Piano 4, 20843, Verano Brianza (MB)', '+39 3780362894', 0),
(31, 'Sebastiano', 'Ammaniti', 'pomponio47@example.org', 'Stretto Imelda, 30 Appartamento 94, 40024, Gallo (BO)', '+39 3779561991', 0),
(32, 'Sole', 'Zabarella', 'amletodalla@example.com', 'Stretto Raffaella, 39, 10147, Torino (TO)', '3371055710', 0),
(33, 'Guido', 'Panatta', 'intermineimilo@example.net', 'Stretto Sorrentino, 8 Appartamento 26, 28851, Beura Cardezza (VB)', '0322956150', 0),
(34, 'Stefani', 'Ferretti', 'qubaldi@example.org', 'Canale Mantegazza, 7 Piano 4, 16128, Genova (GE)', '+39 3453846064', 0),
(35, 'Arnaldo', 'Caccioppoli', 'brancifortegianpaolo@example.org', 'Canale Fiorino, 5, 75024, Montescaglioso (MT)', '35121734831', 0),
(36, 'Gaspare', 'Rapisardi', 'dmattarella@example.org', 'Vicolo Persico, 8 Piano 1, 20873, Cavenago Di Brianza (MB)', '33028674146', 0),
(37, 'Alessandro', 'Tonisto', 'orlando42@example.com', 'Rotonda Margherita, 5, 08018, Sindia (NU)', '3550795187', 0),
(38, 'Calcedonio', 'Curatoli', 'chiara38@example.com', 'Stretto Ranieri, 21 Appartamento 9, 89861, Tropea (VV)', '+39 0577951016', 0),
(39, 'Ranieri', 'Martinelli', 'qregge@example.com', 'Canale Pasquale, 75, 67023, Castel Del Monte (AQ)', '3715402662', 0),
(40, 'Patrizia', 'Battaglia', 'adele67@example.com', 'Vicolo Pavone, 221, 39011, Pawig (BZ)', '3401425204', 0),
(41, 'Giacobbe', 'Raimondi', 'luccianomattia@example.net', 'Stretto Seddio, 45, 95010, Santa Venerina (CT)', '+39 37018024641', 0),
(42, 'Telemaco', 'Peruzzi', 'giannidossetti@example.com', 'Viale Redi, 0, 06073, Mantignana (PG)', '087402701', 0),
(43, 'Monica', 'Bellocchio', 'qcarocci@example.net', 'Rotonda Gabriella, 3 Piano 6, 00192, Roma (RM)', '+39 35059870799', 0),
(44, 'Flavio', 'Bellini', 'zmajewski@example.org', 'Borgo Oscuro, 32, 59021, Vaiano (PO)', '079974521', 0),
(45, 'Livia', 'Lippomano', 'arnulfo23@example.com', 'Rotonda Bocca, 50, 64030, Villa Bozza (TE)', '01639299181', 0),
(46, 'Agostino', 'Marconi', 'franscinipaulina@example.org', 'Piazza Verdone, 12, 23883, Brivio (LC)', '+39 38233389032', 0),
(47, 'Gian', 'Boldù', 'pavarottibarbara@example.com', 'Vicolo Gian, 887, 88051, Cropani Marina (CZ)', '0914243571', 0),
(48, 'Enzio', 'Monte', 'ritagentili@example.net', 'Contrada Antonino, 55 Piano 1, 60129, Poggio (AN)', '042678470', 0),
(49, 'Calcedonio', 'Opizzi', 'toniabrugnaro@example.com', 'Piazza Jolanda, 92 Appartamento 62, 33022, Arta Terme (UD)', '+39 058883646', 0),
(50, 'Claudia', 'Bellocchio', 'mmontalcini@example.net', 'Contrada Cortese, 826 Piano 8, 20832, Desio (MB)', '+39 012217530', 0),
(51, 'Giuseppina', 'Tanzini', 'esolari@example.com', 'Borgo Salvini, 512, 23025, Novate Mezzola (SO)', '0324773891', 0),
(52, 'Giustino', 'Broschi', 'gaetano50@example.com', 'Viale Micca, 7 Piano 7, 67034, Pettorano Sul Gizio (AQ)', '+39 0775653634', 0),
(53, 'Sonia', 'Sokolov', 'benito87@example.org', 'Via Catenazzi, 4 Piano 7, 81046, Borgo Appio (CE)', '330779806', 0),
(54, 'Martina', 'Mastroianni', 'umbertocardano@example.org', 'Strada Tamburello, 241 Appartamento 7, 37042, Caldiero (VR)', '3701157109', 0),
(55, 'Luchino', 'Marinetti', 'manolessogelsomina@example.org', 'Via Costalonga, 729 Piano 2, 86038, Petacciato (CB)', '+39 05232195003', 0),
(56, 'Annibale', 'Impastato', 'carullolara@example.net', 'Piazza Boiardo, 617, 51039, Olmi (PT)', '3280146535', 0),
(57, 'Giuseppe', 'Storladi', 'matteogermano@example.net', 'Contrada Alessia, 995, 55061, San Ginese (LU)', '34059009854', 0),
(58, 'Tina', 'Ferraris', 'giuliettavenditti@example.com', 'Incrocio Raffaele, 352, 38051, Borgo Valsugana (TN)', '+39 3221075566', 0),
(59, 'Ottone', 'Ciampi', 'marissa13@example.net', 'Via Farnese, 127 Piano 1, 32035, Formegan (BL)', '+39 3756410718', 0),
(60, 'Cristina', 'Anastasi', 'bianca67@example.net', 'Canale Luciana, 55, 36100, Vicenza (VI)', '+39 3382700259', 0),
(61, 'Agnolo', 'Cibin', 'leopoldozoppetto@example.org', 'Strada Iannuzzi, 70, 09022, Lunamatrona (SU)', '+39 013107444', 0),
(62, 'Serena', 'Magrassi', 'mlollobrigida@example.org', 'Vicolo Baldassare, 71 Piano 7, 86023, Montagano (CB)', '+39 0974555022', 0),
(63, 'Gelsomina', 'Rosmini', 'leopoldodisdero@example.net', 'Vicolo Bottaro, 529, 23036, Tresenda (SO)', '+39 01086111941', 0),
(64, 'Flavio', 'Mozart', 'nnievo@example.net', 'Piazza Falier, 2 Appartamento 3, 63031, Castel Di Lama Stazione (AP)', '+39 0429133299', 0),
(65, 'Aurora', 'Bompiani', 'psilvestri@example.net', 'Vicolo Eraldo, 389 Appartamento 2, 60034, Cupramontana (AN)', '+39 35055105704', 0),
(66, 'Milena', 'Borromini', 'irma95@example.org', 'Stretto Forza, 88 Appartamento 61, 25046, Bornato (BS)', '32298809886', 0),
(67, 'Camillo', 'Foletti', 'lucia36@example.net', 'Via Camillo, 20, 27056, Cornale (PV)', '+39 018307371', 0),
(68, 'Iolanda', 'Soderini', 'salviscarponi@example.net', 'Contrada Fantozzi, 6 Appartamento 79, 22039, Osigo (CO)', '0735586808', 0),
(69, 'Federica', 'Barzini', 'priscillapacetti@example.net', 'Piazza Giusti, 8, 17022, Borgio (SV)', '0362076995', 0),
(70, 'Gemma', 'Pastine', 'jfinotto@example.net', 'Canale Palumbo, 9, 25047, Gorzone (BS)', '+39 3757058782', 0),
(71, 'Ilaria', 'Cerutti', 'dcilea@example.net', 'Contrada Camilleri, 1, 64037, Cermignano (TE)', '37150328619', 0),
(72, 'Nicola', 'Serraglio', 'gmarconi@example.com', 'Piazza Bianchini, 10 Appartamento 57, 83046, Lacedonia (AV)', '04321430717', 0),
(73, 'Telemaco', 'Chigi', 'antoniettaguarato@example.net', 'Strada Tosto, 60 Piano 4, 19123, Laspezia (SP)', '+39 082594494', 0),
(74, 'Azeglio', 'Pacetti', 'salviiacovelli@example.net', 'Rotonda Alberto, 13 Piano 9, 84059, Camerota (SA)', '+39 0954285126', 0),
(75, 'Flavia', 'Babbo', 'guglielmo51@example.com', 'Contrada Salandra, 61, 05031, Arrone (TR)', '+39 0549356856', 0),
(76, 'Costanzo', 'Nievo', 'ccapuana@example.org', 'Via Pistoletto, 52 Piano 6, 43044, Collecchio (PR)', '3703074973', 0),
(77, 'Laura', 'Mantegna', 'alderanozacchia@example.org', 'Vicolo Bompiani, 3 Appartamento 8, 90014, Casteldaccia (PA)', '+39 0543976123', 0),
(78, 'Mirco', 'Druso', 'allegravanvitelli@example.org', 'Contrada Bianchini, 14, 35030, Fossona (PD)', '075091466', 0),
(79, 'Vittoria', 'Nicolucci', 'turcipaolo@example.net', 'Rotonda Giampiero, 317, 29022, Bobbio (PC)', '+39 0184018902', 0),
(80, 'Bianca', 'Rossi', 'mircovenier@example.net', 'Stretto Agostinelli, 521 Piano 1, 14040, Maranzana (AT)', '375649279', 0),
(81, 'Nina', 'Flaiano', 'giovinemichela@example.com', 'Canale Gioacchino, 30 Appartamento 49, 51035, Porciano (PT)', '042230632', 0),
(82, 'Panfilo', 'Argan', 'ignazio94@example.net', 'Vicolo Maccanelli, 54, 35043, San Cosma (PD)', '+39 050268859', 0),
(83, 'Telemaco', 'Collodi', 'curcicaterina@example.org', 'Borgo Campanella, 8, 37040, Sabbion (VR)', '094269930', 0),
(84, 'Camillo', 'Esposito', 'iromano@example.com', 'Rotonda Interiano, 59 Piano 7, 05035, Testaccio (TR)', '35050560369', 0),
(85, 'Lolita', 'Dalla', 'floriomartino@example.com', 'Vicolo Nicolini, 7, 22017, Menaggio (CO)', '345055910', 0),
(86, 'Rosalia', 'Majorana', 'guglielmo62@example.net', 'Vicolo Gulotta, 421, 00066, Quadroni (RM)', '3519100385', 0),
(87, 'Giulio', 'Bevilacqua', 'irmarosmini@example.com', 'Incrocio Majorana, 60, 09096, Santa Giusta (OR)', '0185012611', 0),
(88, 'Arnulfo', 'Calarco', 'serafina90@example.net', 'Stretto Leopoldo, 78, 27010, Linarolo (PV)', '05236539268', 0),
(89, 'Marta', 'Iannelli', 'scarpagianpietro@example.org', 'Piazza Curci, 2, 00186, Roma (RM)', '+39 0823597520', 0),
(90, 'Liliana', 'Iadanza', 'pastineantonino@example.net', 'Canale Giovanni, 3 Appartamento 3, 21039, Bedero Valcuvia (VA)', '+39 3715532367', 0),
(91, 'Ferdinando', 'Pisano', 'umorucci@example.com', 'Via Guarino, 95, 81043, Capua (CE)', '340855186', 0),
(92, 'Mauro', 'Mazzi', 'alfiosbarbaro@example.org', 'Viale Lupo, 24 Appartamento 35, 88051, Cropani Marina (CZ)', '3836835394', 0),
(93, 'Griselda', 'Antonacci', 'jolandalippomano@example.com', 'Incrocio Gradenigo, 938 Piano 3, 80121, Napoli (NA)', '+39 0471725409', 0),
(94, 'Osvaldo', 'Lamborghini', 'bbrambilla@example.org', 'Rotonda Costalonga, 0 Piano 2, 50060, Borselli (FI)', '3516257191', 0),
(95, 'Fabrizia', 'Boccioni', 'valentinacesarotti@example.org', 'Via Mennea, 593, 28817, Miazzina (VB)', '0853270908', 0),
(96, 'Nicolò', 'Pizziol', 'acoppola@example.com', 'Stretto Tutino, 52 Piano 3, 98072, Canneto Di Caronia (ME)', '+39 3372242330', 0),
(97, 'Dolores', 'Gussoni', 'camillerigiuseppe@example.net', 'Via Toscani, 7 Piano 6, 53048, Rigomagno (SI)', '+39 09318057684', 0),
(98, 'Bianca', 'Respighi', 'cianciolosole@example.net', 'Piazza Aria, 64 Appartamento 6, 84050, Magliano Nuovo (SA)', '075731027', 0),
(99, 'Venancio', 'Turati', 'pasqualargento@example.net', 'Viale Sabatini, 5, 39021, St. Martin am Kofl (BZ)', '+39 3830827539', 0),
(100, 'Ermanno', 'Notarbartolo', 'jricciardi@example.com', 'Rotonda Coppola, 48 Piano 7, 14039, Tonco (AT)', '017113110', 0),
(101, 'Leopoldo', 'Foa', 'battellidante@example.org', 'Stretto Renault, 64 Appartamento 8, 23823, Colico (LC)', '+39 0523962384', 0),
(102, 'Eliana', 'Boito', 'alberico85@example.net', 'Vicolo Lucrezia, 50, 22037, Ponte Lambro (CO)', '+39 37773644307', 0),
(103, 'Maria', 'Opizzi', 'lucioquasimodo@example.org', 'Via Munari, 6, 32036, Roe Alte (BL)', '096214052', 0),
(104, 'Lazzaro', 'Zabarella', 'carlipiergiorgio@example.org', 'Incrocio Bombieri, 17 Appartamento 5, 28827, Airetta (VB)', '+39 01238272794', 0),
(105, 'Alberico', 'Rastelli', 'gianpaoloserao@example.com', 'Canale Calgari, 12 Appartamento 32, 19015, Levanto (SP)', '05726799446', 0),
(106, 'Ettore', 'Armellini', 'giacobbefoa@example.net', 'Strada Hugo, 912, 63844, Grottazzolina (FM)', '+39 351377860', 0),
(107, 'Enzo', 'Pedrazzini', 'kpetrucci@example.com', 'Strada Berengario, 89, 25042, Borno (BS)', '329766360', 0),
(108, 'Mirco', 'Leonetti', 'pompeo96@example.com', 'Vicolo Bresciani, 81, 25024, Castelletto (BS)', '+39 0321457139', 0),
(109, 'Lucia', 'Lovato', 'mariaguinizzelli@example.com', 'Piazza Nosiglia, 96 Piano 5, 98047, Scarcelli (ME)', '073328442', 0),
(110, 'Micheletto', 'Faranda', 'spisani@example.net', 'Rotonda Parmitano, 868, 42043, Praticello (RE)', '+39 0424999890', 0),
(111, 'Maurizio', 'Legnante', 'valeria20@example.net', 'Contrada Augusto, 728, 41031, Camposanto (MO)', '09638836388', 0),
(112, 'Lauretta', 'Valentino', 'margheritamontessori@example.com', 'Rotonda Fanucci, 3 Piano 6, 88050, Fossato Serralta (CZ)', '+39 05166959477', 0),
(113, 'Gelsomina', 'Ruggieri', 'mbacosi@example.org', 'Incrocio Amico, 747 Piano 6, 01016, Lido Di Tarquinia (VT)', '360154199', 0),
(114, 'Sandro', 'Missoni', 'marco37@example.org', 'Via Atenulf, 89 Appartamento 27, 90131, Rocca Monreale (PA)', '+39 0891990400', 0),
(115, 'Valerio', 'Baroffio', 'robertogasperi@example.org', 'Rotonda Conte, 54, 31020, Zoppe\' (TV)', '0922575785', 0),
(116, 'Ettore', 'Asmundo', 'cusanopriscilla@example.net', 'Piazza Luchino, 24, 17017, Roccavignale (SV)', '01659702445', 0),
(117, 'Lorenzo', 'Pertile', 'elmo44@example.org', 'Strada Sandro, 73 Appartamento 47, 28040, Varallo Pombia (NO)', '350542674', 0),
(118, 'Antonino', 'Stefanelli', 'pvalier@example.net', 'Via Iannuzzi, 35 Piano 9, 05018, Canale Nuovo (TR)', '05663841030', 0),
(119, 'Panfilo', 'Pratesi', 'mazzimarco@example.net', 'Contrada Erika, 4 Piano 2, 31015, Scomigo (TV)', '01637469320', 0),
(120, 'Pierpaolo', 'Pavarotti', 'eugeniaserlupi@example.net', 'Piazza Petralli, 982, 09122, Cagliari (CA)', '3611594222', 0),
(121, 'Milena', 'Fanucci', 'nicolo37@example.com', 'Piazza Guicciardini, 30 Piano 9, 37022, Breonio (VR)', '0572241452', 0),
(122, 'Tullio', 'Caironi', 'franceschiclelia@example.org', 'Borgo Nina, 54 Piano 6, 20092, Cinisello Balsamo (MI)', '+39 083222503', 0),
(123, 'Tina', 'Leonardi', 'bassiaria@example.com', 'Canale Zito, 423 Piano 6, 82029, San Marco Dei Cavoti (BN)', '+39 371617175', 0),
(124, 'Pompeo', 'Colletti', 'pomponiolombardi@example.net', 'Borgo Francesco, 52, 13812, Balma (BI)', '+39 039473847', 0),
(125, 'Costantino', 'Ziani', 'paceflavio@example.org', 'Contrada Renault, 40 Piano 5, 10048, Garino (TO)', '0185730654', 0),
(126, 'Gianna', 'Paoletti', 'massimo77@example.net', 'Piazza Enrico, 43, 01035, Gallese (VT)', '08238224938', 0),
(127, 'Jolanda', 'Fiorucci', 'iannottifiamma@example.org', 'Borgo Sobrero, 70 Appartamento 60, 00199, Roma (RM)', '+39 049671338', 0),
(128, 'Pietro', 'Maffei', 'uvigliotti@example.org', 'Stretto Correr, 56, 38082, Castel Condino (TN)', '0535301470', 0),
(129, 'Giacomo', 'Mogherini', 'santepiazzi@example.net', 'Stretto Antelami, 6, 86071, Castel San Vincenzo (IS)', '+39 3457026546', 0),
(130, 'Romana', 'Chinnici', 'qangiolello@example.com', 'Canale Ermes, 734 Appartamento 65, 26019, Vailate (CR)', '08235174329', 0),
(131, 'Barbara', 'Regge', 'melania53@example.com', 'Piazza Lucia, 595 Piano 0, 18014, Ospedaletti (IM)', '340536586', 0),
(132, 'Gastone', 'Buscetta', 'canevascinidonna@example.com', 'Rotonda Antelami, 64, 26865, San Rocco Al Porto (LO)', '09349434159', 0),
(133, 'Arturo', 'Tresoldi', 'camillerilodovico@example.net', 'Canale Antonacci, 15, 16157, Palmaro Di Pra\' (GE)', '3493524975', 0),
(134, 'Tiziano', 'Cainero', 'alphons65@example.org', 'Stretto Malaparte, 65 Piano 6, 63069, Montedinove (AP)', '+39 0732382540', 0),
(135, 'Gino', 'Giannone', 'gastone62@example.org', 'Stretto Sandi, 72, 67036, Rivisondoli (AQ)', '+39 3611261320', 0),
(136, 'Mirko', 'Collodi', 'znapolitano@example.net', 'Strada Gilardoni, 8 Piano 9, 65012, Villareia (PE)', '0716192100', 0),
(137, 'Pomponio', 'Novaro', 'pinamonteromina@example.com', 'Canale Maria, 1, 20845, Sovico (MB)', '0775426047', 0),
(138, 'Lilla', 'Burcardo', 'tommaseoamadeo@example.com', 'Borgo Ruggeri, 92, 39034, Wahlen (BZ)', '+39 3735868859', 0),
(139, 'Pierina', 'Caironi', 'donatellogentilini@example.org', 'Viale Nicolini, 31, 03013, Tofe (FR)', '3307979883', 0),
(140, 'Leopoldo', 'Casini', 'roeroconcetta@example.net', 'Strada Mario, 9 Piano 3, 56025, Pontedera (PI)', '+39 0761962431', 0),
(141, 'Tiziano', 'Tagliafierro', 'ermannomedici@example.net', 'Rotonda Durante, 9, 15065, Frugarolo (AL)', '+39 3434435322', 0),
(142, 'Pietro', 'Pergolesi', 'spallanzanidonato@example.org', 'Via Umberto, 892 Piano 5, 10094, Selvaggio (TO)', '+39 3710380821', 0),
(143, 'Umberto', 'Moschino', 'coriolano92@example.org', 'Stretto Vitturi, 9, 55012, Capannori (LU)', '01948626321', 0),
(144, 'Eliana', 'Fusani', 'pieromortati@example.org', 'Canale Foscari, 699 Piano 8, 87069, San Demetrio Corone (CS)', '0811260743', 0),
(145, 'Biagio', 'Ostinelli', 'vmattarella@example.com', 'Via Fabio, 511 Piano 4, 55022, Lucchio (LU)', '+39 058414291', 0),
(146, 'Alessio', 'Carocci', 'wcapuana@example.net', 'Canale Galuppi, 7 Piano 7, 12066, Borgo (CN)', '+39 375732352', 0),
(147, 'Eugenia', 'Broschi', 'melinaaccardo@example.net', 'Vicolo Romiti, 45, 12079, Saliceto (CN)', '+39 3291727268', 0),
(148, 'Luciana', 'Lamborghini', 'pbartoli@example.com', 'Incrocio Taliercio, 4, 30024, Croce (VE)', '0521936945', 0),
(149, 'Arnulfo', 'Raurica', 'marina34@example.com', 'Strada Nanni, 79, 07049, Usini (SS)', '0506031945', 0),
(150, 'Rodolfo', 'Govoni', 'martina84@example.org', 'Viale Carli, 29 Appartamento 57, 95017, Piedimonte Etneo (CT)', '0411282518', 0);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`AuthorID`),
  ADD KEY `idxAuthor` (`AuthorID`);

--
-- Indici per le tabelle `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `fkBookBookInfoID` (`BookInfoID`),
  ADD KEY `fkBookSupplierID` (`SupplierID`),
  ADD KEY `fkBookAuthorID` (`AuthorID`),
  ADD KEY `fkBookReviewID` (`ReviewID`),
  ADD KEY `idxBook` (`BookID`);

--
-- Indici per le tabelle `bookinfo`
--
ALTER TABLE `bookinfo`
  ADD PRIMARY KEY (`BookInfoID`),
  ADD KEY `idxBookInfo` (`BookInfoID`);

--
-- Indici per le tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`),
  ADD KEY `fkCustomerUserID` (`UserID`),
  ADD KEY `idxCustomer` (`CustomerID`);

--
-- Indici per le tabelle `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD KEY `fkEmployeeUserID` (`UserID`),
  ADD KEY `idxEmployee` (`EmployeeID`);

--
-- Indici per le tabelle `rental`
--
ALTER TABLE `rental`
  ADD PRIMARY KEY (`RentalID`),
  ADD KEY `fkRentalEmployeeID` (`EmployeeID`),
  ADD KEY `fkRentalCustomerID` (`CustomerID`),
  ADD KEY `idxRental` (`RentalID`);

--
-- Indici per le tabelle `rentaldetail`
--
ALTER TABLE `rentaldetail`
  ADD PRIMARY KEY (`RentalDetailID`),
  ADD KEY `fkRentalDetailBookID` (`BookID`),
  ADD KEY `idxRentalDetail` (`RentalDetailID`),
  ADD KEY `fkRentalDetailRentalID` (`RentalID`);

--
-- Indici per le tabelle `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`ReviewID`),
  ADD KEY `fkReviewCustomerID` (`CustomerID`),
  ADD KEY `idxReview` (`ReviewID`);

--
-- Indici per le tabelle `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`SupplierID`),
  ADD KEY `idxSupplier` (`SupplierID`);

--
-- Indici per le tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD KEY `idxUser` (`UserID`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `author`
--
ALTER TABLE `author`
  MODIFY `AuthorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT per la tabella `book`
--
ALTER TABLE `book`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT per la tabella `bookinfo`
--
ALTER TABLE `bookinfo`
  MODIFY `BookInfoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT per la tabella `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT per la tabella `employee`
--
ALTER TABLE `employee`
  MODIFY `EmployeeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT per la tabella `rental`
--
ALTER TABLE `rental`
  MODIFY `RentalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT per la tabella `rentaldetail`
--
ALTER TABLE `rentaldetail`
  MODIFY `RentalDetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT per la tabella `review`
--
ALTER TABLE `review`
  MODIFY `ReviewID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT per la tabella `supplier`
--
ALTER TABLE `supplier`
  MODIFY `SupplierID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT per la tabella `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `fkBookAuthorID` FOREIGN KEY (`AuthorID`) REFERENCES `author` (`AuthorID`),
  ADD CONSTRAINT `fkBookBookInfoID` FOREIGN KEY (`BookInfoID`) REFERENCES `bookinfo` (`BookInfoID`),
  ADD CONSTRAINT `fkBookReviewID` FOREIGN KEY (`ReviewID`) REFERENCES `review` (`ReviewID`),
  ADD CONSTRAINT `fkBookSupplierID` FOREIGN KEY (`SupplierID`) REFERENCES `supplier` (`SupplierID`);

--
-- Limiti per la tabella `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fkCustomerUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Limiti per la tabella `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fkEmployeeUserID` FOREIGN KEY (`UserID`) REFERENCES `user` (`UserID`);

--
-- Limiti per la tabella `rental`
--
ALTER TABLE `rental`
  ADD CONSTRAINT `fkRentalCustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `fkRentalEmployeeID` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`);

--
-- Limiti per la tabella `rentaldetail`
--
ALTER TABLE `rentaldetail`
  ADD CONSTRAINT `fkRentalDetailBookID` FOREIGN KEY (`BookID`) REFERENCES `book` (`BookID`),
  ADD CONSTRAINT `fkRentalDetailRentalID` FOREIGN KEY (`RentalID`) REFERENCES `rental` (`RentalID`);

--
-- Limiti per la tabella `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fkReviewCustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
