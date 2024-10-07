SELECT table_name FROM information_schema.tables WHERE table_catalog = 'wfc'
AND table_schema = 'wfc'
AND table_type = 'BASE TABLE'
AND table_name LIKE 'visits_%'