SELECT N,
CASE WHEN P IS NULL THEN 'Root'
     WHEN (N IN (SELECT DISTINCT P FROM BST)) THEN 'Inner'
     ELSE 'Leaf' 
     END AS "Node"
FROM BST
ORDER BY 1 ASC
