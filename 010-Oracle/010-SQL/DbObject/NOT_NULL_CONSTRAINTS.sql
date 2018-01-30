WITH
    function long2varchar(i_constraint_name varchar2) return varchar2 as
        l_search_condition LONG;
    begin
        select search_condition into l_search_condition
        from user_constraints where constraint_name = i_constraint_name;
        return substr(l_search_condition, 1, 3000);
    END;
select * from user_constraints where long2varchar(constraint_name) like '%IS NOT NULL'; 
/
