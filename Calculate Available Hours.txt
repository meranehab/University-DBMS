create or replace procedure UpdateAvailableHours(p_StudentID varchar2) is
    v_GPA number;
    v_AvailableHours number;
begin
    select GPA into v_GPA from Students where StudentID = p_StudentID;
    v_AvailableHours := case
                            when v_GPA <= 1.5 then 12
                            else 18
                        end;

    update Students
    set AvailableHours = v_AvailableHours
    where StudentID = p_StudentID;
end UpdateAvailableHours;
/

begin
    UpdateAvailableHours('320200311');
end;
/
