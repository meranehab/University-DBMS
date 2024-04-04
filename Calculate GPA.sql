create or replace procedure update_GPA 
is
TotalCreditPoints float := 0;
TotalHours number := 0;
gpaa number(3,2) := 0;

begin 
    for student_record in (Select distinct StudentID from Grades)
    loop 
        declare
        v_StudentID varchar2(60) := student_record.StudentID;
        cursor GradeCursor 
           is
           select Grades.StudentID, Grades.CourseID, Courses.CreditHours, Grades.COURSEGRADES
           from Grades join Courses on Grades.CourseID = Courses.CourseID
           where Grades.StudentID = v_StudentID;
           begin
                for course_record in GradeCursor 
                loop
                   TotalHours := TotalHours + course_record.CreditHours;
                   if course_record.COURSEGRADES >= 93 then TotalCreditPoints := TotalCreditPoints + (4 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 90 then TotalCreditPoints := TotalCreditPoints + (3.7 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 87 then TotalCreditPoints := TotalCreditPoints + (3.3 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 83 then TotalCreditPoints := TotalCreditPoints + (3 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 80 then TotalCreditPoints := TotalCreditPoints + (2.7 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 77 then TotalCreditPoints := TotalCreditPoints + (2.3 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 73 then TotalCreditPoints := TotalCreditPoints + (2 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 70 then TotalCreditPoints := TotalCreditPoints + (1.7 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 67 then TotalCreditPoints := TotalCreditPoints + (1.3 * course_record.CreditHours);
                   elsif course_record.COURSEGRADES >= 65 then TotalCreditPoints := TotalCreditPoints + (1 * course_record.CreditHours);
                   else  TotalCreditPoints := TotalCreditPoints + (0 * course_record.CreditHours);
                   end if;
                   
                  
               end loop;
                   gpaa := TotalCreditPoints / TotalHours;
                  
                  update Students
                  set GPA = gpaa
                 where StudentID = v_StudentID;
               end;
          end loop;
end;

declare
begin 
update_GPA ;
end ; 
