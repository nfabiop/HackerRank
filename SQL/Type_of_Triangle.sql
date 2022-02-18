SELECT 
CASE WHEN (A=B AND B=C) THEN 'Equilateral'
     WHEN (A+B>C AND A+C>B AND B+C>A) AND ((A=B AND B<>C) OR (A=C AND C<>B) OR (B=C AND C<>A)) THEN 'Isosceles'
     WHEN (A<>B AND A<>C AND C<>B AND A+B>C AND A+C>B AND B+C>A) THEN 'Scalene'
     ELSE 'Not A Triangle'
END
FROM TRIANGLES;