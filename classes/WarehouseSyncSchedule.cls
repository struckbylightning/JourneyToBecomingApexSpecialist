global class WarehouseSyncSchedule implements Schedulable {
  // implement scheduled code here
  global void execute(SchedulableContext sc){

      WarehouseCalloutService.runWarehouseEquipmentSync();
      
  }
}