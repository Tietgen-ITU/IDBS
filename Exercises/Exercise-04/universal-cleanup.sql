-- ---------------------------------------------------------------------
select 'Cleaning up' as message;

begin transaction;
do 
$$
declare 
	r record;
	s TEXT;
begin
	for r in 	select table_schema,table_name
			from information_schema.views
			where table_schema = 'public'
	loop
                s := 'DROP VIEW ' ||  quote_ident(r.table_schema) || '.' || quote_ident(r.table_name) || ' CASCADE;';

		begin
			execute s;
			raise notice 's = % ',s;
		exception when others then
			raise notice 'Error (may already be dropped): %', s;
		end;
	end loop;
end
$$;
commit;

begin transaction;
do 
$$
declare 
	r record;
	s TEXT;
begin
	for r in 	select trigger_schema, trigger_name, event_object_table
			from information_schema.triggers
			where trigger_schema = 'public'
	loop
                s := 'DROP TRIGGER ' || quote_ident(r.trigger_name) || ' ON ' || quote_ident(r.event_object_table) || ';';
                
		begin
			execute s;
			raise notice 's = % ',s;
		exception when others then
			raise notice 'Error (may already be dropped): %', s;
		end;
	end loop;
end
$$;
commit;

begin transaction;
do 
$$
declare 
	r record;
	s TEXT;
begin
	for r in 	select 'DROP FUNCTION ' || ns.nspname || '.' || proname || '(' || oidvectortypes(proargtypes) || ');' as query
			from pg_proc inner join pg_namespace ns on (pg_proc.pronamespace = ns.oid)
			where ns.nspname = 'public'
	loop
                s := r.query;
                
		begin
			execute s;
			raise notice 's = % ',s;
		exception when others then
			raise notice 'Error (may already be dropped): %', s;
		end;
	end loop;
end
$$;
commit;
