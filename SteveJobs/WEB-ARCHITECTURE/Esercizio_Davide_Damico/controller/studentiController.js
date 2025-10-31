const { fetchStudentiOrdinati } = require('../model/studentiModel');

async function ottieniStudentiOrdinati() {
  return fetchStudentiOrdinati();
}

module.exports = { ottieniStudentiOrdinati };
