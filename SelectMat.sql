SELECT wording,
    ROUND(
        coef * 100 / (
            SELECT SUM(coef)
            FROM Matters
        )
    ) as 'percentage'
FROM Matters;
SELECT SUM(coef) as 'SUM COEF'
FROM Matters