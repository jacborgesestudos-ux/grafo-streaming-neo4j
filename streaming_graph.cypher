// =====================
// CONSTRAINTS
// =====================
CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT movie_id IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT series_id IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT genre_id IF NOT EXISTS
FOR (g:Genre) REQUIRE g.id IS UNIQUE;

CREATE CONSTRAINT actor_id IF NOT EXISTS
FOR (a:Actor) REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT director_id IF NOT EXISTS
FOR (d:Director) REQUIRE d.id IS UNIQUE;


// =====================
// USERS
// =====================
CREATE
(:User {id:1, name:"Ana"}),
(:User {id:2, name:"Bruno"}),
(:User {id:3, name:"Carlos"}),
(:User {id:4, name:"Daniela"}),
(:User {id:5, name:"Eduardo"}),
(:User {id:6, name:"Fernanda"}),
(:User {id:7, name:"Gustavo"}),
(:User {id:8, name:"Helena"}),
(:User {id:9, name:"Igor"}),
(:User {id:10, name:"Juliana"});

// =====================
// MOVIES & SERIES
// =====================
CREATE
(:Movie {id:1, title:"Matrix", year:1999}),
(:Movie {id:2, title:"Inception", year:2010}),
(:Movie {id:3, title:"Interstellar", year:2014}),
(:Movie {id:4, title:"Avatar", year:2009}),
(:Movie {id:5, title:"Titanic", year:1997}),
(:Series {id:6, title:"Breaking Bad", year:2008}),
(:Series {id:7, title:"Stranger Things", year:2016}),
(:Series {id:8, title:"Dark", year:2017}),
(:Series {id:9, title:"The Office", year:2005}),
(:Series {id:10, title:"Game of Thrones", year:2011});

// =====================
// GENRES
// =====================
CREATE
(:Genre {id:1, name:"Sci-Fi"}),
(:Genre {id:2, name:"Drama"}),
(:Genre {id:3, name:"Action"}),
(:Genre {id:4, name:"Comedy"}),
(:Genre {id:5, name:"Fantasy"});

// =====================
// ACTORS & DIRECTORS
// =====================
CREATE
(:Actor {id:1, name:"Keanu Reeves"}),
(:Actor {id:2, name:"Leonardo DiCaprio"}),
(:Actor {id:3, name:"Bryan Cranston"}),
(:Actor {id:4, name:"Millie Bobby Brown"}),

(:Director {id:1, name:"Wachowski"}),
(:Director {id:2, name:"Christopher Nolan"}),
(:Director {id:3, name:"James Cameron"});

// =====================
// RELATIONSHIPS
// =====================

// WATCHED
MATCH (u:User {id:1}), (m:Movie {id:1})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {id:2}), (m:Movie {id:2})
CREATE (u)-[:WATCHED {rating:4}]->(m);

MATCH (u:User {id:3}), (s:Series {id:6})
CREATE (u)-[:WATCHED {rating:5}]->(s);

// ACTED_IN
MATCH (a:Actor {id:1}), (m:Movie {id:1})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {id:2}), (m:Movie {id:2})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {id:3}), (s:Series {id:6})
CREATE (a)-[:ACTED_IN]->(s);

// DIRECTED
MATCH (d:Director {id:1}), (m:Movie {id:1})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {id:2}), (m:Movie {id:2})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {id:3}), (m:Movie {id:4})
CREATE (d)-[:DIRECTED]->(m);

// IN_GENRE
MATCH (m:Movie {id:1}), (g:Genre {id:1})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (s:Series {id:6}), (g:Genre {id:2})
CREATE (s)-[:IN_GENRE]->(g);

MATCH (s:Series {id:9}), (g:Genre {id:4})
CREATE (s)-[:IN_GENRE]->(g);
