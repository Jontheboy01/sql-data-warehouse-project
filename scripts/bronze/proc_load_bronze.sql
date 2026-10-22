CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @batch_start_time DATETIME, @batch_end_time DATETIME
	DECLARE @start_time DATETIME, @end_time DATETIME
	PRINT '==============================';
	PRINT 'Loading Bronze Layer';
	PRINT '==============================';

	PRINT '------------------------------';
	PRINT 'Loading CRM Tables';
	PRINT '------------------------------';

	PRINT '----------------------';
	PRINT 'Loading cust_info';
	PRINT '----------------------';
	SET @batch_start_time = GETDATE()
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_cust_info;
	BULK INSERT bronze.crm_cust_info
	FROM 'D:\SQL\sql-data-warehouse-project\01_datasets\source_crm\cust_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE()
	PRINT 'Load Time: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT '----------------------';
	PRINT 'Loading prd_info';
	PRINT '----------------------';
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_prd_info;
	BULK INSERT bronze.crm_prd_info
	FROM 'D:\SQL\sql-data-warehouse-project\01_datasets\source_crm\prd_info.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE()
	PRINT 'Load Time: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT '----------------------';
	PRINT 'Loading sales_details';
	PRINT '----------------------';
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.crm_sales_details;
	BULK INSERT bronze.crm_sales_details
	FROM 'D:\SQL\sql-data-warehouse-project\01_datasets\source_crm\sales_details.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE()
	PRINT 'Load Time: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT '------------------------------';
	PRINT 'Loading ERP Tables';
	PRINT '------------------------------';

	PRINT '----------------------';
	PRINT 'Loading cust_az12';
	PRINT '----------------------';
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.erp_cust_az12;
	BULK INSERT bronze.erp_cust_az12
	FROM 'D:\SQL\sql-data-warehouse-project\01_datasets\source_erp\CUST_AZ12.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE()
	PRINT 'Load Time: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT '----------------------';
	PRINT 'Loading loc_a101';
	PRINT '----------------------';
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.erp_loc_a101;
	BULK INSERT bronze.erp_loc_a101
	FROM 'D:\SQL\sql-data-warehouse-project\01_datasets\source_erp\LOC_A101.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE()
	PRINT 'Load Time: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT '----------------------';
	PRINT 'Loading px_cat_g1v2';
	PRINT '----------------------';
	SET @start_time = GETDATE();
	TRUNCATE TABLE bronze.erp_px_cat_g1v2;
	BULK INSERT bronze.erp_px_cat_g1v2
	FROM 'D:\SQL\sql-data-warehouse-project\01_datasets\source_erp\PX_CAT_G1V2.csv'
	WITH (
		FIRSTROW = 2,
		FIELDTERMINATOR = ',',
		TABLOCK
	);
	SET @end_time = GETDATE()
	SET @batch_end_time = GETDATE()
	PRINT 'Load Time: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';

	PRINT 'Total Load Time: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
END
