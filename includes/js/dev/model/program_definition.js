
window.program_definition = new database({
   tbname : 'program_definition',
   index : 'program_id',
   no: 'class_no',
   clumn : {
      'program_id' : 'id', 
      'program_no' : 'no', 
      'program_label' : 'name', 
      'program_name' : 'action',
      'program_active' : 'active'
   },
   start : 1,
   limit : 12,
   orderclumn: 'program_no',
   where : 'program_active = 1'
});  