数据库操作


1. 查询某个字符串

> select * from table where field_name like 'xxx';

> 模糊匹配

> select * from table where field_name like '%xxx';

2. 创建数据库表

> create table table_name (field column_type);

3. 添加表字段

> alter table user add <field_name> <field_type>

> 同时添加多个字段

```
alter table user add (
  `name` varchar(100),
  `phone` varchar(50)
)
```

4. 修改表字段

> alter table xxx modify name varchar(100)


5. 删除一条数据

> delete from user where name='xxx';