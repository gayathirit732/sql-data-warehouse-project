create or alter procedure bronze.load_bronze as
begin
    declare @start_time datetime, @end_time datetime;
	begin try
	    set @start_time = GETDATE();
		truncate table bronze.crm_cust_info;
		bulk insert bronze.crm_cust_info
		from 'C:\Users\Gayathiri\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with (
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		 );

		truncate table bronze.crm_prd_info;
		bulk insert bronze.crm_prd_info
		from 'C:\Users\Gayathiri\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with (
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		 );

		truncate table bronze.crm_sales_details;
		bulk insert bronze.crm_sales_details
		from 'C:\Users\Gayathiri\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with (
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		 );

		truncate table bronze.erp_cust_az12;
		bulk insert bronze.erp_cust_az12
		from 'C:\Users\Gayathiri\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with (
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		 );

		truncate table bronze.erp_loc_a101;
		bulk insert bronze.erp_loc_a101
		from 'C:\Users\Gayathiri\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with (
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		 );

		truncate table bronze.erp_px_cat_g1v2;
		bulk insert bronze.erp_px_cat_g1v2
		from 'C:\Users\Gayathiri\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with (
		 firstrow = 2,
		 fieldterminator = ',',
		 tablock
		 );
	 set @end_time = GETDATE();
	 print 'Total load time: ' + cast (datediff(second, @start_time, @end_time) as nvarchar) + ' seconds'

     end try
	 begin catch
	 print '=========================================================='
	 print 'Error occurred while loading'
	 print 'Error message: ' + error_message();
	 print 'Error number: ' + cast (error_number() as nvarchar);
	 print 'Error state: ' + cast (error_state() as nvarchar);
	 print '=========================================================='
	 end catch

end

