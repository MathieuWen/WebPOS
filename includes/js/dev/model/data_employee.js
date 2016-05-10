

window.data_employee = new database({
   tbname : 'data_employee',
   index : 'employee_id',
   no : 'employee_no',
   clumn : {
      'employee_id' : 'id', 
      'employee_no' : 'no', 
      'employee_name' : 'name', 
      'employee_sex' : 'sex', 
      'employee_cardnum' : 'card',
      'employee_pass' : 'pass',
      'employee_tel' : 'tel',
      'employee_fax' : 'fax',
      'employee_birthday' : 'birth',
      'employee_level' : 'level',
      'employee_mobile' : 'mobile',
      'employee_email' : 'email'
   },
   start : 1,
   limit : 12,
   orderclumn: 'employee_no',
   where : 'employee_id > 0'
});

