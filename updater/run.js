const fs = require('fs');
const path = require('path');
const csv = require('fast-csv');

const rows = fs.createReadStream(path.resolve(__dirname, 'assets', 'Test.csv'))
    