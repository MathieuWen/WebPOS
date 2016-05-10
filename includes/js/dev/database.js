var database = function(dbobj){
   var self = this;
   self.limit = 1;
   self.start = 1;
   self.clumn = 'tableClumn';
   self.tbname = 'tableName';
   self.index = 'index';
   self.orderclumn = 'index';
   self.orderby = 'ASC';
   self.where = false;
   self.swhere = '';
   self.sclumn = '';
   self.no = '';
   self.defaultTransfer = 'local';
   self.url = window.RESTURL;
   self.Config = {};
   self.Zdb=null;

   (function(){
      if(window.openDatabase !== undefined){
         try{
            self.Zdb = window.openDatabase('zpos', '1.0', "ZDNPOS", 1024*512);
         }catch(err){
            console.log(err.message);
            self.defaultTransfer = 'server';
         }
      }else{
         self.defaultTransfer = 'server';
      }  
   
      self.Config = JSON.parse(  localStorage.getItem('ZConfig') );
      self.defaultTransfer = Config.default_database || self.defaultTransfer;
      self.limit = dbobj.limit || 12;
      self.start = dbobj.start || 1;
      self.clumn = dbobj.clumn;
      self.tbname = dbobj.tbname || '';
      self.index = dbobj.index;
      self.no = dbobj.no || '';
      self.orderclumn = dbobj.orderclumn || self.index;
      self.orderby = dbobj.orderby || 'ASC';
      self.where = dbobj.where || false;
      self.swhere = self.where ? 'WHERE '+self.where : '';
   
      for(var key in self.clumn){
         self.sclumn += '`'+key+'` AS `'+self.clumn[key]+'`,';
      }
      self.sclumn = self.sclumn.substr(0, self.sclumn.length-1);

   })();
   

      self.getproperties = function(){
         return {
            limit : self.limit,
            start : self.start,
            clumn : self.clumn,
            tbname : self.tbname,
            index : self.index,
            orderclumn : self.orderclumn,
            orderby : self.orderby,
            where : self.where,
            swhere : self.swhere,
            sclumn : self.sclumn,
            defaultTransfer : self.defaultTransfer,
            Config : self.Config,
            Zdb: self.Zdb
         }
      }
      
		self.serverQuery = function(sql, fn){
         //console.log(sql);
			$.getJSON(self.url,{
				sql: sql.replace(/\'\{{1,}|\}\'{1,}/ig, ''),
				action: 'query',
				timestamp: (new Date()).getTime()
			}, function(data){
				fn.apply({data:data});
			});		
		},      
		
		self.serverExecute = function(sql, fn){
			$.getJSON(self.url,{
				sql: sql.replace(/\'\{{1,}|\}\'{1,}/ig, ''),
				action: 'execute',
				timestamp: (new Date()).getTime()
			}, function(data){
            if(!!fn){
               fn.apply({data:data});
            }
			});
		},
	  
		self.localQuery = function(sql, fn){
         try{
            if(self.Zdb){
               self.Zdb.readTransaction(function(tx){
                  tx.executeSql(sql.replace(/\'\{{1,}|\}\'{1,}|\`/ig, ''), [], function(ty, resultSet) {
                     var length = resultSet.rows.length;
                     var tmp = [];
                     if(length){
                        for(var i = 0; i < length; i++){
                           tmp.push(resultSet.rows.item(i));
                        }
                     }else{
                        tmp = 0;
                     }
                     fn.apply({dsn:ty, data:tmp});
                  }, function(ty, err) {
                     console.log('query process error:'+err.message);
                  });
               });
            }else{
               console.log('存取資料庫錯誤');
               self.defaultTransfer = 'server';
            }
         }catch(err){
            console.log('連線錯誤:'+err.message);
            self.defaultTransfer = 'server';
         }
		}
		
		self.localExecute = function(sql, fn){
         try{
            if(self.Zdb){
               self.Zdb.transaction(function(tx){
                  tx.executeSql(sql.replace(/\'\{{1,}|\}\'{1,}/ig, ''), [], function(ty, resultSet) {
                     if(!!fn){
                        fn.apply({dsn:ty, data:resultSet});
                     }
                  }, function(ty, err) {
                     console.log('query process error:'+err.message);
                  });
               });
            }else{
               console.log('存取資料庫錯誤');
               self.defaultTransfer = 'server';
            }
         }catch(err){
            console.log('連線錯誤:'+err.message);
            self.defaultTransfer = 'server';
         }
		}
		
		self.xmlQuery = function(parameter, fn){
         $.ajax({
            url: parameter.url,
            type: 'GET',
            dataType: 'xml',
            timeout: 1000,
            error: function(xml){
               console.log('讀取xml錯誤'+xml);
            },
            success: function(xml){
               if(xml){
                  var tstart = parameter.start-1;
                  var tend = parameter.limit+tstart;
                  var data = [];
                  $(xml).find(tbname).each(function(i){
                     if( i>=tstart && i < tend){
                        var dataObj = {};
                        for(var key in self.clumn){
                           dataObj[key] = $(self.clumn[key], this).text();
                        }
                        data.push(dataObj);
                     }
                  });
                  
                  fn.apply({data:data});
               }
            }
         });
		}
      
		self.queryAll = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
			var sql = "SELECT "+self.sclumn+" FROM `"+self.tbname+"` "+self.swhere+" ORDER BY "+orderclumn+" "+orderby+";";
			self[transfer+'Query'](sql, fn);
		}
      
		self.queryRange = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
         var tmp_where = [""], where = parameter.where;
         for(var key in where){
            if(where.hasOwnProperty(key)){
               tmp_where.push((new String()).concat(" `", key, "` ", "=", "'", where[key], "'"));
            }
         }
			var sql = "SELECT "+self.sclumn+" FROM `"+self.tbname+"` "+self.swhere+" "+tmp_where.join(" AND ")+" ORDER BY "+self.orderclumn+" "+self.orderby+" LIMIT "+parameter.start+","+parameter.limit+";";
			self[transfer+'Query'](sql, fn);
		}
	  
		self.queryById = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
         var sql = "SELECT "+self.sclumn+" FROM `"+self.tbname+"` WHERE `"+self.index+"` = '"+parameter.id+"' LIMIT 1;";
         //var sql = "SELECT "+self.sclumn+" FROM `"+self.tbname+"` WHERE `"+self.index+"` = '"+parameter.id+"';";
        // console.log(sql);
         self[transfer+'Query'](sql, fn);
		}
      
		self.queryByNo = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
			var sql = "SELECT "+self.sclumn+" FROM `"+self.tbname+"` WHERE `"+self.no+"` = '"+parameter.no+"' LIMIT 1;";
        // console.log(sql);
			self[transfer+'Query'](sql, fn);
		}
      
		self.queryByCondition = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
         var tmp_condition = [], condition = parameter.condition;
         for(var key in condition){
            if(condition.hasOwnProperty(key)){
               tmp_condition.push((new String()).concat(" `", key, "` ", "=", "'", condition[key], "'"));
            }
         }
			var sql = "SELECT "+self.sclumn+" FROM `"+self.tbname+"` WHERE "+tmp_condition.join(" AND ")+" LIMIT 1;";
			self[transfer+'Query'](sql, fn);
		}
      
		self.Insert = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
			var tmpClumn=[];
			var tmpValue=[];
			for(var key in parameter){
				tmpClumn.push(key);
				tmpValue.push(parameter[key]);
			}
			var sql = "INSERT INTO "+self.tbname+" ("+tmpClumn.join(",")+") VALUES('"+tmpValue.join("','")+"');";
			self[transfer+'Execute'](sql, fn);
		}
		
		self.Update = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
			var tmp = [];
			for(var key in parameter){
            if(parameter.hasOwnProperty(key)){
               if(key!==self.index){
                  tmp.push("`"+key+"`='"+parameter[key]+"'");
               }
            }
			}
			var sql = "UPDATE "+self.tbname+" SET "+tmp.join(',')+" WHERE `"+self.index+"`='"+parameter[self.index]+"';";
       //  console.log(sql);
			self[transfer+'Execute'](sql, fn);
		}
		
		self.Replace = function(parameter, fn){
         var transfer = parameter.transfer || self.defaultTransfer;
			var tmpClumn=[];
			var tmpValue=[];
			for(var key in parameter){
            if(parameter.hasOwnProperty(key)){
               tmpClumn.push(key);
               tmpValue.push(parameter[key]);
            }
			}
			var sql = ("REPLACE INTO "+self.tbname+" ("+tmpClumn.join(",")+") VALUES('"+tmpValue.join("','")+"');");
       //  console.log(sql);
			self[transfer+'Execute'](sql, fn);		
		}

}

