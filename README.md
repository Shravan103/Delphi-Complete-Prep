SELECT 
  pa.assignment_id,
  p.project_id,
  p.title AS project_title,
  m.name AS manager_name,
  e.name AS employee_name
FROM project_assignments pa
JOIN projects p ON pa.project_id = p.project_id
JOIN users m ON pa.manager_id = m.user_id
JOIN users e ON pa.employee_id = e.user_id;
