
:use mens;
MATCH (winner:Player)-[:WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t)
MATCH (winner)-[:WINNER]->(match)-[:IN_TOURNAMENT]->(t)
WITH winner, match, t
ORDER BY t.year
WITH winner, t,
     collect([(match)<-[:IN_MATCH]-(set:Set)
              WHERE (winner)-[:LOSER]->(set) | set
             ][0]) AS setDropped
             where size(setDropped) = 0
RETURN winner, t;



:use womens;
MATCH (winner:Player)-[:WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t)
MATCH (winner)-[:WINNER]->(match)-[:IN_TOURNAMENT]->(t)
WITH winner, match, t
ORDER BY t.year
WITH winner, t,
     collect([(match)<-[:IN_MATCH]-(set:Set)
              WHERE (winner)-[:LOSER]->(set) | set
             ][0]) AS setDropped
             where size(setDropped) = 0
RETURN winner, t;



:use fabric;



USE fabric.mens
MATCH (winner:Player)-[:WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t)
MATCH (winner)-[:WINNER]->(match)-[:IN_TOURNAMENT]->(t)
WITH winner, match, t
ORDER BY t.year
WITH winner, t,
     collect([(match)<-[:IN_MATCH]-(set:Set)
              WHERE (winner)-[:LOSER]->(set) | set
             ][0]) AS setDropped
             where size(setDropped) = 0
RETURN winner.name AS winner, t.year AS year

UNION ALL

USE fabric.womens
MATCH (winner:Player)-[:WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t)
MATCH (winner)-[:WINNER]->(match)-[:IN_TOURNAMENT]->(t)
WITH winner, match, t
ORDER BY t.year
WITH winner, t,
     collect([(match)<-[:IN_MATCH]-(set:Set)
              WHERE (winner)-[:LOSER]->(set) | set
             ][0]) AS setDropped
             where size(setDropped) = 0
RETURN winner.name AS winner, t.year AS year;



WITH ["Men's", "Women's"] AS tournaments
UNWIND fabric.graphIds() AS graphId
CALL {
  USE fabric.graph(graphId)
  MATCH (winner:Player)-[:WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t)
  MATCH (winner)-[:WINNER]->(match)-[:IN_TOURNAMENT]->(t)
  WITH winner, match, t
  ORDER BY t.year
  WITH winner, t,
       collect([(match)<-[:IN_MATCH]-(set:Set)
                WHERE (winner)-[:LOSER]->(set) | set
               ][0]) AS setDropped
               where size(setDropped) = 0
  RETURN winner, t
}
RETURN tournaments[graphId] AS event, winner.name AS winner, t.year AS year
ORDER BY t.year



WITH ["Men's", "Women's"] AS tournaments
UNWIND fabric.graphIds() AS graphId
CALL {
  USE fabric.graph(graphId)
  MATCH (player)-[:LOSER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t)-[:NEXT_TOURNAMENT*]->(t2),
        (player)-[:WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]->(t2)
  // Exclude paths where the player has been in the final of an earlier tournament
  WHERE  not ((player)-[:LOSER|WINNER]->(:Match {round: "F"})-[:IN_TOURNAMENT]
              ->()-[:NEXT_TOURNAMENT*]->(t))
  RETURN player, t, t2
  }
RETURN player.name, t.year, t2.year, t2.year - t.year AS difference
ORDER BY difference DESC

