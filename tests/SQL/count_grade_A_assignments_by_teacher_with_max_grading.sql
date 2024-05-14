-- Write query to find the number of grade A's given by the teacher who has graded the most assignments
SELECT COUNT(*) AS grade_A_count
FROM assignments
WHERE grade = 'A'
AND teacher_id = (
    SELECT teacher_id
    FROM (
        SELECT teacher_id, COUNT(*) AS assignment_count
        FROM assignments
        WHERE grade IS NOT NULL
        GROUP BY teacher_id
        ORDER BY assignment_count DESC
        LIMIT 1
    ) AS most_assignments_teacher
);
