

SELECT name 
FROM sys.default_constraints 
WHERE parent_object_id = OBJECT_ID('transactions') 
AND parent_column_id = COLUMNPROPERTY(OBJECT_ID('transactions'), 'timestamp', 'ColumnId');

