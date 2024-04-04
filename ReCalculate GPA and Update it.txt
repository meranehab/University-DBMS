create or replace trigger Update_GPA_Trigger
after insert or delete or update of CourseGrades on Grades
begin
    update_GPA; 
end;
/
