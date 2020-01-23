import knex from 'knex';

export const db = knex({
  client: 'mysql',
  connection: {
    host : 'mysql.fleur',
    user : 'fleur',
    password : 'fleur',
    database : 'fleur'
  }
});

export default db;
