SELECT
    FIO + ' поступил в ' + Cast(Year AS nvarchar) 
    AS "О поступлении"
    FROM
        Student;