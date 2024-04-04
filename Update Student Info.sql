create or replace procedure update_student_info(
    v_student_id in varchar2,
    v_new_name in varchar2,
    v_new_phone in varchar2,
    v_new_email in varchar2,
    v_new_level in number,
    v_new_department_id in varchar2
)
is
begin
    update Students
    set
        StudentName = v_new_name,
        PhoneNumber = v_new_phone,
        Mail = v_new_email,
        LevelNumber = v_new_level,
        DepartmentID = v_new_department_id
    where StudentID = v_student_id;

    dbms_output.put_line('Student information updated successfully.');

exception
    when others then
        dbms_output.put_line('Error: ' || sqlerrm);
end;
/

begin
    update_student_info('320200311', 'Farrah Hatem', '01228899620', 'farrahhatem@gmail.com', 3, 'D1');
end;
/