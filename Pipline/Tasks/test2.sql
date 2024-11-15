WITH LastMonthSales AS (
    SELECT 
        ProductID,
        SUM(SalesAmount) AS TotalSales
    FROM 
        Sales
    WHERE 
        SaleDate >= DATEADD(MONTH, -1, GETDATE())
        AND SaleDate < GETDATE()
    GROUP BY 
        ProductID
),
RankedProducts AS (
    SELECT 
        ProductID,
        TotalSales,
        RANK() OVER (ORDER BY TotalSales DESC) AS SalesRank
    FROM 
        LastMonthSales
)
SELECT 
    ProductID,
    TotalSales
FROM 
    RankedProducts
WHERE 
    SalesRank <= 5;otal_quantity
FROM 
    TopFiveProducts
WHERE 
    rank <= 5;eProducts t
JOIN 
    products p ON t.product_id = p.product_id
WHERE 
    t.product_rank <= 5;