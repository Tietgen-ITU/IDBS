using System;
using System.Collections.Generic;
Run();

void Run()
{
    string table = "Rentals";
    string[] R = {"PID", "HID", "PN", "S", "HS", "HZ", "HC"};

    foreach (string column in R)
        foreach (string opposedColumn in R)
            if(column != opposedColumn)
                System.Console.WriteLine(@$"SELECT '{table}: {column} --> {opposedColumn}' AS FD,
CASE WHEN COUNT(*)=0 THEN 'MAY HOLD'
ELSE 'does not hold' END AS VALIDITY
FROM (
SELECT P.{column}
FROM {table} P
GROUP BY P.{column}
HAVING COUNT(DISTINCT P.{opposedColumn}) > 1
) X;{Environment.NewLine}");
}