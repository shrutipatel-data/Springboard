/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2014                    */
/* Created on:     9/2/2021 3:48:41 PM                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NYC_YELLOW_TAXI_TRIP_FC') and o.name = 'FK_NYC_YELL_REFERENCE_TAXI_ZON1')
alter table NYC_YELLOW_TAXI_TRIP_FC
   drop constraint FK_NYC_YELL_REFERENCE_TAXI_ZON1
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('NYC_YELLOW_TAXI_TRIP_FC') and o.name = 'FK_NYC_YELL_REFERENCE_TAXI_ZON2')
alter table NYC_YELLOW_TAXI_TRIP_FC
   drop constraint FK_NYC_YELL_REFERENCE_TAXI_ZON2
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
            and   type = 'U')
   drop table NYC_YELLOW_TAXI_TRIP_FC
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAXI_ZONE_DM')
            and   type = 'U')
   drop table TAXI_ZONE_DM
go

/*==============================================================*/
/* Table: NYC_YELLOW_TAXI_TRIP_FC                               */
/*==============================================================*/
create table NYC_YELLOW_TAXI_TRIP_FC (
   PULOCATIONID         int                  null,
   DOLOCATIONID         int                  null,
   VENDORID             int                  null,
   TPEP_PICKUP_DATETIME datetime             null,
   TPEP_DROPOFF_DATETIME datetime             null,
   PASSENGER_COUNT      int                  null,
   TRIP_DISTANCE        float                null,
   RATECODEID           int                  null,
   STORE_AND_FWD_FLAG   bit                  null,
   PAYMENT_TYPE         int                  null,
   FARE_AMOUNT          float                null,
   EXTRA                float                null,
   MTA_TAX              float                null,
   TIP_AMOUNT           float                null,
   TOLLS_AMOUNT         float                null,
   IMPROVEMENT_SURCHARGE float                null,
   TOTAL_AMOUNT         float                null,
   CONGESTION_SURCHARGE float                null
)
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'PULOCATIONID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'PULOCATIONID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'TLC Taxi Zone in which the taximeter was engaged',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'PULOCATIONID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'DOLOCATIONID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'DOLOCATIONID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'TLC Taxi Zone in which the taximeter was disengaged',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'DOLOCATIONID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'VENDORID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'VENDORID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'A code indicating the TPEP provider that provided the record.
   A code indicating the TPEP provider that provided the record. 1= Creative Mobile Technologies, LLC; 2= VeriFone Inc.',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'VENDORID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TPEP_PICKUP_DATETIME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TPEP_PICKUP_DATETIME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date and time when the meter was engaged',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TPEP_PICKUP_DATETIME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TPEP_DROPOFF_DATETIME')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TPEP_DROPOFF_DATETIME'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date and time when the meter was disengaged. ',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TPEP_DROPOFF_DATETIME'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'PASSENGER_COUNT')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'PASSENGER_COUNT'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The number of passengers in the vehicle. ',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'PASSENGER_COUNT'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TRIP_DISTANCE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TRIP_DISTANCE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The elapsed trip distance in miles reported by the taximeter',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TRIP_DISTANCE'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'RATECODEID')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'RATECODEID'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The final rate code in effect at the end of the trip.
   1= Standard rate
   2=JFK
   3=Newark
   4=Nassau or Westchester
   5=Negotiated fare
   6=Group ride',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'RATECODEID'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'STORE_AND_FWD_FLAG')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'STORE_AND_FWD_FLAG'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This flag indicates whether the trip record was held in vehicle
   memory before sending to the vendor, aka “store and forward,”
   because the vehicle did not have a connection to the server.
   Y= store and forward trip
   N= not a store and forward trip
   ',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'STORE_AND_FWD_FLAG'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'PAYMENT_TYPE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'PAYMENT_TYPE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'A numeric code signifying how the passenger paid for the trip.
   1= Credit card
   2= Cash
   3= No charge
   4= Dispute
   5= Unknown
   6= Voided trip',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'PAYMENT_TYPE'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'FARE_AMOUNT')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'FARE_AMOUNT'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The time-and-distance fare calculated by the meter.',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'FARE_AMOUNT'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'EXTRA')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'EXTRA'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Miscellaneous extras and surcharges. Currently, this only includes
   the $0.50 and $1 rush hour and overnight charges.',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'EXTRA'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'MTA_TAX')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'MTA_TAX'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '$0.50 MTA tax that is automatically triggered based on the metered
   rate in use.',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'MTA_TAX'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TIP_AMOUNT')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TIP_AMOUNT'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Tip amount – This field is automatically populated for credit card
   tips. Cash tips are not included.',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TIP_AMOUNT'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TOLLS_AMOUNT')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TOLLS_AMOUNT'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Total amount of all tolls paid in trip. ',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TOLLS_AMOUNT'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'IMPROVEMENT_SURCHARGE')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'IMPROVEMENT_SURCHARGE'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '$0.30 improvement surcharge assessed trips at the flag drop. The
   improvement surcharge began being levied in 2015',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'IMPROVEMENT_SURCHARGE'
go

if exists(select 1 from sys.extended_properties p where
      p.major_id = object_id('NYC_YELLOW_TAXI_TRIP_FC')
  and p.minor_id = (select c.column_id from sys.columns c where c.object_id = p.major_id and c.name = 'TOTAL_AMOUNT')
)
begin
   declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_dropextendedproperty 'MS_Description', 
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TOTAL_AMOUNT'

end


select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The total amount charged to passengers. Does not include cash tips.',
   'user', @CurrentUser, 'table', 'NYC_YELLOW_TAXI_TRIP_FC', 'column', 'TOTAL_AMOUNT'
go

/*==============================================================*/
/* Table: TAXI_ZONE_DM                                          */
/*==============================================================*/
create table TAXI_ZONE_DM (
   LOCATIONID           int                  not null,
   BROROUGH             varchar(75)          null,
   ZONE                 varchar(100)         null,
   SERVICE_ZONE         varchar(75)          null,
   constraint PK_TAXI_ZONE_DM primary key (LOCATIONID)
)
go

alter table NYC_YELLOW_TAXI_TRIP_FC
   add constraint FK_NYC_YELL_REFERENCE_TAXI_ZON1 foreign key (PULOCATIONID)
      references TAXI_ZONE_DM (LOCATIONID)
go

alter table NYC_YELLOW_TAXI_TRIP_FC
   add constraint FK_NYC_YELL_REFERENCE_TAXI_ZON2 foreign key (DOLOCATIONID)
      references TAXI_ZONE_DM (LOCATIONID)
go

