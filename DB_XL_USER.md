
@EndUserText.label : 'Excel User details Table'
@AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
@AbapCatalog.tableCategory : #TRANSPARENT
@AbapCatalog.deliveryClass : #A
@AbapCatalog.dataMaintenance : #RESTRICTED
define table zvije_excel_user {

  key end_user          : syuname not null;
  key file_id           : sysuuid_x16 not null;
  file_status           : abap.char(20);
  attachment            : abap.rawstring(0);
  mimetype              : abap.char(128);
  filename              : abap.char(128);
  local_created_by      : abp_creation_user;
  local_created_at      : abp_creation_tstmpl;
  local_last_changed_by : abp_locinst_lastchange_user;
  local_last_changed_at : abp_locinst_lastchange_tstmpl;
  last_changed_at       : abp_lastchange_tstmpl;

}
