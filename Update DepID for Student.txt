
create or replace trigger UpdateDepartmentTrigger
before update of DepartmentID on Students
for each row
declare
    OldDepartmentID varchar2(60);
begin
    if :old.DepartmentID <> :new.DepartmentID then
        OldDepartmentID := :old.DepartmentID;

    insert into OldCourses (StudentID, CourseID, CourseGrades)
    select :new.StudentID, CourseID, CourseGrades
    from Grades
    where StudentID = :new.StudentID and CourseID in (
        select CourseID from Courses where DepartmentID = OldDepartmentID
    );

    delete from Grades
    where StudentID = :new.StudentID and CourseID in (
        select CourseID from Courses where DepartmentID = OldDepartmentID
    );
    
    update Students
    set GPA = 0
    where StudentID = :new.StudentID;
    end if;
end;
/