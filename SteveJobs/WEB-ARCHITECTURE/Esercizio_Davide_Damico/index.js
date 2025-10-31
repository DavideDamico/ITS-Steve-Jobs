const { ottieniStudentiOrdinati } = require('./controller/studentiController');
const { stampaStudenti } = require('./view/studentiView');

(async () => {
	try {
		const studentiOrdinati = await ottieniStudentiOrdinati();
		stampaStudenti(studentiOrdinati);
	} catch (error) {
		console.error('Errore durante l\'esecuzione del programma:', error.message);
		process.exitCode = 1;
	}
})();
