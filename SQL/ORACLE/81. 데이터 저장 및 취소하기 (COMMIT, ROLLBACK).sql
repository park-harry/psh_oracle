insert into dept values (60,'aaa','bbb');
savepoint a;
insert into dept values (70,'bbb','ccc');
savepoint b;
insert into dept values (80,'ccc','ddd');
savepoint c;

delete from dept;

select * from dept;

rollback to b;

