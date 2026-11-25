const test = require('node:test');
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

test('arquivos essenciais da aplicação existem', () => {
  assert.equal(fs.existsSync(path.join(__dirname, '..', 'index.js')), true);
  assert.equal(fs.existsSync(path.join(__dirname, '..', 'package.json')), true);
});