create or replace procedure CalculateCompletedHours(p_StudentID in varchar2)
is
    v_CompletedHours number := 0;
begin
    select nvl(sum(CreditHours), 0)
    into v_CompletedHours
    from Courses
    where CourseID in (
        select CourseID
        from Grades
        where StudentID = p_StudentID and CourseGrades >= 65
    );

    update Students
    set CompletedHours = v_CompletedHours
    where StudentID = p_StudentID;
    
    dbms_output.put_line('Completed hours calculated and updated successfully.');
exception
    when others then
        dbms_output.put_line('Error: ' || sqlerrm);
end;
/

declare
    v_StudentID varchar2(60) := '320200316'; 
begin
    CalculateCompletedHours(v_StudentID);
end;
/
