const admin = require('firebase-admin');
const fs = require('fs');

var serviceAccount = require('./firebaseServiceAccountKey.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

var db = admin.firestore();
db.settings({timestampsInSnapshots: true});
var docRef = db.collection('users').doc('alovelace');

fs.readFile('wrk_output.json', 'utf8', function(err, contents){
  docRef.set(JSON.parse(contents));
});	

//var setAda = docRef.set({
//  first: 'Ada',
//  last: 'Lovelace',
//  born: 1815
//});
