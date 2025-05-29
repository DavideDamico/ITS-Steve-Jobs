// Esercizio 2: Gestione di sessionStorage con Più JSON Locali e Aggregazione Dati
// Obiettivo:
// Caricare asincronamente più file JSON locali, salvare i dati in sessionStorage e combinarli in un unico oggetto.
// Requisiti:
// ·      Crea tre file JSON locali:
// o  name.json → { "name": "Mario" }
// o  email.json → { "email": "mario@example.com" }
// o  age.json → { "age": 30 }
// ·      Crea tre funzioni asincrone (fetchUserName(), fetchUserEmail(), fetchUserAge()) che leggono rispettivamente i tre file JSON con fetch().
// ·      Dopo aver ricevuto ogni dato, salvalo in sessionStorage sotto chiavi userName, userEmail, userAge.
// ·      Crea una funzione getUserData() che legge i dati da sessionStorage, li combina in un oggetto { name, email, age } e lo restituisce.
// ·      Assicurati che le tre chiamate fetch vengano eseguite in parallelo e che getUserData() aspetti che tutte finiscano.

async function fetchUserName() {
  try {
    const response = await fetch("name.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    // console.log(data.name);
    sessionStorage.setItem("userName", `${data.name}`);
    return sessionStorage.getItem("userName");
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
  }
}
fetchUserName();

async function fetchUserEmail() {
  try {
    const response = await fetch("email.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    // console.log(data.email);
    sessionStorage.setItem("userEmail", `${data.email}`);
    return sessionStorage.getItem("userEmail");
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
  }
}
fetchUserEmail();

async function fetchUserAge() {
  try {
    const response = await fetch("age.json");
    if (!response.ok) {
      throw new Error(`HTTP error: ${response.status}`);
    }
    const data = await response.json();
    // console.log(data.age);
    sessionStorage.setItem("userAge", `${data.age}`);
    return sessionStorage.getItem("userAge");
  } catch (error) {
    console.error(`Couldn't get data: ${error}`);
  }
}
fetchUserAge();

async function getUserData() {
  const userName = await fetchUserName();
  const userEmail = await fetchUserEmail();
  const userAge = await fetchUserAge();
  const userData = {
    name: userName,
    email: userEmail,
    age: userAge,
  };
  console.log("User datas are:", userData);
}
getUserData();
